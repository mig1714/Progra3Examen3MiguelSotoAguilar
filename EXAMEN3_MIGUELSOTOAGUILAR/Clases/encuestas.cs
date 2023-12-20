using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace EXAMEN3_MIGUELSOTOAGUILAR.Clases
{
    public class encuestas
    {
        public static string nombre { get; set; }
        public static DateTime fechaNacimiento  { get; set; }

        public static string correoElectronico { get; set; }

        public static int partidoPolitico { get; set; }



        public static int AgregarEncuesta(string nombre, DateTime fechaNacimiento, string correoElectronico, int partidoPolitico)
        {
            int retorno = 0;

            

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConexion.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("AGREGAR_ENCUESTA", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    cmd.Parameters.Add(new SqlParameter("@NOMBRE", nombre));
                    cmd.Parameters.Add(new SqlParameter("@FECHA_NACIMIENTO", fechaNacimiento));
                    cmd.Parameters.Add(new SqlParameter("@CORREOELECTRONICO", correoElectronico));
                    cmd.Parameters.Add(new SqlParameter("@PARTIDOPOLITICO", partidoPolitico));


                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;


        }

   

    }
}