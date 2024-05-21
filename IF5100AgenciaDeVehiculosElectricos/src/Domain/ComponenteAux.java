/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Domain;

/**
 *
 * @author User
 */
public class ComponenteAux {
    // Atributos
    private int idProducto;
    private String nombreComponente;
    private String marcaComponente;
    private String descripcionComponente;
    private String categoriaComponente;
    private int stock;
    private String ubicacion;
    private boolean disponible;

    // Constructor
    public ComponenteAux(int idProducto, String nombreComponente, String marcaComponente, 
                      String descripcionComponente, String categoriaComponente, 
                      int stock, String ubicacion, boolean disponible) {
        this.idProducto = idProducto;
        this.nombreComponente = nombreComponente;
        this.marcaComponente = marcaComponente;
        this.descripcionComponente = descripcionComponente;
        this.categoriaComponente = categoriaComponente;
        this.stock = stock;
        this.ubicacion = ubicacion;
        this.disponible = disponible;
    }

    // Getters y Setters
    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombreComponente() {
        return nombreComponente;
    }

    public void setNombreComponente(String nombreComponente) {
        this.nombreComponente = nombreComponente;
    }

    public String getMarcaComponente() {
        return marcaComponente;
    }

    public void setMarcaComponente(String marcaComponente) {
        this.marcaComponente = marcaComponente;
    }

    public String getDescripcionComponente() {
        return descripcionComponente;
    }

    public void setDescripcionComponente(String descripcionComponente) {
        this.descripcionComponente = descripcionComponente;
    }

    public String getCategoriaComponente() {
        return categoriaComponente;
    }

    public void setCategoriaComponente(String categoriaComponente) {
        this.categoriaComponente = categoriaComponente;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public boolean isDisponible() {
        return disponible;
    }

    public void setDisponible(boolean disponible) {
        this.disponible = disponible;
    }

    // Método toString para imprimir los detalles del componente
    @Override
    public String toString() {
        return "Componente{" +
                "idProducto=" + idProducto +
                ", nombreComponente='" + nombreComponente + '\'' +
                ", marcaComponente='" + marcaComponente + '\'' +
                ", descripcionComponente='" + descripcionComponente + '\'' +
                ", categoriaComponente='" + categoriaComponente + '\'' +
                ", stock=" + stock +
                ", ubicacion='" + ubicacion + '\'' +
                ", disponible=" + disponible +
                '}';
    }
}
