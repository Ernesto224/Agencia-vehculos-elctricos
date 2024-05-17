/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Domain;

/**
 *
 * @author User
 */
public class Vehiculo {
    private int IDVehiculo;
    private String Marca;
    private String Modelo;
    private String PaisImportación;
    private String DestinadoVenta;
    private int IDProducto;
    private int IDTpoVehiculo;

    // Constructor
    public Vehiculo(int IDVehiculo, String Marca, String Modelo, String PaisImportación, String DestinadoVenta, int IDProducto, int IDTpoVehiculo) {
        this.IDVehiculo = IDVehiculo;
        this.Marca = Marca;
        this.Modelo = Modelo;
        this.PaisImportación = PaisImportación;
        this.DestinadoVenta = DestinadoVenta;
        this.IDProducto = IDProducto;
        this.IDTpoVehiculo = IDTpoVehiculo;
    }

    // Getters y Setters
    public int getIDVehiculo() {
        return IDVehiculo;
    }

    public void setIDVehiculo(int IDVehiculo) {
        this.IDVehiculo = IDVehiculo;
    }

    public String getMarca() {
        return Marca;
    }

    public void setMarca(String Marca) {
        this.Marca = Marca;
    }

    public String getModelo() {
        return Modelo;
    }

    public void setModelo(String Modelo) {
        this.Modelo = Modelo;
    }

    public String getPaisinportación() {
        return PaisImportación;
    }

    public void setPaisinportación(String PaisImportación) {
        this.PaisImportación = PaisImportación;
    }

    public String isDestinadoVenta() {
        return DestinadoVenta;
    }

    public void setDestinadoVenta(String DestinadoVenta) {
        this.DestinadoVenta = DestinadoVenta;
    }

    public int getIDProducto() {
        return IDProducto;
    }

    public void setIDProducto(int IDProducto) {
        this.IDProducto = IDProducto;
    }

    public int getIDTpoVehiculo() {
        return IDTpoVehiculo;
    }

    public void setIDTpoVehiculo(int IDTpoVehiculo) {
        this.IDTpoVehiculo = IDTpoVehiculo;
    }

    // Método para mostrar la información del vehículo
    @Override
    public String toString() {
        return "Vehiculo{" +
                "IDVehiculo=" + IDVehiculo +
                ", Marca='" + Marca + '\'' +
                ", Modelo='" + Modelo + '\'' +
                ", Paisinportación='" + PaisImportación + '\'' +
                ", DestinadoVenta=" + DestinadoVenta +
                ", IDProducto=" + IDProducto +
                ", IDTpoVehiculo=" + IDTpoVehiculo +
                '}';
    }
}
