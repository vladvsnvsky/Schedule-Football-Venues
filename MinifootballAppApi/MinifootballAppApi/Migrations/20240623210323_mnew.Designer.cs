﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using MinifootballAppApi.Data;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace MinifootballAppApi.Migrations
{
    [DbContext(typeof(MinifootballDbContext))]
    [Migration("20240623210323_mnew")]
    partial class mnew
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.13")
                .HasAnnotation("Relational:MaxIdentifierLength", 63);

            NpgsqlModelBuilderExtensions.UseIdentityByDefaultColumns(modelBuilder);

            modelBuilder.Entity("MinifootballAppApi.Models.Address", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("Id"));

                    b.Property<int>("CityId")
                        .HasColumnType("integer");

                    b.Property<double?>("Latitude")
                        .HasColumnType("double precision");

                    b.Property<double?>("Longitude")
                        .HasColumnType("double precision");

                    b.Property<string>("StreetAndNo")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.HasIndex("CityId");

                    b.ToTable("AddressTable");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.City", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("Id"));

                    b.Property<int>("CountryId")
                        .HasColumnType("integer");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<int>("UtcOffset")
                        .HasColumnType("integer");

                    b.HasKey("Id");

                    b.HasIndex("CountryId");

                    b.ToTable("CitiesTable");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.Country", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("Id"));

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("CountriesTable");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.Field", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("Id"));

                    b.Property<int>("AddressId")
                        .HasColumnType("integer");

                    b.Property<int?>("BudgetUnits")
                        .HasColumnType("integer");

                    b.Property<int?>("Capacity")
                        .HasColumnType("integer");

                    b.Property<int?>("CityId")
                        .HasColumnType("integer");

                    b.Property<string>("Description")
                        .HasColumnType("text");

                    b.Property<string>("Email")
                        .HasColumnType("text");

                    b.Property<bool>("IsActive")
                        .HasColumnType("boolean");

                    b.Property<double>("Length")
                        .HasColumnType("double precision");

                    b.Property<string>("Name")
                        .HasColumnType("text");

                    b.Property<string>("Phone")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<int?>("PricePerHourUnits")
                        .HasColumnType("integer");

                    b.Property<double>("Width")
                        .HasColumnType("double precision");

                    b.HasKey("Id");

                    b.HasIndex("AddressId");

                    b.HasIndex("CityId");

                    b.ToTable("FieldsTable");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.Match", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("Id"));

                    b.Property<bool>("Cancelled")
                        .HasColumnType("boolean");

                    b.Property<string>("CancelledReason")
                        .HasColumnType("text");

                    b.Property<int>("CurrentNumberOfPlayers")
                        .HasColumnType("integer");

                    b.Property<DateTime>("EndTime")
                        .HasColumnType("timestamp with time zone");

                    b.Property<int>("FieldId")
                        .HasColumnType("integer");

                    b.Property<bool>("Finished")
                        .HasColumnType("boolean");

                    b.Property<int>("GoalsTeam1")
                        .HasColumnType("integer");

                    b.Property<int>("GoalsTeam2")
                        .HasColumnType("integer");

                    b.Property<int>("MatchBudgetUnits")
                        .HasColumnType("integer");

                    b.Property<int>("NrOfPlayersRequired")
                        .HasColumnType("integer");

                    b.Property<int>("OrganizerId")
                        .HasColumnType("integer");

                    b.Property<bool>("PlayerCanJoin")
                        .HasColumnType("boolean");

                    b.Property<int>("PricePerPlayerUnits")
                        .HasColumnType("integer");

                    b.Property<DateTime>("StartTime")
                        .HasColumnType("timestamp with time zone");

                    b.HasKey("Id");

                    b.HasIndex("FieldId");

                    b.HasIndex("OrganizerId");

                    b.ToTable("MatchTable");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.Role", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("Id"));

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("RolesTable");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.UserDetails", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("Id"));

                    b.Property<DateOnly>("Birthdate")
                        .HasColumnType("date");

                    b.Property<string>("Phone")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("UserDetailsTable");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.UserEntity", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("Id"));

                    b.Property<int>("AddressId")
                        .HasColumnType("integer");

                    b.Property<int>("BudgetUnits")
                        .HasColumnType("integer");

                    b.Property<DateTime?>("CreatedAt")
                        .HasColumnType("timestamp with time zone");

                    b.Property<string>("Email")
                        .HasColumnType("text");

                    b.Property<bool>("IsBanned")
                        .HasColumnType("boolean");

                    b.Property<string>("Password")
                        .HasColumnType("text");

                    b.Property<string>("Token")
                        .HasColumnType("text");

                    b.Property<int>("UserDetailsId")
                        .HasColumnType("integer");

                    b.Property<int?>("UserEntityId")
                        .HasColumnType("integer");

                    b.Property<string>("Username")
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.HasIndex("AddressId");

                    b.HasIndex("UserDetailsId");

                    b.HasIndex("UserEntityId");

                    b.ToTable("UserEntitiesTable");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.UserMatch", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("Id"));

                    b.Property<int?>("FoulsCommited")
                        .HasColumnType("integer");

                    b.Property<int?>("GoalsScored")
                        .HasColumnType("integer");

                    b.Property<bool>("IsMVP")
                        .HasColumnType("boolean");

                    b.Property<int>("MatchId")
                        .HasColumnType("integer");

                    b.Property<int?>("MinutesPlayed")
                        .HasColumnType("integer");

                    b.Property<int>("PlayerId")
                        .HasColumnType("integer");

                    b.HasKey("Id");

                    b.HasIndex("MatchId");

                    b.HasIndex("PlayerId");

                    b.ToTable("PlayerMatchTable");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.UserRole", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("Id"));

                    b.Property<int>("RoleId")
                        .HasColumnType("integer");

                    b.Property<int>("UserId")
                        .HasColumnType("integer");

                    b.HasKey("Id");

                    b.HasIndex("RoleId");

                    b.HasIndex("UserId");

                    b.ToTable("UserRole");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.Address", b =>
                {
                    b.HasOne("MinifootballAppApi.Models.City", "City")
                        .WithMany()
                        .HasForeignKey("CityId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("City");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.City", b =>
                {
                    b.HasOne("MinifootballAppApi.Models.Country", "Country")
                        .WithMany("Cities")
                        .HasForeignKey("CountryId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Country");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.Field", b =>
                {
                    b.HasOne("MinifootballAppApi.Models.Address", "Address")
                        .WithMany()
                        .HasForeignKey("AddressId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("MinifootballAppApi.Models.City", null)
                        .WithMany("Fields")
                        .HasForeignKey("CityId");

                    b.Navigation("Address");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.Match", b =>
                {
                    b.HasOne("MinifootballAppApi.Models.Field", "Field")
                        .WithMany("Matches")
                        .HasForeignKey("FieldId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("MinifootballAppApi.Models.UserEntity", "Organizer")
                        .WithMany("OrganizedMatches")
                        .HasForeignKey("OrganizerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Field");

                    b.Navigation("Organizer");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.UserEntity", b =>
                {
                    b.HasOne("MinifootballAppApi.Models.Address", "Address")
                        .WithMany()
                        .HasForeignKey("AddressId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("MinifootballAppApi.Models.UserDetails", "UserDetails")
                        .WithMany()
                        .HasForeignKey("UserDetailsId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("MinifootballAppApi.Models.UserEntity", null)
                        .WithMany("Friends")
                        .HasForeignKey("UserEntityId");

                    b.Navigation("Address");

                    b.Navigation("UserDetails");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.UserMatch", b =>
                {
                    b.HasOne("MinifootballAppApi.Models.Match", "Match")
                        .WithMany("Players")
                        .HasForeignKey("MatchId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("MinifootballAppApi.Models.UserEntity", "Player")
                        .WithMany("InvolvedMatches")
                        .HasForeignKey("PlayerId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Match");

                    b.Navigation("Player");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.UserRole", b =>
                {
                    b.HasOne("MinifootballAppApi.Models.Role", "Role")
                        .WithMany("Users")
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("MinifootballAppApi.Models.UserEntity", "User")
                        .WithMany("UserRoles")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Role");

                    b.Navigation("User");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.City", b =>
                {
                    b.Navigation("Fields");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.Country", b =>
                {
                    b.Navigation("Cities");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.Field", b =>
                {
                    b.Navigation("Matches");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.Match", b =>
                {
                    b.Navigation("Players");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.Role", b =>
                {
                    b.Navigation("Users");
                });

            modelBuilder.Entity("MinifootballAppApi.Models.UserEntity", b =>
                {
                    b.Navigation("Friends");

                    b.Navigation("InvolvedMatches");

                    b.Navigation("OrganizedMatches");

                    b.Navigation("UserRoles");
                });
#pragma warning restore 612, 618
        }
    }
}
