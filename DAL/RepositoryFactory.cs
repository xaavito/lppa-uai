using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace dal
{
    public class RepositoryFactory
    {

        public static IRepository Create(string ConnectionString)
        {
            StoredProcedure sp = new StoredProcedure(ConnectionString);
            return sp;          
        }

        public static IRepository CreateTransactional(string ConnectionString)
        {
            StoredProcedure sp = new StoredProcedure(ConnectionString);
            sp.BeginTransaction();
            return sp;
        }

    }
}
