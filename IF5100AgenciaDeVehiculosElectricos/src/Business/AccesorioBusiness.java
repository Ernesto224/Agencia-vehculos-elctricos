/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Business;

import Data.*;
import Domain.Accesorio;
import Domain.AccesorioAux;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class AccesorioBusiness extends BaseData {

    private final AccesorioData accesorioData;
    public AccesorioBusiness() {
        this.accesorioData = new AccesorioData();
    }

    public ArrayList<AccesorioAux> obtenerAccesorios(Accesorio accesorio) {
        
        return this.accesorioData.obtenerAccesorios(accesorio);
    }

}
