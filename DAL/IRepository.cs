using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace dal
{
    public interface IRepository : IDisposable
    {
        string Nombre {get; set;}
        int CommandTimeout { get; set; }
        void BeginTransaction();

        void AddParameter(string name, object value);

        int ExecuteNonQuery();
        object ExecuteReturnValue();
        object ExecuteScalar();
        DataTable ExecuteDataTable();
        DataSet ExecuteDataSet();

        void Commit();
        void Rollback();

        String printSP();
        Boolean IsDisposed { get; }

    }
}
