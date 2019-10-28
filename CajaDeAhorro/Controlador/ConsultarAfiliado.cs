using Database.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CajaDeAhorro
{
    public class ConsultarAfiliado
    {
        public static DataSet ObtenerAfiliados()
        {

            SqlParameter[] dbParams = new SqlParameter[]
                {

                };

            return DBHelper.ExecuteDataSet("usp_ConsultaAfiliado_ObtenerAfiliados", dbParams);
        }
    }
}