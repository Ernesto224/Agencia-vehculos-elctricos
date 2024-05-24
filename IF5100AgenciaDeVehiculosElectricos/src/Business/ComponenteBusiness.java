/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Business;

import Data.*;
import Domain.Componente;
import Domain.ComponenteAux;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class ComponenteBusiness extends BaseData {

    private final ComponenteData componenteData;
    
    public ComponenteBusiness() {
        this.componenteData =  new ComponenteData();
    }

    public ArrayList<ComponenteAux> obtenerComponentes(Componente filtro) {
        
        return this.componenteData.obtenerComponentes(filtro);
    }

}
