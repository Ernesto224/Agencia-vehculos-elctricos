/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Data;

import Domain.Movimiento;
import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.ResultSet;

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

            ResultSet resultSet = callable.executeQuery();

            while (resultSet.next()) {
                int IDProducto = resultSet.getInt("IDProducto");
                String Vehiculo = resultSet.getString("Vehiculo");
                String Accesorio = resultSet.getString("Accesorio");
                String Componente = resultSet.getString("Componenente");
                int CantidadMovida = resultSet.getInt("CantidadMovida");

                Movimiento movimiento = new Movimiento(IDProducto, Vehiculo, Accesorio, Componente, CantidadMovida);
                movimientos.add(movimiento);
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

}
