/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Domain;

/**
 *
 * @author User
 */
public class VehiculoDisponible {

    private int idProducto;
    private String marcaVehiculo;
    private String modeloVehiculo;
    private String paisImportacion;
    private boolean destinadoVenta;
    private double precio;
    private int cantidadProducto;
    private String ubicacion;

    // Constructor
    public VehiculoDisponible(int idProducto, String marcaVehiculo, String modeloVehiculo, String paisImportacion,
                              boolean destinadoVenta, double precio, int cantidadProducto, String ubicacion) {
        this.idProducto = idProducto;
        this.marcaVehiculo = marcaVehiculo;
        this.modeloVehiculo = modeloVehiculo;
        this.paisImportacion = paisImportacion;
        this.destinadoVenta = destinadoVenta;
        this.precio = precio;
        this.cantidadProducto = cantidadProducto;
        this.ubicacion = ubicacion;
    }

    // Getters y Setters
    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getMarcaVehiculo() {
        return marcaVehiculo;
    }

    public void setMarcaVehiculo(String marcaVehiculo) {
        this.marcaVehiculo = marcaVehiculo;
    }

    public String getModeloVehiculo() {
        return modeloVehiculo;
    }

    public void setModeloVehiculo(String modeloVehiculo) {
        this.modeloVehiculo = modeloVehiculo;
    }

    public String getPaisImportacion() {
        return paisImportacion;
    }

    public void setPaisImportacion(String paisImportacion) {
        this.paisImportacion = paisImportacion;
    }

    public boolean isDestinadoVenta() {
        return destinadoVenta;
    }

    public void setDestinadoVenta(boolean destinadoVenta) {
        this.destinadoVenta = destinadoVenta;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getCantidadProducto() {
        return cantidadProducto;
    }

    public void setCantidadProducto(int cantidadProducto) {
        this.cantidadProducto = cantidadProducto;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }
}
