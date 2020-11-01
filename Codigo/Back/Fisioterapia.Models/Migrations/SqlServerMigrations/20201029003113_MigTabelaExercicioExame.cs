using Microsoft.EntityFrameworkCore.Migrations;

namespace Fisioterapia.Models.Migrations.SqlServerMigrations
{
    public partial class MigTabelaExercicioExame : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ExamesId",
                table: "Exercicios",
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

        protected override void Down(MigrationBuilder migrationBuilder)
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
        }
    }
}
