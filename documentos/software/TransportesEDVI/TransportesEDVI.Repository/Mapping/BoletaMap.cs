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
    public class BoletaMap : EntityTypeConfiguration<Boleta>
    {
        public BoletaMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            this.Property(t => t.Id)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            // Properties
            this.Property(t => t.NroBoleta)
                .IsRequired().HasMaxLength(7);

            this.Property(t => t.Serie)
                .IsRequired().HasMaxLength(3);

            this.Property(t => t.Estado)
                .IsRequired().HasMaxLength(1);

            // Table & Column Mappings
            this.ToTable("Boleta");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.Fecha).HasColumnName("Fecha");
            this.Property(t => t.NroBoleta).HasColumnName("NroBoleta");
            this.Property(t => t.Serie).HasColumnName("Serie");
            this.Property(t => t.Estado).HasColumnName("Estado");
            this.Property(t => t.IdCliente).HasColumnName("IdCliente");
            this.Property(t => t.IdContrato).HasColumnName("IdContrato");

      
        }
    }
}
