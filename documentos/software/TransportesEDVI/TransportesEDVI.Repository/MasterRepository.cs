using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TransportesEDVI.Repository
{
    public abstract class MasterRepository
    {
        protected readonly DBSoftEdviContext _Context;

        protected MasterRepository()
        {
            if(_Context==null)
                _Context=new DBSoftEdviContext();
        }
    }
}
