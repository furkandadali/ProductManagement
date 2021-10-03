using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Entities.Migrations
{
    public partial class AddedLogTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Logs",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Guid = table.Column<string>(nullable: true),
                    LogLevel = table.Column<string>(nullable: true),
                    UserId = table.Column<string>(nullable: true),
                    PageUrl = table.Column<string>(nullable: true),
                    Parameters = table.Column<string>(nullable: true),
                    ExceptionMessage = table.Column<string>(nullable: true),
                    InnerException = table.Column<string>(nullable: true),
                    InInnerExceptionMessage = table.Column<string>(nullable: true),
                    RequestType = table.Column<string>(nullable: true),
                    StackTrace = table.Column<string>(nullable: true),
                    Method = table.Column<string>(nullable: true),
                    Action = table.Column<string>(nullable: true),
                    IpAddress = table.Column<string>(nullable: true),
                    CreatedDate = table.Column<DateTime>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Logs", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Logs");
        }
    }
}
