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
    private String NombreComponente;
    private String MarcaComponente;
    private String CategoriaComponente;
    public Componente(String NombreComponente, String MarcaComponente,String CategoriaComponente) {
        this.NombreComponente = NombreComponente;
        this.MarcaComponente = MarcaComponente;
        this.CategoriaComponente = CategoriaComponente;
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

    public String getCategoriaComponente() {
        return CategoriaComponente;
    }

    public void setCategoriaComponente(String CategoriaComponente) {
        this.CategoriaComponente = CategoriaComponente;
    }
}

