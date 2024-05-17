/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Domain;

/**
 *
 * @author User
 */
public class Componente {
    private int IDComponente;
    private String NombreComponente;
    private String MarcaComponente;
    private String DescripcionComponente;
    private String CategoriaComponente;
    private int IDProducto;
    private int IDVehiculo;

    // Constructor
    public Componente(int IDComponente, String NombreComponente, String MarcaComponente, String DescripcionComponente, String CategoriaComponente, int IDProducto, int IDVehiculo) {
        this.IDComponente = IDComponente;
        this.NombreComponente = NombreComponente;
        this.MarcaComponente = MarcaComponente;
        this.DescripcionComponente = DescripcionComponente;
        this.CategoriaComponente = CategoriaComponente;
        this.IDProducto = IDProducto;
        this.IDVehiculo = IDVehiculo;
    }

    // Getters y Setters
    public int getIDComponente() {
        return IDComponente;
    }

    public void setIDComponente(int IDComponente) {
        this.IDComponente = IDComponente;
    }

    public String getNombreComponente() {
        return NombreComponente;
    }

    public void setNombreComponente(String NombreComponente) {
        this.NombreComponente = NombreComponente;
    }

    public String getMarcaComponente() {
        return MarcaComponente;
    }

    public void setMarcaComponente(String MarcaComponente) {
        this.MarcaComponente = MarcaComponente;
    }

    public String getDescripcionComponente() {
        return DescripcionComponente;
    }

    public void setDescripcionComponente(String DescripcionComponente) {
        this.DescripcionComponente = DescripcionComponente;
    }

    public String getCategoriaComponente() {
        return CategoriaComponente;
    }

    public void setCategoriaComponente(String CategoriaComponente) {
        this.CategoriaComponente = CategoriaComponente;
    }

    public int getIDProducto() {
        return IDProducto;
    }

    public void setIDProducto(int IDProducto) {
        this.IDProducto = IDProducto;
    }

    public int getIDVehiculo() {
        return IDVehiculo;
    }

    public void setIDVehiculo(int IDVehiculo) {
        this.IDVehiculo = IDVehiculo;
    }

    // Método para mostrar la información del componente
    @Override
    public String toString() {
        return "Componente{" +
                "IDComponente=" + IDComponente +
                ", NombreComponente='" + NombreComponente + '\'' +
                ", MarcaComponente='" + MarcaComponente + '\'' +
                ", DescripcionComponente='" + DescripcionComponente + '\'' +
                ", CategoriaComponente='" + CategoriaComponente + '\'' +
                ", IDProducto=" + IDProducto +
                ", IDVehiculo=" + IDVehiculo +
                '}';
    }
}

