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
    public class ClienteMap : EntityTypeConfiguration<Cliente>
    {
        public ClienteMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            this.Property(t => t.Id)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            // Properties
            this.Property(t => t.RazonSocial)
                .IsRequired().HasMaxLength(100);

            this.Property(t => t.Direccion)
                .IsRequired().HasMaxLength(150);

            this.Property(t => t.Ruc)
                .IsRequired().HasMaxLength(11);
            
            this.Property(t => t.Telefono).HasMaxLength(10);

            // Table & Column Mappings
            this.ToTable("Clientes");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.RazonSocial).HasColumnName("RazonSocial");
            this.Property(t => t.Telefono).HasColumnName("Telefono");
            this.Property(t => t.Direccion).HasColumnName("Direccion");
            this.Property(t => t.Ruc).HasColumnName("ruc");
        }
    }
}
