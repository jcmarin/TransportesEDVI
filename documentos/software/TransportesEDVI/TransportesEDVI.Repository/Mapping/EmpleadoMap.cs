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
    public class EmpleadoMap : EntityTypeConfiguration<Empleado>
    {
        public EmpleadoMap()
        {
            // Primary Key
            this.HasKey(t => t.Id);

            this.Property(t => t.Id)
                .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);

            // Properties
            this.Property(t => t.Nombres).HasMaxLength(80);

            this.Property(t => t.ApPaterno).HasMaxLength(80);

            this.Property(t => t.ApMaterno).HasMaxLength(80);

            this.Property(t => t.Direccion).HasMaxLength(150);

            this.Property(t => t.Telefono).HasMaxLength(10);

            this.Property(t => t.Dni).HasMaxLength(8);

            this.Property(t => t.Categoria).HasMaxLength(20);

            this.Property(t => t.Sueldo).HasPrecision(9,2);

            this.Property(t => t.NrCarnet).HasMaxLength(7);

            this.Property(t => t.Licencia).HasMaxLength(10);

            this.Property(t => t.Estado).HasMaxLength(3);


            // Table & Column Mappings
            this.ToTable("Empleado");
            this.Property(t => t.Id).HasColumnName("Id");
            this.Property(t => t.Nombres).HasColumnName("Nombres");
            this.Property(t => t.ApPaterno).HasColumnName("ApPaterno");
            this.Property(t => t.ApMaterno).HasColumnName("ApMaterno");
            this.Property(t => t.Direccion).HasColumnName("Direccion");
            this.Property(t => t.Telefono).HasColumnName("Telefono");
            this.Property(t => t.Dni).HasColumnName("DNI");
            this.Property(t => t.Categoria).HasColumnName("Categoria");
            this.Property(t => t.Sueldo).HasColumnName("Sueldo");
            this.Property(t => t.NrCarnet).HasColumnName("NrCarnet");
            this.Property(t => t.Licencia).HasColumnName("Licencia");
            this.Property(t => t.Estado).HasColumnName("Estado");
            this.Property(t => t.GuiaRemisionId).HasColumnName("GuiaRemisionId");

        }
    }
}
