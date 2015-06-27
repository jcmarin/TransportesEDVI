﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Service.RecursosEmpresariales
{
    public interface IEmpleadoService
    {
        IEnumerable<Empleado> GetAllEmpleados();
        IEnumerable<Empleado> GetEmpleadosByDni(string dni);
        Empleado GetEmpleadoById(Int32 id);
        void AddEmpleado(Empleado empleado);
        void UpdateEmpleado(Empleado empleado);
        void DeleteEmpleado(Int32 id);
    }
}