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
    public class RutaMap : EntityTypeConfiguration<Ruta>
    {
        public RutaMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            this.Property(t => t.Id)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            // Properties
            this.Property(t => t.Descripcion)
                .IsRequired().HasMaxLength(150);

            this.Property(t => t.Distancia)
                .IsRequired().HasMaxLength(10);

            this.Property(t => t.Origen)
                .IsRequired().HasMaxLength(20);

            this.Property(t => t.Destino)
                .IsRequired().HasMaxLength(20);

            // Table & Column Mappings
            this.ToTable("Rutas");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.Descripcion).HasColumnName("Descripcion");
            this.Property(t => t.Distancia).HasColumnName("Distancia");
            this.Property(t => t.Origen).HasColumnName("Origen");
            this.Property(t => t.Destino).HasColumnName("Destino");

        }
    }
}
