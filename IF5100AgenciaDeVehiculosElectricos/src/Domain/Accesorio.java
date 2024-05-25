/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Domain;

/**
 *
 * @author User
 */
public class Accesorio {
     // Atributos
    private String marcaAccesorio;
    private String nombreAccesorio;
    private String categoriaAccesorio;

    // Constructor
    public Accesorio(String marcaAccesorio, String nombreAccesorio, String categoriaAccesorio) {
        this.marcaAccesorio = marcaAccesorio;
        this.nombreAccesorio = nombreAccesorio;
        this.categoriaAccesorio = categoriaAccesorio;
    }

    // Getters y Setters
    public String getMarcaAccesorio() {
        return marcaAccesorio;
    }

    public void setMarcaAccesorio(String marcaAccesorio) {
        this.marcaAccesorio = marcaAccesorio;
    }

    public String getNombreAccesorio() {
        return nombreAccesorio;
    }

    public void setNombreAccesorio(String nombreAccesorio) {
        this.nombreAccesorio = nombreAccesorio;
    }

    public String getCategoriaAccesorio() {
        return categoriaAccesorio;
    }

    public void setCategoriaAccesorio(String categoriaAccesorio) {
        this.categoriaAccesorio = categoriaAccesorio;
    }
}
