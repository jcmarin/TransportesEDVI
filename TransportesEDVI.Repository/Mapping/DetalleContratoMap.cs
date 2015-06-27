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
    public class DetalleContratoMap : EntityTypeConfiguration<DetalleContrato>
    {
        public DetalleContratoMap()
        {
            // Primary Key
            this.HasKey(t => new { t.RutaId, t.ContratoId });

            // Properties
            this.Property(t => t.RutaId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.ContratoId)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.MontoXTonelada).HasPrecision(9, 2);

            this.Property(t => t.Total).HasPrecision(9, 2);


            // Table & Column Mappings
            this.ToTable("DetalleContrato");
            this.Property(t => t.RutaId).HasColumnName("rutaId");
            this.Property(t => t.ContratoId).HasColumnName("ContratoId");
            this.Property(t => t.MontoXTonelada).HasColumnName("MontoXTonelada");
            this.Property(t => t.Total).HasColumnName("Total");
     
            // Relationships
            this.HasRequired(t => t.Contrato)
                .WithMany(t => t.DetalleContratoes)
                .HasForeignKey(d => d.ContratoId).WillCascadeOnDelete(false);
            this.HasRequired(t => t.Ruta)
                .WithMany(t => t.DetalleContratoes)
                .HasForeignKey(d => d.RutaId).WillCascadeOnDelete(false);

     
        }
    }
}
