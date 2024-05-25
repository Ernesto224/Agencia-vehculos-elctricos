/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Domain;

/**
 *
 * @author User
 */
public class Movimiento {

    private int IDProducto;
    private String Vehiculo;
    private String Accesorio;
    private String Componente;
    private int CantidadMovida;

    public Movimiento(int IDProducto, String Vehiculo, String Accesorio, String Componente, int CantidadMovida) {
        this.IDProducto = IDProducto;
        this.Vehiculo = Vehiculo;
        this.Accesorio = Accesorio;
        this.Componente = Componente;
        this.CantidadMovida = CantidadMovida;
    }

    // Getters y setters según sea necesario
    public int getIDProducto() {
        return IDProducto;
    }

    public void setIDProducto(int IDProducto) {
        this.IDProducto = IDProducto;
    }

    public String getVehiculo() {
        return Vehiculo;
    }

    public void setVehiculo(String vehiculo) {
        Vehiculo = vehiculo;
    }

    public String getAccesorio() {
        return Accesorio;
    }

    public void setAccesorio(String accesorio) {
        Accesorio = accesorio;
    }

    public String getComponente() {
        return Componente;
    }

    public void setComponente(String componente) {
        Componente = componente;
    }

    public int getCantidadMovida() {
        return CantidadMovida;
    }

    public void setCantidadMovida(int cantidadMovida) {
        CantidadMovida = cantidadMovida;
    }
}
