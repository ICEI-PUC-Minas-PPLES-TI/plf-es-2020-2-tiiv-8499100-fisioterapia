using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Fisioterapia.Models.Migrations.SqlServerMigrations
{
    public partial class MigCriacaoTabelas : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Atletas",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nome = table.Column<string>(nullable: true),
                    Email = table.Column<string>(nullable: true),
                    Idade = table.Column<DateTime>(nullable: false),
                    LadoDominante = table.Column<string>(nullable: true),
                    Numero = table.Column<int>(nullable: false),
                    Posicao = table.Column<string>(nullable: true),
                    Peso = table.Column<float>(nullable: false),
                    Altura = table.Column<float>(nullable: false),
                    Celular = table.Column<string>(nullable: true),
                    Profissao = table.Column<string>(nullable: true),
                    OcoContusao = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Atletas", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Auxiliars",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Instituicao = table.Column<string>(nullable: true),
                    Periodo = table.Column<int>(nullable: false),
                    Expiracao = table.Column<DateTime>(nullable: false),
                    IdUsuario = table.Column<int>(nullable: false),
                    CPF = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Auxiliars", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Auxiliars_Usuarios_IdUsuario",
                        column: x => x.IdUsuario,
                        principalTable: "Usuarios",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Exercicios",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nome = table.Column<string>(nullable: true),
                    IdUsuario = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Exercicios", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Exercicios_Usuarios_IdUsuario",
                        column: x => x.IdUsuario,
                        principalTable: "Usuarios",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Logs",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IdUsuarioId = table.Column<int>(nullable: true),
                    Index = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Logs", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Logs_Usuarios_IdUsuarioId",
                        column: x => x.IdUsuarioId,
                        principalTable: "Usuarios",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Exames",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    IdAtleta = table.Column<int>(nullable: false),
                    IdUsuario = table.Column<int>(nullable: false),
                    IdAuxiliar = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Exames", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Exames_Atletas_IdAtleta",
                        column: x => x.IdAtleta,
                        principalTable: "Atletas",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Exames_Auxiliars_IdAuxiliar",
                        column: x => x.IdAuxiliar,
                        principalTable: "Auxiliars",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Exames_Usuarios_IdUsuario",
                        column: x => x.IdUsuario,
                        principalTable: "Usuarios",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Auxiliars_IdUsuario",
                table: "Auxiliars",
                column: "IdUsuario");

            migrationBuilder.CreateIndex(
                name: "IX_Exames_IdAtleta",
                table: "Exames",
                column: "IdAtleta");

            migrationBuilder.CreateIndex(
                name: "IX_Exames_IdAuxiliar",
                table: "Exames",
                column: "IdAuxiliar");

            migrationBuilder.CreateIndex(
                name: "IX_Exames_IdUsuario",
                table: "Exames",
                column: "IdUsuario");

            migrationBuilder.CreateIndex(
                name: "IX_Exercicios_IdUsuario",
                table: "Exercicios",
                column: "IdUsuario");

            migrationBuilder.CreateIndex(
                name: "IX_Logs_IdUsuarioId",
                table: "Logs",
                column: "IdUsuarioId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Exames");

            migrationBuilder.DropTable(
                name: "Exercicios");

            migrationBuilder.DropTable(
                name: "Logs");

            migrationBuilder.DropTable(
                name: "Atletas");

            migrationBuilder.DropTable(
                name: "Auxiliars");
        }
    }
}
