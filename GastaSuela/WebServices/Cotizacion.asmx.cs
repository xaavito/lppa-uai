using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace WebServices
{
    /// <summary>
    /// Descripción breve de Cotizacion
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio Web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class Cotizacion : System.Web.Services.WebService
    {

        [WebMethod]
        public float Obtener(Moneda moneda)
        {
            float ret = 0;
            switch (moneda)
            {
                case Moneda.Peso:
                    ret = 1;
                    break;
                case Moneda.Dolar:
                    ret = 7;
                    break;
                case Moneda.Real:
                    ret = 3;
                    break;
                default:
                    break;
            }
            return ret;
        }
    }

    public enum Moneda{
        Peso,
        Dolar,
        Real
    }
}
