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
     public class GastosDeServicioMap : EntityTypeConfiguration<GastosDeServicio>
    {
        public GastosDeServicioMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            this.Property(t => t.Id)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            // Properties

            this.Property(t => t.Precio).HasPrecision(9, 2);

            // Table & Column Mappings
            this.ToTable("GastosDeServicios");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.Precio).HasColumnName("Precio");
            this.Property(t => t.IdGuiaRemision).HasColumnName("IdGuiaRemision");

            this.HasRequired(t => t.GuiaRemision)
                .WithMany(t => t.GastosServicio)
                .HasForeignKey(d => d.IdGuiaRemision).WillCascadeOnDelete(false);
        }
    }
}

