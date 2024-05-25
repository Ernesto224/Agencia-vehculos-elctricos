/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Data;

import Domain.Movimiento;
import Domain.Servicio;
import com.sun.jdi.connect.spi.Connection;
import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author User
 */
public class MovimientoData extends BaseData {

    public MovimientoData() {
    }

    public ArrayList<Movimiento> obtenerMovimientos(int IdPedido) {
        ArrayList<Movimiento> movimientos = new ArrayList<>();
        String sp = "{call FinanzaVenta.sp_ListarProductosAgregados(?)}";

        try ( java.sql.Connection connection = getSqlConnection();  CallableStatement callable = connection.prepareCall(sp)) {
            callable.setInt(1, IdPedido);

            boolean hadResults = callable.execute();

            // If we have results, we process them
            while (hadResults) {
                try ( ResultSet resultSet = callable.getResultSet()) {
                    while (resultSet.next()) {
                        int IDProducto = resultSet.getInt("IDProducto");
                        String Vehiculo = resultSet.getString("Vehiculo");
                        String Accesorio = resultSet.getString("Accesorio");
                        String Componente = resultSet.getString("Componenente");
                        int CantidadMovida = resultSet.getInt("CantidadMovida");

                        Movimiento movimiento = new Movimiento(IDProducto, Vehiculo, Accesorio, Componente, CantidadMovida);
                        movimientos.add(movimiento);
                    }
                }
                hadResults = callable.getMoreResults();
            }

            System.out.println("ENTRE MOVIMIENTOS IdPedido: " + IdPedido);

        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("SIZE MOVIMIENTOS: " + movimientos.size());
        return movimientos;
    }

    public boolean removerProducto(int IdPedido, int IdProducto) {
        String sp = "{call Stock.sp_EliminarMovimientoInventario(?,?)}";

        try ( java.sql.Connection connection = getSqlConnection();  CallableStatement callable = connection.prepareCall(sp)) {
            System.out.println("Data.MovimientoData.removerProducto()");
            callable.setInt(1, IdPedido);
            callable.setInt(2, IdProducto);

            // Ejecutar el procedimiento almacenado
            callable.executeUpdate();

            // Si la ejecución es exitosa, devolver true
            return true;

        } catch (SQLException ex) {
            // Manejar cualquier excepción que pueda ocurrir al ejecutar el procedimiento almacenado
            ex.printStackTrace();
            System.out.println("FALSE REMOVE");
            return false; // Devolver false si ocurre un error
        }
    }

    public float calcularMonto(int idPedido) {
        String sp = "{? = call FinanzaVenta.sp_CalcularMontoTotalPedido(?)}";
        float montoTotal = 0.0f;

        try ( java.sql.Connection connection = getSqlConnection();  CallableStatement callable = connection.prepareCall(sp)) {

            callable.registerOutParameter(1, java.sql.Types.INTEGER);
            callable.setInt(2, idPedido);

            callable.execute();

            int resultadoEntero = callable.getInt(1);

            if (resultadoEntero == -1) {
                montoTotal = -1.0f;
            } else {
                montoTotal = resultadoEntero;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return montoTotal;
    }

    public ArrayList<Servicio> obtenerServicios(int IdPedido) {
        ArrayList<Servicio> servicios = new ArrayList<>();
        String sp = "{call Servicio.sp_ListarServiciosPorPedido(?)}"; // Nombre del procedimiento almacenado

        try ( java.sql.Connection connection = getSqlConnection();  CallableStatement callable = connection.prepareCall(sp)) {
            // Establecer el parámetro de entrada IDPedido
            callable.setInt(1, IdPedido);

            // Ejecutar el procedimiento almacenado
            boolean hadResults = callable.execute();

            // Si tenemos resultados, los procesamos
            while (hadResults) {
                try ( ResultSet resultSet = callable.getResultSet()) {
                    while (resultSet.next()) {
                        int IDServicio = resultSet.getInt("IDServicio");
                        String NombreServicio = resultSet.getString("NombreServicio");
                        String Descripcion = resultSet.getString("Descripcion");

                        // Crear un objeto Servicio y agregarlo a la lista
                        Servicio servicio = new Servicio(IdPedido, IDServicio, NombreServicio, Descripcion);
                        servicios.add(servicio);
                    }
                }
                hadResults = callable.getMoreResults();
            }

        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
        }
        return servicios;
    }

    public ArrayList<Servicio> obtenerServicios() {
        ArrayList<Servicio> servicios = new ArrayList<>();
        String sql = "SELECT IDServicio, NombreServicio, Descripcion FROM Servicio.view_ListarTodosLosServicios"; // Consulta SQL para seleccionar datos de la vista

        try (java.sql.Connection connection = getSqlConnection();  ResultSet resultSet = connection.createStatement().executeQuery(sql)) {

            while (resultSet.next()) {
                int IDServicio = resultSet.getInt("IDServicio");
                String NombreServicio = resultSet.getString("NombreServicio");
                String Descripcion = resultSet.getString("Descripcion");

                // Crear un objeto Servicio y agregarlo a la lista
                Servicio servicio = new Servicio(0, IDServicio, NombreServicio, Descripcion);
                servicios.add(servicio);
            }
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
        }
        return servicios;
    }

    public double actualizarMontoPedido(int IDPedido, double montoTotal) {
        String sp = "{? = call FinanzaVenta.sp_ActualizarMontoPedido(?, ?)}"; // Nombre del procedimiento almacenado con el valor de retorno

        try ( java.sql.Connection connection = getSqlConnection();  CallableStatement callable = connection.prepareCall(sp)) {
            // Registrar el parámetro de salida para el valor de retorno
            callable.registerOutParameter(1, java.sql.Types.DECIMAL);

            // Establecer los parámetros del procedimiento almacenado
            callable.setInt(2, IDPedido);
            callable.setBigDecimal(3, BigDecimal.valueOf(montoTotal));

            // Ejecutar el procedimiento almacenado
            callable.execute();

            // Obtener el valor de retorno del procedimiento almacenado
        } catch (SQLException ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE, null, ex);
            return -1; // O cualquier otro valor que desees retornar en caso de error
        }
        return montoTotal;
    }

}
