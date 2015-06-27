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
    public class GastosMantenimentoMap : EntityTypeConfiguration<GastosMantenimento>
    {
        public GastosMantenimentoMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            this.Property(t => t.Id)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            // Properties
            this.Property(t => t.Total).IsRequired().HasPrecision(9,2);

            this.Property(t => t.ConstoEngrace).HasPrecision(9, 2);

            this.Property(t => t.CostoLubricacion).HasPrecision(9, 2);

            this.Property(t => t.CostoNeumaticos).HasPrecision(9, 2);

            this.Property(t => t.CostoSuspencion).HasPrecision(9, 2);

            this.Property(t => t.CostoMotor).HasPrecision(9, 2);

            this.Property(t => t.CostoCarreta).HasPrecision(9, 2);

            this.Property(t => t.CostoSistemaElectrico).HasPrecision(9, 2);

            this.Property(t => t.OtrosGastos).HasPrecision(9, 2);

            // Table & Column Mappings
            this.ToTable("GastosMantenimento");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.ConstoEngrace).HasColumnName("ConstoEngrace");
            this.Property(t => t.CostoLubricacion).HasColumnName("CostoLubricacion");
            this.Property(t => t.CostoNeumaticos).HasColumnName("CostoNeumaticos");
            this.Property(t => t.CostoSuspencion).HasColumnName("CostoSuspencion");
            this.Property(t => t.CostoMotor).HasColumnName("CostoMotor");
            this.Property(t => t.CostoCarreta).HasColumnName("CostoCarreta");
            this.Property(t => t.CostoSistemaElectrico).HasColumnName("CostoSistemaElectrico");
            this.Property(t => t.OtrosGastos).HasColumnName("OtrosGastos");
            this.Property(t => t.Total).HasColumnName("Total");

        }
    }
}
