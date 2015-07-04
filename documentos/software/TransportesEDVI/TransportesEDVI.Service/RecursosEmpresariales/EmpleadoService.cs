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
    public class EmpleadoService : IEmpleadoService
    {
        [Dependency]
        public IEmpleadoRepository EmpleadoRepository { get; set; }

        public IEnumerable<Empleado> GetAllEmpleados()
        {
            return EmpleadoRepository.GetAllEmpleados();
        }

        public IEnumerable<Empleado> GetEmpleadosByDni(string dni)
        {
            return EmpleadoRepository.GetEmpleadosByDni(dni);
        }

        public Empleado GetEmpleadoById(int id)
        {
            return EmpleadoRepository.GetEmpleadoById(id);
        }

        public void AddEmpleado(Empleado empleado)
        {
            EmpleadoRepository.AddEmpleado(empleado);
        }

        public void UpdateEmpleado(Empleado empleado)
        {
            EmpleadoRepository.UpdateEmpleado(empleado);
        }

        public void DeleteEmpleado(int id)
        {
            EmpleadoRepository.DeleteEmpleado(id);
        }
    }
}
