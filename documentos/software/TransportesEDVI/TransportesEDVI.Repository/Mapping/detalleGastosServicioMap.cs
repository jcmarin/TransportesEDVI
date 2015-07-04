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
    public class DetalleGastosServicioMap : EntityTypeConfiguration<DetalleGastosServicio>
    {
        public DetalleGastosServicioMap()
        {
            // Primary Key
            this.HasKey(t => new { t.IdGastosServicio, t.IdServicio });

            // Properties
            this.Property(t => t.IdGastosServicio)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.IdServicio)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.Observaciones)
                .HasMaxLength(250);

            this.Property(t => t.Cantidad)
                .IsRequired();

            this.Property(t => t.Costo)
                .HasPrecision(9, 2)
                .IsRequired();

            this.Ignore(t => t.Total);

            // Table & Column Mappings
            this.ToTable("detalleGastosServicio");
            this.Property(t => t.IdGastosServicio).HasColumnName("IdGastosServicio");
            this.Property(t => t.IdServicio).HasColumnName("IdServicio");
            this.Property(t => t.Fecha).HasColumnName("Fecha");
            this.Property(t => t.Observaciones).HasColumnName("Observaciones");

            // Relationships
            this.HasRequired(t => t.GastosDeServicio)
                .WithMany(t => t.DetalleGastosServicios)
                .HasForeignKey(d => d.IdGastosServicio).WillCascadeOnDelete(false);
            this.HasRequired(t => t.Servicio)
                .WithMany(t => t.DetalleGastosServicios)
                .HasForeignKey(d => d.IdServicio).WillCascadeOnDelete(false);

        }
    }
}
