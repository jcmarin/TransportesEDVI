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
    public class ContratoMap : EntityTypeConfiguration<Contrato>
    {
        public ContratoMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            this.Property(t => t.Id)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            // Properties
            
            this.Property(t => t.Numero)
                .IsRequired().HasMaxLength(6);
           
            
            // Table & Column Mappings
            this.ToTable("Contrato");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.FechIniContrato).HasColumnName("FechIniContrato");
            this.Property(t => t.FechFinContrato).HasColumnName("FechFinContrato");
            this.Property(t => t.Numero).HasColumnName("Numero");
            this.Property(t => t.IdCliente).HasColumnName("IdCliente");

            // Relationships
            this.HasRequired(t => t.Cliente)
                .WithMany(t => t.Contratoes)
                .HasForeignKey(d => d.IdCliente).WillCascadeOnDelete(false);

        }
    }
}
