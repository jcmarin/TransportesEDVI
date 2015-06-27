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
    public class DetalleGuiaRemisionMap : EntityTypeConfiguration<DetalleGuiaRemision>
    {
        public DetalleGuiaRemisionMap()
        {
            // Primary Key
            this.HasKey(t => new { t.IdGuiaRemision, t.Item });

            // Properties
            this.Property(t => t.IdGuiaRemision)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.Item)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.GuiaRemitente)
                .IsRequired().HasMaxLength(11);

            this.Property(t => t.Descripcion)
                .IsRequired().HasMaxLength(150);

            this.Property(t => t.Peso).IsRequired().HasPrecision(9, 2);

            this.Property(t => t.CantidadBultos).IsRequired();

            // Table & Column Mappings
            this.ToTable("DetalleGuiaRemision");
            this.Property(t => t.IdGuiaRemision).HasColumnName("IdGuiaRemision");
            this.Property(t => t.Item).HasColumnName("Item");
            this.Property(t => t.Peso).HasColumnName("Peso");
            this.Property(t => t.GuiaRemitente).HasColumnName("GuiaRemitente");
            this.Property(t => t.Descripcion).HasColumnName("Descripcion");
            this.Property(t => t.CantidadBultos).HasColumnName("CantidadBultos");
            this.Property(t => t.IdContrato).HasColumnName("IdContrato");
            this.Property(t => t.IdRuta).HasColumnName("IdRuta");

            // Relationships
            this.HasRequired(t => t.DetalleContrato)
                .WithMany(t => t.DetalleGuiaRemisions)
                .HasForeignKey(d => new { d.IdRuta, d.IdContrato }).WillCascadeOnDelete(false);
            this.HasRequired(t => t.GuiaRemision)
                .WithMany(t => t.DetalleGuiaRemisions)
                .HasForeignKey(d => d.IdGuiaRemision).WillCascadeOnDelete(false);

        }
    }
}
