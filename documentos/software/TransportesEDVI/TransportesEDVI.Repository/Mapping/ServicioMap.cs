using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Core.Mapping;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Repository.Mapping
{
    public class ServicioMap : EntityTypeConfiguration<Servicio>
    {
        public ServicioMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            //this.Property(t => t.Id)
            //.HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            // Properties

            this.Property(t => t.Descripcion)
                .HasMaxLength(150);

            this.Property(t => t.Estado)
                .IsRequired()
                .HasMaxLength(3);

            this.Property(t => t.TotalGastosServicio)
                .IsRequired()
                .HasPrecision(9, 2);

            // Table & Column Mappings
            this.ToTable("Servicio");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.FechaEmision).HasColumnName("FechaEmision");
            this.Property(t => t.FechaTraslado).HasColumnName("FechaTraslado");
            this.Property(t => t.Descripcion).HasColumnName("Descripcion");
            this.Property(t => t.Estado).HasColumnName("Estado");
            this.Property(t => t.IdEmpleado).HasColumnName("IdEmpleado");
            this.Property(t => t.IdVehiculo).HasColumnName("IdVehiculo");
            this.Property(t => t.IdGuiaRemision).HasColumnName("IdGuiaRemision");

            // Relationships
            this.HasRequired(t => t.Empleado)
                .WithMany(t => t.Servicios)
                .HasForeignKey(d => d.IdEmpleado).WillCascadeOnDelete(false);
            this.HasOptional(t => t.GuiaRemision)
                .WithMany(t => t.Servicios)
                .HasForeignKey(d => d.IdGuiaRemision).WillCascadeOnDelete(false);
            this.HasOptional(t => t.Vehiculo)
                .WithMany(t => t.Servicios)
                .HasForeignKey(d => d.IdVehiculo).WillCascadeOnDelete(false);
        }
    }
}
