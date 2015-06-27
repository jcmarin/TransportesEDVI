﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TransportesEDVI.BusinessEntities;

namespace TransportesEDVI.Service.Logistica
{
    public interface IServicioService
    {
        Servicio GetFromServicioById(Int32 id);
        IEnumerable<Servicio> GetServicioByFechaAndCriterio(string criterio, DateTime? fechaIni, DateTime? fechaFin);
        void AddServicio(Servicio servicio);
        void UpdateServicio(Servicio servicio);
        void DeleteServicio(Int32 id);
    }
}
