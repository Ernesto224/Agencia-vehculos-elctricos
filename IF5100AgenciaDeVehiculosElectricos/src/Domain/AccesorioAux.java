/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Domain;

/**
 *
 * @author User
 */
public class AccesorioAux {
    // Atributos
    private int idProducto;
    private String nombreAccesorio;
    private String marcaAccesorio;
    private String descripcionAccesorio;
    private String categoriaAccesorio;
    private int stock;
    private String ubicacion;
    private boolean disponible;

    // Constructor
    public AccesorioAux(int idProducto, String nombreAccesorio, String marcaAccesorio, 
                        String descripcionAccesorio, String categoriaAccesorio, 
                        int stock, String ubicacion, boolean disponible) {
        this.idProducto = idProducto;
        this.nombreAccesorio = nombreAccesorio;
        this.marcaAccesorio = marcaAccesorio;
        this.descripcionAccesorio = descripcionAccesorio;
        this.categoriaAccesorio = categoriaAccesorio;
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

    public String getNombreAccesorio() {
        return nombreAccesorio;
    }

    public void setNombreAccesorio(String nombreAccesorio) {
        this.nombreAccesorio = nombreAccesorio;
    }

    public String getMarcaAccesorio() {
        return marcaAccesorio;
    }

    public void setMarcaAccesorio(String marcaAccesorio) {
        this.marcaAccesorio = marcaAccesorio;
    }

    public String getDescripcionAccesorio() {
        return descripcionAccesorio;
    }

    public void setDescripcionAccesorio(String descripcionAccesorio) {
        this.descripcionAccesorio = descripcionAccesorio;
    }

    public String getCategoriaAccesorio() {
        return categoriaAccesorio;
    }

    public void setCategoriaAccesorio(String categoriaAccesorio) {
        this.categoriaAccesorio = categoriaAccesorio;
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
}
