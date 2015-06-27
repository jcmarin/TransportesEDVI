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
    public class FacturaMap : EntityTypeConfiguration<Factura>
    {
        public FacturaMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            this.Property(t => t.Id)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            // Properties
            this.Property(t => t.NroFactura)
                .IsRequired().HasMaxLength(7);

            this.Property(t => t.Serie)
                .IsRequired().HasMaxLength(3);

            this.Property(t => t.Estado)
                .IsRequired().HasMaxLength(3);


            // Table & Column Mappings
            this.ToTable("Facturas");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.Fecha).HasColumnName("Fecha");
            this.Property(t => t.NroFactura).HasColumnName("NroFactura");
            this.Property(t => t.Serie).HasColumnName("Serie");
            this.Property(t => t.Estado).HasColumnName("Estado");
            this.Property(t => t.IdCliente).HasColumnName("IdCliente");
            this.Property(t => t.IdContrato).HasColumnName("IdContrato");

            // Relationships
            this.HasRequired(t => t.Cliente)
                .WithMany(t => t.Facturas)
                .HasForeignKey(d => d.IdCliente).WillCascadeOnDelete(false);
            this.HasRequired(t => t.Contrato)
                .WithMany(t => t.Facturas)
                .HasForeignKey(d => d.IdContrato).WillCascadeOnDelete(false);
        }
    }
}
