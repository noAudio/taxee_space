﻿// <auto-generated />
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using taxee_server.Data;

namespace taxee_server.Migrations
{
    [DbContext(typeof(TaxeeDbContext))]
    [Migration("20211109213424_IndexNameColumn")]
    partial class IndexNameColumn
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 64)
                .HasAnnotation("ProductVersion", "5.0.11");

            modelBuilder.Entity("taxee_server.Models.Body", b =>
                {
                    b.Property<string>("BodyID")
                        .HasColumnType("varchar(255)");

                    b.Property<string>("BodyName")
                        .HasColumnType("longtext");

                    b.Property<long>("SystemID")
                        .HasColumnType("bigint");

                    b.HasKey("BodyID");

                    b.HasIndex("SystemID");

                    b.ToTable("Bodies");
                });

            modelBuilder.Entity("taxee_server.Models.Station", b =>
                {
                    b.Property<string>("StationID")
                        .HasColumnType("varchar(255)");

                    b.Property<string>("StationName")
                        .HasColumnType("longtext");

                    b.Property<long>("SystemID")
                        .HasColumnType("bigint");

                    b.HasKey("StationID");

                    b.HasIndex("SystemID");

                    b.ToTable("Stations");
                });

            modelBuilder.Entity("taxee_server.Models.System", b =>
                {
                    b.Property<long>("SystemID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint");

                    b.Property<string>("name")
                        .HasColumnType("varchar(255)");

                    b.HasKey("SystemID");

                    b.HasIndex("name");

                    b.ToTable("Systems");
                });

            modelBuilder.Entity("taxee_server.Models.Body", b =>
                {
                    b.HasOne("taxee_server.Models.System", null)
                        .WithMany("bodies")
                        .HasForeignKey("SystemID")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("taxee_server.Models.Station", b =>
                {
                    b.HasOne("taxee_server.Models.System", null)
                        .WithMany("Stations")
                        .HasForeignKey("SystemID")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("taxee_server.Models.System", b =>
                {
                    b.OwnsOne("taxee_server.Models.System+Coordinates", "coords", b1 =>
                        {
                            b1.Property<long>("SystemID")
                                .HasColumnType("bigint");

                            b1.Property<float>("x")
                                .HasColumnType("float");

                            b1.Property<float>("y")
                                .HasColumnType("float");

                            b1.Property<float>("z")
                                .HasColumnType("float");

                            b1.HasKey("SystemID");

                            b1.ToTable("Systems");

                            b1.WithOwner()
                                .HasForeignKey("SystemID");
                        });

                    b.Navigation("coords");
                });

            modelBuilder.Entity("taxee_server.Models.System", b =>
                {
                    b.Navigation("bodies");

                    b.Navigation("Stations");
                });
#pragma warning restore 612, 618
        }
    }
}
