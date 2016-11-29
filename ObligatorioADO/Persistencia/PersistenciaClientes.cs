using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntidadesCompartidas;
using System.Data.SqlTypes;
using System.Data.SqlClient;
using System.Data;

namespace Persistencia
{
    public class PersistenciaClientes
    {
        public static Cliente Buscar(int ciCli)
        {
            //throw new NotImplementedException();
            Cliente cliente = new Cliente();
            SqlConnection conexion = new SqlConnection("data source =.\\SQLEXPRESS;initial catalog=OBLIGATORIO;integrated security = true");
            SqlCommand comando = new SqlCommand("SP_BuscarCliente"+ ciCli, conexion);

            // parametros del sp
            SqlParameter parametrociCli = new SqlParameter("@ciCliB", cliente);


            //agrega los parametros
           comando.Parameters.Add(parametrociCli);

            try
            {
                conexion.Open();
                comando.ExecuteScalar();//no creo que valla scalar aca
                SqlDataReader lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    cliente.Cedula = Convert.ToInt32(lector["ciCli"].ToString());
                    cliente.Nombre = lector["nomCli"].ToString();
                    cliente.Apellido = lector["apeCli"].ToString();
                    cliente.Telefono = lector["telCli"].ToString();
                    cliente.Direccion = lector["CalleDireccion"].ToString();
                    cliente.NroPuerta = Convert.ToInt32(lector["nroPueCli"].ToString());
                }
                return cliente;
            }
            catch (SqlException)
            {
                throw new Exception(); 
            }
            catch (Exception)
            {
                throw new Exception();

            }
            finally
            {
                conexion.Close();
            }

        }

        public static int Agregar()
        {
            throw new NotImplementedException();
        }

        public static int Modificar()
        {
            throw new NotImplementedException();
        }

        public static int Eliminar()
        {
            throw new NotImplementedException();
        }


    }
}
