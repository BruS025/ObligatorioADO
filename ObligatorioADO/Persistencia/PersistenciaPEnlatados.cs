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
    public class PersistenciaPEnlatados
    {
        public static PEnlatado Buscar(long Cod)
        {
            PEnlatado PEnlatado = new PEnlatado();
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_BuscarEn", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            // parametros del sp
            SqlParameter parametroProCod = new SqlParameter("@codBus", Cod);


            //agrega los parametros
            comando.Parameters.Add(parametroProCod);

            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
                SqlDataReader lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    PEnlatado.CodigoB = Convert.ToInt32(lector["codB"].ToString());
                    PEnlatado.Nombre = lector["nomProd"].ToString();
                    PEnlatado.FechaVto = Convert.ToDateTime(lector["fechaVto"].ToString());
                    PEnlatado.Precio = Convert.ToInt32(lector["precioProd"].ToString());
                    PEnlatado.AbreFacil = Convert.ToBoolean(lector["pesoProd"].ToString());
                }
                return PEnlatado;
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

        public static int Agregar(PEnlatado producto)
        {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_AgregarProdEn", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            SqlParameter parametroCod = new SqlParameter("@cod", producto.CodigoB);
            SqlParameter parametroNombre = new SqlParameter("@nombre", producto.Nombre);
            SqlParameter parametroFechaVto = new SqlParameter("@fecha_vencimiento", producto.FechaVto);
            SqlParameter parametroPrecio = new SqlParameter("@precio ", producto.Precio);
            SqlParameter parametroTipoTapa = new SqlParameter("@TipoTapa ", producto.AbreFacil);

            comando.Parameters.Add(parametroCod);
            comando.Parameters.Add(parametroNombre);
            comando.Parameters.Add(parametroFechaVto);
            comando.Parameters.Add(parametroPrecio);
            comando.Parameters.Add(parametroTipoTapa);

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

        public static int Modificar(PEnlatado producto)
        {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_ModificarEnl", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            SqlParameter parametroCod = new SqlParameter("@cod ", producto.CodigoB);
            SqlParameter parametroNombre = new SqlParameter("@NomProNue ", producto.Nombre);
            SqlParameter parametroFechaVto = new SqlParameter("@FechaVtoNue", producto.FechaVto);
            SqlParameter parametroPrecio = new SqlParameter("@PrecioProdNue ", producto.Precio);
            SqlParameter parametroPeso = new SqlParameter("@PesoProdNue ", producto.AbreFacil);


            comando.Parameters.Add(parametroCod);
            comando.Parameters.Add(parametroNombre);
            comando.Parameters.Add(parametroFechaVto);
            comando.Parameters.Add(parametroPrecio);
            comando.Parameters.Add(parametroPeso);
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

        public static int Eliminar(long cod)
        {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_EliminarPro", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            SqlParameter parametroCod = new SqlParameter("@codB ", cod);
            comando.Parameters.Add(parametroCod);

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

        public static List<PEnlatado> Listar()
        {
            List<PEnlatado> lista = new List<PEnlatado>();
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_ListarEn", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            try
            {
                conexion.Open();
                SqlDataReader lector = comando.ExecuteReader();


                while (lector.Read())
                {

                    PEnlatado PEnl = new PEnlatado();

                    PEnl.CodigoB = Convert.ToInt32(lector["codB"].ToString());
                    PEnl.Nombre = lector["nomProd"].ToString();
                    PEnl.FechaVto = Convert.ToDateTime(lector["fechaVto"].ToString());
                    PEnl.Precio = Convert.ToInt32(lector["precioProd"].ToString());
                    PEnl.AbreFacil = Convert.ToBoolean(lector["tipoTapa"].ToString());

                    lista.Add(PEnl);
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
