using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Repository.Logistica
{
    public class ServicioRepository : MasterRepository, IServicioRepository
    {

        public Servicio GetFromServicioById(int id)
        {
            var query = from p in _Context.Servicios
                .Include("GuiaRemision")
                        //.Include("DetalleGastosServicio.GastosDeServicio")
                        where p.Id.Equals(id)
                        select p;

            return query.SingleOrDefault();

        }

        public IEnumerable<Servicio> GetServicioByFechaAndCriterio(string criterio, DateTime? fechaIni, DateTime? fechaFin)
        {
            var query = from p in _Context.Servicios.Include("GuiaRemision")
                        select p;

            if (!string.IsNullOrEmpty(criterio))
            {
                query = from p in query
                        where p.GuiaRemision.NroGuias.ToUpper().Contains(criterio.ToUpper())
                        select p;
            }

            if (fechaIni.HasValue && fechaFin.HasValue)
            {
                fechaIni = DateTime.Parse(fechaIni.Value.ToShortDateString() + " 00:00:00");
                fechaFin = DateTime.Parse(fechaFin.Value.ToShortDateString() + " 23:59:59");

                query = from p in query
                        where p.FechaTraslado >= fechaIni && p.FechaTraslado <= fechaFin
                        select p;
            }

            return query;
        }


        public void AddServicio(Servicio servicio)
        {
            _Context.Entry(servicio.Empleado).State = EntityState.Unchanged;
            _Context.Entry(servicio.Vehiculo).State = EntityState.Unchanged;

            foreach (var detalle in servicio.DetalleGastosServicios)
            {
                _Context.Entry(detalle.GastosDeServicio).State = System.Data.Entity.EntityState.Unchanged;
            }

            _Context.Servicios.Add(servicio);
            _Context.SaveChanges();

        }

        public void UpdateServicio(Servicio servicio)
        {
            var servicioDB = GetFromServicioById(servicio.Id);

            if (servicioDB.IdEmpleado != servicio.IdEmpleado)
            {
                servicioDB.IdEmpleado = servicio.IdEmpleado;
                servicioDB.Empleado = servicio.Empleado;

                _Context.Entry(servicioDB.Empleado).State = System.Data.Entity.EntityState.Unchanged;
            }

            if (servicioDB.IdVehiculo != servicio.IdVehiculo)
            {
                servicioDB.IdVehiculo = servicio.IdVehiculo;
                servicioDB.Vehiculo = servicio.Vehiculo;

                _Context.Entry(servicioDB.Vehiculo).State = System.Data.Entity.EntityState.Unchanged;
            }

            var nuevos = servicio.DetalleGastosServicios.Except(servicioDB.DetalleGastosServicios).ToList();
            var eliminados = servicioDB.DetalleGastosServicios.Except(servicio.DetalleGastosServicios).ToList();
            var modificados = servicio.DetalleGastosServicios.Intersect(servicioDB.DetalleGastosServicios).ToList();

            eliminados.ForEach(e => servicioDB.DetalleGastosServicios.Remove(e));

            nuevos.ForEach(n =>
            {
                _Context.Entry(n.GastosDeServicio).State = EntityState.Unchanged;
                servicioDB.DetalleGastosServicios.Add(n);
            });

            foreach (var item in modificados)
            {
                var itemDb = servicioDB.DetalleGastosServicios.SingleOrDefault(i => i.IdGastosServicio.Equals(item.IdGastosServicio));

                itemDb.Cantidad = item.Cantidad;
                itemDb.Observaciones = item.Observaciones;

                _Context.Entry(itemDb.GastosDeServicio).State = EntityState.Unchanged;
                _Context.Entry(itemDb).State = EntityState.Modified;
            }


            _Context.Entry(servicioDB).State = EntityState.Modified;
            _Context.SaveChanges();
        }

        public void DeleteServicio(int id)
        {
            var existe = _Context.Servicios.Find(id);
            if (existe != null)
            {
                _Context.Servicios.Remove(existe);
                _Context.SaveChanges();
            }
        }
    }
}
