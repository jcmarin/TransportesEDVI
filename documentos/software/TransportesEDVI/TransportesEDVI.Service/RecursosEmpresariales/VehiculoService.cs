using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Practices.Unity;
using TransportesEDVI.BusinessEntities;
using TransportesEDVI.Repository.RecursosEmpresariales;

namespace TransportesEDVI.Service.RecursosEmpresariales
{
    public class VehiculoService:IVehiculoService
    {
        [Dependency]
        public IVehiculoRepository VehiculoRepository { get; set; }

        public IEnumerable<Vehiculo> GetAllVehiculos()
        {
            return VehiculoRepository.GetAllVehiculos();
        }

        public IEnumerable<Vehiculo> GetFromVehiculosByPlaca(string placa)
        {
            return VehiculoRepository.GetFromVehiculosByPlaca(placa);
        }

        public Vehiculo GetFromVehiculoById(int id)
        {
            return VehiculoRepository.GetFromVehiculoById(id);
        }

        public void addVehiculos(Vehiculo vehiculo)
        {
            VehiculoRepository.addVehiculos(vehiculo);
        }

        public void updateVehiculo(Vehiculo vehiculo)
        {
            VehiculoRepository.updateVehiculo(vehiculo);
        }

        public void deleteVehiculo(int id)
        {
            VehiculoRepository.deleteVehiculo(id);
        }
    }
}
