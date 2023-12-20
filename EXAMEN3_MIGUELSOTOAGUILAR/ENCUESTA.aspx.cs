using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EXAMEN3_MIGUELSOTOAGUILAR
{
    public partial class ENCUESTA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                LlenarPartidos();
            }

        }

        protected void LlenarPartidos()
        {
            string constr = ConfigurationManager.ConnectionStrings["conexionExamen"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("MOSTRAR_PARTIDOS"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            DropDownList1.DataSource = dt;
                            DropDownList1.DataBind();
                            DropDownList1.DataTextField = "id_partido";
                            DropDownList1.DataTextField = "nombre_Partido";


                            
                            DropDownList1.DataBind();  // refrescar
                        }
                    }
                }
            }
        }

        public void alertas(String texto)
        {
            string message = texto;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

        }

        protected void Button1_Click(object sender, EventArgs e)
            
        {

            DateTime hoy = new DateTime();
            int fechaActual = hoy.Year;
            DateTime fechaNacimiento = DateTime.Parse(txt_fechaNacimiento.Text);
            int anno = fechaNacimiento.Year;
            int resta = fechaActual - anno;
            if(resta < 50 || resta >= 18) 
            {
                int resultado = Clases.encuestas.AgregarEncuesta(txt_nombre.Text, DateTime.Parse(txt_fechaNacimiento.Text), txt_correoElectronico.Text, int.Parse(DropDownList1.SelectedValue));

                if (resultado > 0)
                {

                    alertas("Encuesta ingresada con exito");
                    txt_nombre.Text = string.Empty;
                    txt_fechaNacimiento.Text = string.Empty;
                    txt_correoElectronico.Text = string.Empty;
                    DropDownList1.SelectedValue = string.Empty;
                    //LlenarEncuesta();


                }
                else
                {
                    alertas("Error al ingresar encuesta");
                }



            }
            else 
            {

                alertas("No es elegible para la encuesta");
            }


            

        }
    }
}