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
    public class GuiaRemisionMap : EntityTypeConfiguration<GuiaRemision>
    {
        public GuiaRemisionMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            this.Property(t => t.Id)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            // Properties
            this.Property(t => t.NroGuias)
                .IsRequired().HasMaxLength(10);

            this.Property(t => t.Estado)
                .IsRequired().HasMaxLength(3);

            this.Property(t => t.PesoTotal)
                .IsRequired().HasPrecision(9,2);

            // Table & Column Mappings
            this.ToTable("GuiaRemision");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.NroGuias).HasColumnName("NroGuias");
            this.Property(t => t.PesoTotal).HasColumnName("PesoTotal");
            this.Property(t => t.Estado).HasColumnName("Estado");
        }
    }
}
