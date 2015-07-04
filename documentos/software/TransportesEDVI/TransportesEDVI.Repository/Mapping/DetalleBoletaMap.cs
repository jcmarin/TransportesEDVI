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
    public class DetalleBoletaMap : EntityTypeConfiguration<DetalleBoleta>
    {
        public DetalleBoletaMap()
        {
            // Primary Key
            this.HasKey(t => new { t.IdBoletas, t.IdServicio });

            // Properties
            this.Property(t => t.IdBoletas)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.IdServicio)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.Descripcion)
                .IsRequired().HasMaxLength(50);

            this.Property(t => t.PrecioUnitario).HasPrecision(9, 2);

            this.Property(t => t.Monto).HasPrecision(9, 2);

            // Table & Column Mappings
            this.ToTable("DetalleBoletas");
            this.Property(t => t.IdBoletas).HasColumnName("idBoletas");
            this.Property(t => t.IdServicio).HasColumnName("IdServicio");
            this.Property(t => t.Descripcion).HasColumnName("Descripcion");
            this.Property(t => t.Monto).HasColumnName("Monto");
            this.Property(t => t.PrecioUnitario).HasColumnName("PrecioUnitario");

            // Relationships
            this.HasRequired(t => t.Boleta)
                .WithMany(t => t.DetalleBoletas)
                .HasForeignKey(d => d.IdBoletas).WillCascadeOnDelete(false);
            this.HasRequired(t => t.Servicio)
                .WithMany(t => t.DetalleBoletas)
                .HasForeignKey(d => d.IdServicio).WillCascadeOnDelete(false);

        }
    }
}
