/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Domain;

/**
 *
 * @author User
 */
public class VehiculoAux {

    // Atributos
    private int idProducto;
    private String marca;
    private String modelo;
    private String paisImportacion;
    private boolean destinadoVenta;
    private double precio;
    private int stock;
    private String nombreAlmacen;

    // Constructor
    public VehiculoAux(int idProducto, String marca, String modelo, String paisImportacion,
            boolean destinadoVenta, double precio, int stock, String nombreAlmacen) {
        this.idProducto = idProducto;
        this.marca = marca;
        this.modelo = modelo;
        this.paisImportacion = paisImportacion;
        this.destinadoVenta = destinadoVenta;
        this.precio = precio;
        this.stock = stock;
        this.nombreAlmacen = nombreAlmacen;
    }

    // Getters y Setters
    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
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

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getNombreAlmacen() {
        return nombreAlmacen;
    }

    public void setNombreAlmacen(String nombreAlmacen) {
        this.nombreAlmacen = nombreAlmacen;
    }
}
