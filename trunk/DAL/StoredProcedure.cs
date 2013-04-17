using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Collections;

public class StoredProcedure : dal.IRepository
{

    #region DataMember
    SqlConnection Conn = new SqlConnection();
    String _ConnectionString;
    String _nombre = "";
    int _CommandTimeout = 10000;
    SqlCommand cmd;
    SqlTransaction Trans;
    Hashtable _params = new Hashtable();

    #endregion

    #region Constructors


    /// <summary>
    /// Contructor de la clase
    /// </summary>
    /// <param name="ConnectionString">Cadena de conexion a la base.</param>
    public StoredProcedure(string ConnectionString)
    {
        _ConnectionString = ConnectionString;
    }

    #endregion

    #region Private Methods

    void Init()
    {
        cmd = new SqlCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = GetConn();
        cmd.CommandTimeout = _CommandTimeout;
        cmd.CommandText = _nombre;
        if (Trans != null)
            cmd.Transaction = Trans;
        
        //Cargo los parametros
        foreach( DictionaryEntry pr in _params)
        {
            cmd.Parameters.AddWithValue(pr.Key.ToString(), pr.Value);
        }
        _params = new Hashtable();
    }

    private void Conectar()
    {
        try
        {
            Conn.ConnectionString = _ConnectionString;
            Conn.Open();
        }
        catch (Exception e)
        {
            this.Dispose();
            throw new Exception("Error en Conectar " + e.Message);
        }

    }

    private void CerrarConexion()
    {
        try
        {
            Conn.Close();
        }
        catch (Exception e)
        {
            throw new Exception("Error en CerrarConexion " + e.Message);
        }
        finally
        {
            this.Dispose();
        }

    }

    private SqlConnection GetConn()
    {
        return Conn;
    }

    #endregion

    #region Public Properties

    /// <summary>
    /// Nombre del stored procedure
    /// </summary>
    public string Nombre
    {
        get { return _nombre; }
        set { _nombre = value; }
    }
    /// <summary>
    /// Especifica el tiempo de TimeOut
    /// </summary>
    public int CommandTimeout
    {
        get { return _CommandTimeout; }
        set { _CommandTimeout = value; }
    }

    #endregion

    #region Public Methods

    /// <summary>
    /// Agrega parametros para ser enviados al stored procedure
    /// </summary>
    /// <param name="name">Nombre del parametro. (EJ. @Variable).</param>
    /// <param name="value">Valor a envíar.</param>
    public void AddParameter(string name, object value)
    {
        try
        {
            _params.Add(name, value);
        }
        catch (Exception)
        {
            this.Rollback();
        }
    }

    #endregion

    #region Execute Methods

    /// <summary>
    /// Ejecuta el stored procedure y devuelve el número de filas afectadas.
    /// </summary>
    /// <returns>Cantidad de filas afectadas.</returns> 
    public int ExecuteNonQuery()
    {
        Init();
        if (Trans == null) Conectar();
        int r = 0;
        try
        {
            r = cmd.ExecuteNonQuery();
        }
        catch (Exception e)
        {
            this.Rollback();
            Error(e);
        }
        if (Trans == null) CerrarConexion();
        return r;
    }

    /// <summary>
    /// Ejecuta el stored procedure y devuelve el Return.
    /// </summary>
    /// <returns>Valor del return.</returns> 
    public object ExecuteReturnValue()
    {
        Init();
        if (Trans == null) Conectar();
        object r = null;
        try
        {
            SqlParameter returnValue = new SqlParameter();
            returnValue.ParameterName = "@Return_Value";
            returnValue.Direction = ParameterDirection.ReturnValue;

            cmd.Parameters.Add(returnValue);
            cmd.ExecuteNonQuery();
            r = cmd.Parameters["@Return_Value"].Value;

        }
        catch (Exception e)
        {
            this.Rollback();
            Error(e);
        }
        if (Trans == null) CerrarConexion();
        return r;
    }

    /// <summary>
    /// Ejecuta el stored procedure y devuelve la primer columna de la fila de conjunto de resultados devueltos.
    /// </summary>
    /// <returns>Devuelve la primer columna de la fila de conjunto de resultados devueltos.</returns> 
    public object ExecuteScalar()
    {
        Init();
        if (Trans == null) Conectar();
        object r = null;
        try
        {
            r = cmd.ExecuteScalar();
        }
        catch (Exception e)
        {
            this.Rollback();
            Error(e);
        }
        if (Trans == null) CerrarConexion();
        return r;
    }

    /// <summary>
    /// Ejecuta el stored procedure y devuelve la consulta en un DataTable.
    /// </summary>
    /// <returns>Devuelve la consulta en un DataTable.</returns> 
    public DataTable ExecuteDataTable()
    {
        Init();      
        SqlDataAdapter Adap = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        if (Trans == null) Conectar();
        try
        {
            Adap.Fill(dt);
        }
        catch (Exception e)
        {
            this.Rollback();
            Error(e);
        }
        if (Trans == null) CerrarConexion();
        return dt;
    }

    /// <summary>
    /// Ejecuta el stored procedure y devuelve la consulta en un DataSet. Se utiliza cuando el stored devuelme mas de un recordset
    /// </summary>
    /// <returns>Devuelve la consulta en un DataSet.</returns> 
    public DataSet ExecuteDataSet()
    {
        Init();  
        SqlDataAdapter Adap = new SqlDataAdapter(cmd);
        DataSet dt = new DataSet();
        if (Trans == null) Conectar();
        try
        {
            Adap.Fill(dt);
        }
        catch (Exception e)
        {
            this.Rollback();
            Error(e);
        }
        if (Trans == null) CerrarConexion();
        return dt;
    }

    #endregion

    public String printSP()
    {
        bool start = false;
        String sp = cmd.CommandText;
        foreach (SqlParameter p in cmd.Parameters)
        {
            if (start)
                sp += " ,";
            String value = "NULL";
            if (p.Value != null)
                value = "'" + Convert.ToString(p.Value) + "'";
            sp += " " + p.ParameterName + "=" + value;
            start = true;
        }
        return sp;
    }
    void Error(Exception e)
    {
        String sp = this.printSP();

        throw new Exception("Error al ejecutar el storedProcedure \n" + sp + " \n " + e.Message);
    }

    #region Miembros de IRepository

    public void BeginTransaction()
    {
        Conectar();
        Trans = Conn.BeginTransaction();
    }

    public void Commit()
    {
        if (Trans != null)
        {
            Trans.Commit();
            Trans.Dispose();
        }
        Trans = null;
        CerrarConexion();
    }

    public void Rollback()
    {
        if (Trans != null)
        {
            Trans.Rollback();
            Trans.Dispose();
        }
        Trans = null;
        CerrarConexion();
    }

    #endregion

    #region Miembros de IDisposable
    Boolean disposedValue;

    protected virtual void Dispose(bool disposing)
    {
        if (!disposedValue)
        {
            if (disposing)
            {
                if (Trans != null)
                {
                    try
                    {
                        Trans.Rollback();
                        Trans.Dispose();
                    }
                    catch (Exception) { }
                }
                if (Conn != null)
                {
                    try
                    {
                        Conn.Close();
                        Conn.Dispose();
                    }
                    catch (Exception) { }
                }
                GC.SuppressFinalize(this);
            }
        }
        disposedValue = true;
    }

    public void Dispose()
    {        
        Dispose(true);
    }

    public Boolean IsDisposed
    {
        get { return disposedValue; }
    }
    #endregion

}

