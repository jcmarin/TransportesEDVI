using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Repository.RecursosEmpresariales
{
    public interface IVehiculoRepository
    {
        IEnumerable<Vehiculo> GetAllVehiculos();
        IEnumerable<Vehiculo> GetFromVehiculosByPlaca(string placa);
        Vehiculo GetFromVehiculoById(Int32 id);
        void addVehiculos(Vehiculo vehiculo);
        void updateVehiculo(Vehiculo vehiculo);
        void deleteVehiculo(Int32 id);
    }
}
