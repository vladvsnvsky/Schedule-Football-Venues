using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace MinifootballAppApi.Migrations
{
    /// <inheritdoc />
    public partial class mnew : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "CountriesTable",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    Name = table.Column<string>(type: "text", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CountriesTable", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "RolesTable",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    Name = table.Column<string>(type: "text", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RolesTable", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "UserDetailsTable",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    Phone = table.Column<string>(type: "text", nullable: false),
                    Birthdate = table.Column<DateOnly>(type: "date", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserDetailsTable", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "CitiesTable",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    Name = table.Column<string>(type: "text", nullable: false),
                    CountryId = table.Column<int>(type: "integer", nullable: false),
                    UtcOffset = table.Column<int>(type: "integer", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CitiesTable", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CitiesTable_CountriesTable_CountryId",
                        column: x => x.CountryId,
                        principalTable: "CountriesTable",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AddressTable",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    CityId = table.Column<int>(type: "integer", nullable: false),
                    StreetAndNo = table.Column<string>(type: "text", nullable: false),
                    Latitude = table.Column<double>(type: "double precision", nullable: true),
                    Longitude = table.Column<double>(type: "double precision", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AddressTable", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AddressTable_CitiesTable_CityId",
                        column: x => x.CityId,
                        principalTable: "CitiesTable",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "FieldsTable",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    Name = table.Column<string>(type: "text", nullable: true),
                    Description = table.Column<string>(type: "text", nullable: true),
                    Capacity = table.Column<int>(type: "integer", nullable: true),
                    Width = table.Column<double>(type: "double precision", nullable: false),
                    Length = table.Column<double>(type: "double precision", nullable: false),
                    Phone = table.Column<string>(type: "text", nullable: false),
                    Email = table.Column<string>(type: "text", nullable: true),
                    AddressId = table.Column<int>(type: "integer", nullable: false),
                    BudgetUnits = table.Column<int>(type: "integer", nullable: true),
                    PricePerHourUnits = table.Column<int>(type: "integer", nullable: true),
                    IsActive = table.Column<bool>(type: "boolean", nullable: false),
                    CityId = table.Column<int>(type: "integer", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_FieldsTable", x => x.Id);
                    table.ForeignKey(
                        name: "FK_FieldsTable_AddressTable_AddressId",
                        column: x => x.AddressId,
                        principalTable: "AddressTable",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_FieldsTable_CitiesTable_CityId",
                        column: x => x.CityId,
                        principalTable: "CitiesTable",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "UserEntitiesTable",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    Username = table.Column<string>(type: "text", nullable: true),
                    Token = table.Column<string>(type: "text", nullable: true),
                    Email = table.Column<string>(type: "text", nullable: true),
                    Password = table.Column<string>(type: "text", nullable: true),
                    BudgetUnits = table.Column<int>(type: "integer", nullable: false),
                    AddressId = table.Column<int>(type: "integer", nullable: false),
                    UserDetailsId = table.Column<int>(type: "integer", nullable: false),
                    IsBanned = table.Column<bool>(type: "boolean", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "timestamp with time zone", nullable: true),
                    UserEntityId = table.Column<int>(type: "integer", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserEntitiesTable", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UserEntitiesTable_AddressTable_AddressId",
                        column: x => x.AddressId,
                        principalTable: "AddressTable",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_UserEntitiesTable_UserDetailsTable_UserDetailsId",
                        column: x => x.UserDetailsId,
                        principalTable: "UserDetailsTable",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_UserEntitiesTable_UserEntitiesTable_UserEntityId",
                        column: x => x.UserEntityId,
                        principalTable: "UserEntitiesTable",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "MatchTable",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    FieldId = table.Column<int>(type: "integer", nullable: false),
                    OrganizerId = table.Column<int>(type: "integer", nullable: false),
                    StartTime = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    EndTime = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    NrOfPlayersRequired = table.Column<int>(type: "integer", nullable: false),
                    PlayerCanJoin = table.Column<bool>(type: "boolean", nullable: false),
                    Finished = table.Column<bool>(type: "boolean", nullable: false),
                    Cancelled = table.Column<bool>(type: "boolean", nullable: false),
                    CancelledReason = table.Column<string>(type: "text", nullable: true),
                    GoalsTeam1 = table.Column<int>(type: "integer", nullable: false),
                    GoalsTeam2 = table.Column<int>(type: "integer", nullable: false),
                    PricePerPlayerUnits = table.Column<int>(type: "integer", nullable: false),
                    CurrentNumberOfPlayers = table.Column<int>(type: "integer", nullable: false),
                    MatchBudgetUnits = table.Column<int>(type: "integer", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MatchTable", x => x.Id);
                    table.ForeignKey(
                        name: "FK_MatchTable_FieldsTable_FieldId",
                        column: x => x.FieldId,
                        principalTable: "FieldsTable",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_MatchTable_UserEntitiesTable_OrganizerId",
                        column: x => x.OrganizerId,
                        principalTable: "UserEntitiesTable",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "UserRole",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    UserId = table.Column<int>(type: "integer", nullable: false),
                    RoleId = table.Column<int>(type: "integer", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserRole", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UserRole_RolesTable_RoleId",
                        column: x => x.RoleId,
                        principalTable: "RolesTable",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_UserRole_UserEntitiesTable_UserId",
                        column: x => x.UserId,
                        principalTable: "UserEntitiesTable",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PlayerMatchTable",
                columns: table => new
                {
                    Id = table.Column<int>(type: "integer", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.IdentityByDefaultColumn),
                    PlayerId = table.Column<int>(type: "integer", nullable: false),
                    MatchId = table.Column<int>(type: "integer", nullable: false),
                    MinutesPlayed = table.Column<int>(type: "integer", nullable: true),
                    GoalsScored = table.Column<int>(type: "integer", nullable: true),
                    FoulsCommited = table.Column<int>(type: "integer", nullable: true),
                    IsMVP = table.Column<bool>(type: "boolean", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PlayerMatchTable", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PlayerMatchTable_MatchTable_MatchId",
                        column: x => x.MatchId,
                        principalTable: "MatchTable",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PlayerMatchTable_UserEntitiesTable_PlayerId",
                        column: x => x.PlayerId,
                        principalTable: "UserEntitiesTable",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_AddressTable_CityId",
                table: "AddressTable",
                column: "CityId");

            migrationBuilder.CreateIndex(
                name: "IX_CitiesTable_CountryId",
                table: "CitiesTable",
                column: "CountryId");

            migrationBuilder.CreateIndex(
                name: "IX_FieldsTable_AddressId",
                table: "FieldsTable",
                column: "AddressId");

            migrationBuilder.CreateIndex(
                name: "IX_FieldsTable_CityId",
                table: "FieldsTable",
                column: "CityId");

            migrationBuilder.CreateIndex(
                name: "IX_MatchTable_FieldId",
                table: "MatchTable",
                column: "FieldId");

            migrationBuilder.CreateIndex(
                name: "IX_MatchTable_OrganizerId",
                table: "MatchTable",
                column: "OrganizerId");

            migrationBuilder.CreateIndex(
                name: "IX_PlayerMatchTable_MatchId",
                table: "PlayerMatchTable",
                column: "MatchId");

            migrationBuilder.CreateIndex(
                name: "IX_PlayerMatchTable_PlayerId",
                table: "PlayerMatchTable",
                column: "PlayerId");

            migrationBuilder.CreateIndex(
                name: "IX_UserEntitiesTable_AddressId",
                table: "UserEntitiesTable",
                column: "AddressId");

            migrationBuilder.CreateIndex(
                name: "IX_UserEntitiesTable_UserDetailsId",
                table: "UserEntitiesTable",
                column: "UserDetailsId");

            migrationBuilder.CreateIndex(
                name: "IX_UserEntitiesTable_UserEntityId",
                table: "UserEntitiesTable",
                column: "UserEntityId");

            migrationBuilder.CreateIndex(
                name: "IX_UserRole_RoleId",
                table: "UserRole",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "IX_UserRole_UserId",
                table: "UserRole",
                column: "UserId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "PlayerMatchTable");

            migrationBuilder.DropTable(
                name: "UserRole");

            migrationBuilder.DropTable(
                name: "MatchTable");

            migrationBuilder.DropTable(
                name: "RolesTable");

            migrationBuilder.DropTable(
                name: "FieldsTable");

            migrationBuilder.DropTable(
                name: "UserEntitiesTable");

            migrationBuilder.DropTable(
                name: "AddressTable");

            migrationBuilder.DropTable(
                name: "UserDetailsTable");

            migrationBuilder.DropTable(
                name: "CitiesTable");

            migrationBuilder.DropTable(
                name: "CountriesTable");
        }
    }
}
