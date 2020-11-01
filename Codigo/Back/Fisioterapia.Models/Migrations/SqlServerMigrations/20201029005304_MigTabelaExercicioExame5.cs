using Microsoft.EntityFrameworkCore.Migrations;

namespace Fisioterapia.Models.Migrations.SqlServerMigrations
{
    public partial class MigTabelaExercicioExame5 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Exercicios_Exames_ExamesId",
                table: "Exercicios");

            migrationBuilder.DropIndex(
                name: "IX_Exercicios_ExamesId",
                table: "Exercicios");

            migrationBuilder.DropColumn(
                name: "ExamesId",
                table: "Exercicios");

            migrationBuilder.CreateTable(
                name: "ExameExercicios",
                columns: table => new
                {
                    IdExame = table.Column<int>(nullable: false),
                    IdExercios = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ExameExercicios", x => new { x.IdExame, x.IdExercios });
                    table.ForeignKey(
                        name: "FK_ExameExercicios_Exames_IdExame",
                        column: x => x.IdExame,
                        principalTable: "Exames",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.NoAction);
                    table.ForeignKey(
                        name: "FK_ExameExercicios_Exercicios_IdExercios",
                        column: x => x.IdExercios,
                        principalTable: "Exercicios",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.NoAction);
                });

            migrationBuilder.CreateIndex(
                name: "IX_ExameExercicios_IdExercios",
                table: "ExameExercicios",
                column: "IdExercios");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ExameExercicios");

            migrationBuilder.AddColumn<int>(
                name: "ExamesId",
                table: "Exercicios",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Exercicios_ExamesId",
                table: "Exercicios",
                column: "ExamesId");

            migrationBuilder.AddForeignKey(
                name: "FK_Exercicios_Exames_ExamesId",
                table: "Exercicios",
                column: "ExamesId",
                principalTable: "Exames",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
