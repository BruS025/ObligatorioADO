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
    public class PersistenciaPCongelados
    {
        public static PCongelado Buscar(long Cod)
        {
            PCongelado PCongelado = new PCongelado();
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_BuscarCon", conexion);
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
                    PCongelado.CodigoB = Convert.ToInt32(lector["codB"].ToString());
                    PCongelado.Nombre = lector["nomProd"].ToString();
                    PCongelado.FechaVto = Convert.ToDateTime(lector["fechaVto"].ToString());
                    PCongelado.Precio = Convert.ToInt32(lector["precioProd"].ToString());
                    PCongelado.Peso = Convert.ToInt32(lector["pesoProd"].ToString());
                }
                return PCongelado;
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

        public static int Agregar(PCongelado producto)
        {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_AgregarProdConge", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            SqlParameter parametroCod = new SqlParameter("@cod", producto.CodigoB);
            SqlParameter parametroNombre = new SqlParameter("@nombre",producto.Nombre);
            SqlParameter parametroFechaVto = new SqlParameter("@fecha_vencimiento", producto.FechaVto);
            SqlParameter parametroPrecio = new SqlParameter("@precio ", producto.Precio);
            SqlParameter parametroPeso = new SqlParameter("@peso ", producto.Peso);

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

        public static int Modificar(PCongelado producto)
        {
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_ModificarCong", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            SqlParameter parametroCod = new SqlParameter("@cod ", producto.CodigoB);
            SqlParameter parametroNombre = new SqlParameter("@NomProNue ", producto.Nombre);
            SqlParameter parametroFechaVto = new SqlParameter("@FechaVtoNue", producto.FechaVto);
            SqlParameter parametroPrecio = new SqlParameter("@PrecioProdNue ", producto.Precio);
            SqlParameter parametroPeso = new SqlParameter("@PesoProdNue ", producto.Peso);


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

        public static List<PCongelado> Listar()
        {
            List<PCongelado> lista = new List<PCongelado>();
            SqlConnection conexion = new SqlConnection(Conexion.CnnString);
            SqlCommand comando = new SqlCommand("SP_ListarCon", conexion);
            comando.CommandType = CommandType.StoredProcedure;

            try
            {
                conexion.Open();
                SqlDataReader lector = comando.ExecuteReader();


                while (lector.Read())
                {

                    PCongelado PCong = new PCongelado();

                    PCong.CodigoB = Convert.ToInt32(lector["codB"].ToString());
                    PCong.Nombre = lector["nomProd"].ToString();
                    PCong.FechaVto =Convert.ToDateTime(lector["fechaVto"].ToString());
                    PCong.Precio = Convert.ToInt32(lector["precioProd"].ToString());
                    PCong.Peso = Convert.ToInt32(lector["pesoProd"].ToString());

                    lista.Add(PCong);
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
