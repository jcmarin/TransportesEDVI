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
    public class DetalleGastMantMap : EntityTypeConfiguration<DetalleGastMant>
    {
        public DetalleGastMantMap()
        {
            // Primary Key
            this.HasKey(t => new { t.IdGastosMantenimiento, t.IdVehiculo });

            // Properties
            this.Property(t => t.IdGastosMantenimiento)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.IdVehiculo)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.None);

            this.Property(t => t.Total).HasPrecision(9, 2);

            // Table & Column Mappings
            this.ToTable("DetalleGastMant");
            this.Property(t => t.Fecha).HasColumnName("Fecha");
            this.Property(t => t.IdGastosMantenimiento).HasColumnName("IdGastosMantenimiento");
            this.Property(t => t.IdVehiculo).HasColumnName("IdVehiculo");
            this.Property(t => t.Total).HasColumnName("Total");

            // Relationships
            this.HasRequired(t => t.GastosMantenimento)
                .WithMany(t => t.DetalleGastMants)
                .HasForeignKey(d => d.IdGastosMantenimiento).WillCascadeOnDelete(false);
            this.HasRequired(t => t.Vehiculo)
                .WithMany(t => t.DetalleGastMants)
                .HasForeignKey(d => d.IdVehiculo).WillCascadeOnDelete(false);

        }
    }
}
