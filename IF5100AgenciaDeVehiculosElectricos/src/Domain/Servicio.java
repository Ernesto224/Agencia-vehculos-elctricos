/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Domain;

/**
 *
 * @author User
 */
public class Servicio {
    // Atributos
    private int IDPedido;
    private int IDServicio;
    private String NombreServicio;
    private String Descripcion;

    // Constructor
    public Servicio(int IDPedido, int IDServicio, String NombreServicio, String Descripcion) {
        this.IDPedido = IDPedido;
        this.IDServicio = IDServicio;
        this.NombreServicio = NombreServicio;
        this.Descripcion = Descripcion;
    }

    // Getters y Setters
    public int getIDPedido() {
        return IDPedido;
    }

    public void setIDPedido(int IDPedido) {
        this.IDPedido = IDPedido;
    }

    public int getIDServicio() {
        return IDServicio;
    }

    public void setIDServicio(int IDServicio) {
        this.IDServicio = IDServicio;
    }

    public String getNombreServicio() {
        return NombreServicio;
    }

    public void setNombreServicio(String NombreServicio) {
        this.NombreServicio = NombreServicio;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
}

