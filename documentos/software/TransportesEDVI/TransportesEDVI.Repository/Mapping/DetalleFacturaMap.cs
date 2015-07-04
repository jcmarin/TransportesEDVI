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
    public class DetalleFacturaMap : EntityTypeConfiguration<DetalleFactura>
    {
        public DetalleFacturaMap()
        {
            // Primary Key
            this.HasKey(t => new { t.IdFactura, t.IdServicio });

            // Properties
            this.Property(t => t.IdFactura)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.IdServicio)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.Descripcion)
                .IsRequired().HasMaxLength(150);

            this.Property(t => t.PrecioUnitario).HasPrecision(9, 2);

            // Table & Column Mappings
            this.ToTable("DetalleFacturas");
            this.Property(t => t.IdFactura).HasColumnName("IdFactura");
            this.Property(t => t.IdServicio).HasColumnName("IdServicio");
            this.Property(t => t.Descripcion).HasColumnName("Descripcion");
            this.Property(t => t.PrecioUnitario).HasColumnName("precioUnitario");

            // Relationships
            this.HasRequired(t => t.Factura)
                .WithMany(t => t.DetalleFacturas)
                .HasForeignKey(d => d.IdFactura).WillCascadeOnDelete(false);
            this.HasRequired(t => t.Servicio)
                .WithMany(t => t.DetalleFacturas)
                .HasForeignKey(d => d.IdServicio).WillCascadeOnDelete(false);

        }
    }
}
