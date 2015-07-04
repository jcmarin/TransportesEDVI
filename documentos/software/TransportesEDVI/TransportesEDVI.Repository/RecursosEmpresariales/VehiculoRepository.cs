using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TransportesEDVI.Repository.RecursosEmpresariales
{
    public class VehiculoRepository:MasterRepository,IVehiculoRepository
    {
        public IEnumerable<BusinessEntities.Vehiculo> GetAllVehiculos()
        {
            return _Context.Vehiculos;
        }

        public IEnumerable<BusinessEntities.Vehiculo> GetFromVehiculosByPlaca(string placa)
        {
            var query = from r in _Context.Vehiculos
                        select r;
            if (placa!="" && placa!= null && placa != string.Empty)
            {
                query = from r in query
                        where r.PlacaVehiculo.ToUpper().Contains(placa.ToUpper())||
                                r.PlacaCarreta.ToUpper().Contains(placa.ToUpper())
                        select r;
            }
            return query;
        }

        public BusinessEntities.Vehiculo GetFromVehiculoById(int id)
        {
            return _Context.Vehiculos.Find(id);
        }

        public void addVehiculos(BusinessEntities.Vehiculo vehiculo)
        {
            _Context.Vehiculos.Add(vehiculo);
            _Context.SaveChanges();
        }

        public void updateVehiculo(BusinessEntities.Vehiculo vehiculo)
        {
            _Context.Entry(vehiculo).State = EntityState.Modified;

            _Context.SaveChanges();
        }

        public void deleteVehiculo(int id)
        {
            var existe = _Context.Vehiculos.Find(id);

            if (existe != null)
            {
                _Context.Vehiculos.Remove(existe);
                _Context.SaveChanges();
            }
        }
    }
}
