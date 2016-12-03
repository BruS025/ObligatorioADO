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
        public static Cliente Buscar(int cedula)
        {
            Cliente cliente = new Cliente();
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_BuscarCliente", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            // parametros del sp
            SqlParameter parametrociCli = new SqlParameter("@ciCliB", cedula);


            //agrega los parametros
           comando.Parameters.Add(parametrociCli);

            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
                SqlDataReader lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    cliente.Cedula = Convert.ToInt32(lector["ciCli"].ToString());
                    cliente.Nombre = lector["nomCli"].ToString();
                    cliente.Apellido = lector["apeCli"].ToString();
                    cliente.Telefono = lector["telCli"].ToString();
                    cliente.Direccion = lector["dirCli"].ToString();
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

        public static int Agregar(Cliente cliente)
        {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_AgregarCliente", conexion);
            comando.CommandType = CommandType.StoredProcedure;


            SqlParameter parametroCi = new SqlParameter("@ciClieNue ", cliente.Cedula);
            SqlParameter parametroNombre = new SqlParameter("@nomCliNue ", cliente.Nombre);
            SqlParameter parametroApellido = new SqlParameter("@apeCliNue", cliente.Apellido);
            SqlParameter parametroTelefono = new SqlParameter("@telCliNue ", cliente.Telefono);
            SqlParameter parametroDireccion = new SqlParameter("@dirCliNue ", cliente.Direccion);
            SqlParameter parametroNroPuerta = new SqlParameter("@nroPueCliNue", cliente.NroPuerta);

            comando.Parameters.Add(parametroCi);
            comando.Parameters.Add(parametroNombre);
            comando.Parameters.Add(parametroApellido);
            comando.Parameters.Add(parametroTelefono);
            comando.Parameters.Add(parametroDireccion);
            comando.Parameters.Add(parametroNroPuerta);
            try
            {
                conexion.Open();
                int resultado = comando.ExecuteNonQuery();
                return resultado;

            }
            catch (SqlException sqlex)
            {

                throw sqlex;
            }

            finally
            {
                conexion.Close();
            }
        }

        public static int Modificar(Cliente cliente)
        {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_ModificarCliente", conexion);
            comando.CommandType = CommandType.StoredProcedure;


            SqlParameter parametroCi = new SqlParameter("@ciClieNue ", cliente.Cedula);
            SqlParameter parametroNombre = new SqlParameter("@nomCliNue ", cliente.Nombre);
            SqlParameter parametroApellido = new SqlParameter("@apeCliNue", cliente.Apellido);
            SqlParameter parametroTelefono = new SqlParameter("@telCliNue ", cliente.Telefono);
            SqlParameter parametroDireccion = new SqlParameter("@dirCliNue ", cliente.Direccion);
            SqlParameter parametroNroPuerta = new SqlParameter("@nroPueCliNue", cliente.NroPuerta);

            comando.Parameters.Add(parametroCi);
            comando.Parameters.Add(parametroNombre);
            comando.Parameters.Add(parametroApellido);
            comando.Parameters.Add(parametroTelefono);
            comando.Parameters.Add(parametroDireccion);
            comando.Parameters.Add(parametroNroPuerta);
            try
            {
                conexion.Open();
                int resultado = comando.ExecuteNonQuery();
                return resultado;

            }
            catch (SqlException sqlex)
            {

                throw sqlex;
            }

            finally
            {
                conexion.Close();
            }
        }

        public static int Eliminar(int cedula)
        {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_EliminarCliente", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            SqlParameter parametroCi = new SqlParameter("@ciCliente ", cedula);
            comando.Parameters.Add(parametroCi);

            try
            {
                conexion.Open();
                int resultado = comando.ExecuteNonQuery();
                return resultado;
            }
            catch (SqlException sqlex)
            {
                throw sqlex;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                conexion.Close();
            }
        }

        public static List<Cliente> Listar()
        {
            List<Cliente> lista = new List<Cliente>();
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_ListarCliente", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            try
            {
                conexion.Open();
                SqlDataReader lector = comando.ExecuteReader();


                while (lector.Read())
                {

                    Cliente cliente = new Cliente();

                    cliente.Cedula = Convert.ToInt32(lector["ciCli"].ToString());
                    cliente.Nombre = lector["nomCli"].ToString();
                    cliente.Apellido = lector["apeCli"].ToString();

                    lista.Add(cliente);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
        }

    }
}
