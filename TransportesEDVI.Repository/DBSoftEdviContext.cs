using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransportesEDVI.BusinessEntities;
using TransportesEDVI.Repository.Mapping;

namespace TransportesEDVI.Repository
{
    public partial class DBSoftEdviContext : DbContext
    {

        public DBSoftEdviContext()
        {
            Database.SetInitializer<DBSoftEdviContext>(new CreateDatabaseIfNotExists<DBSoftEdviContext>());
        }

        public DbSet<Boleta> Boletas { get; set; }
        public DbSet<Cliente> Clientes { get; set; }
        public DbSet<Contrato> Contratoes { get; set; }
        public DbSet<DetalleBoleta> DetalleBoletas { get; set; }
        public DbSet<DetalleContrato> DetalleContratoes { get; set; }
        public DbSet<DetalleFactura> DetalleFacturas { get; set; }
        public DbSet<DetalleGastMant> DetalleGastMants { get; set; }
        public DbSet<DetalleGastosServicio> DetalleGastosServicios { get; set; }
        public DbSet<DetalleGuiaRemision> DetalleGuiaRemisions { get; set; }
        public DbSet<Empleado> Empleados { get; set; }
        public DbSet<Factura> Facturas { get; set; }
        public DbSet<GastosDeServicio> GastosDeServicios { get; set; }
        public DbSet<GastosMantenimento> GastosMantenimentoes { get; set; }
        public DbSet<GuiaRemision> GuiaRemisions { get; set; }
        public DbSet<Ruta> Rutas { get; set; }
        public DbSet<Servicio> Servicios { get; set; }
        public DbSet<Vehiculo> Vehiculos { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new BoletaMap());
            modelBuilder.Configurations.Add(new ClienteMap());
            modelBuilder.Configurations.Add(new ContratoMap());
            modelBuilder.Configurations.Add(new DetalleBoletaMap());
            modelBuilder.Configurations.Add(new DetalleContratoMap());
            modelBuilder.Configurations.Add(new DetalleFacturaMap());
            modelBuilder.Configurations.Add(new DetalleGastMantMap());
            modelBuilder.Configurations.Add(new DetalleGastosServicioMap());
            modelBuilder.Configurations.Add(new DetalleGuiaRemisionMap());
            modelBuilder.Configurations.Add(new EmpleadoMap());
            modelBuilder.Configurations.Add(new FacturaMap());
            modelBuilder.Configurations.Add(new GastosDeServicioMap());
            modelBuilder.Configurations.Add(new GastosMantenimentoMap());
            modelBuilder.Configurations.Add(new GuiaRemisionMap());
            modelBuilder.Configurations.Add(new RutaMap());
            modelBuilder.Configurations.Add(new ServicioMap());
            modelBuilder.Configurations.Add(new VehiculoMap());
        }

    }
}
