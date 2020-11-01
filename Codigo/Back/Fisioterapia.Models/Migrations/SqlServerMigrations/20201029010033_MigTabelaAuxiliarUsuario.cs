using Microsoft.EntityFrameworkCore.Migrations;

namespace Fisioterapia.Models.Migrations.SqlServerMigrations
{
    public partial class MigTabelaAuxiliarUsuario : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AuxiliarUsuarios",
                columns: table => new
                {
                    IdUsuario = table.Column<int>(nullable: false),
                    IdAuxiliar = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AuxiliarUsuarios", x => new { x.IdUsuario, x.IdAuxiliar });
                    table.ForeignKey(
                        name: "FK_AuxiliarUsuarios_Auxiliars_IdAuxiliar",
                        column: x => x.IdAuxiliar,
                        principalTable: "Auxiliars",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.NoAction);
                    table.ForeignKey(
                        name: "FK_AuxiliarUsuarios_Usuarios_IdUsuario",
                        column: x => x.IdUsuario,
                        principalTable: "Usuarios",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.NoAction);
                });

            migrationBuilder.CreateIndex(
                name: "IX_AuxiliarUsuarios_IdAuxiliar",
                table: "AuxiliarUsuarios",
                column: "IdAuxiliar");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AuxiliarUsuarios");
        }
    }
}
