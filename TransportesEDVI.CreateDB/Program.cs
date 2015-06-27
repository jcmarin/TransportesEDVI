using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//se importa
using TransportesEDVI.BusinessEntities;
using TransportesEDVI.Repository;
using TransportesEDVI.Repository.Logistica;


namespace TransportesEDVI.CreateDB
{
    class Program
    {
        static void Main(string[] args)
        {
            IRutasRepository _repository=new RutasRepository();
            var ruta1 = new Ruta()
            {
                Id = 0,
                Descripcion = "Cajamarca - Lima",
                Distancia = "542 km",
                Origen = "Cajamarca",
                Destino = "Lima"
            };

            Console.WriteLine("Creando base de datos !!!");
            _repository.AddRuta(ruta1);
            Console.WriteLine("DB Creada....!! ok");
            Console.ReadLine();

        }
    }
}
