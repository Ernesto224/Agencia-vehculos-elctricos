/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Business;

import Data.*;
import Domain.Vehiculo;
import Domain.VehiculoDisponible;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class VehiculoBusiness extends BaseData {

    private final VehiculoData vehiculoData;
    
    public VehiculoBusiness() {
        this.vehiculoData = new VehiculoData();
    }

    public ArrayList<VehiculoDisponible> obtenerVehiculos(Vehiculo vehiculo) {
 
        return this.vehiculoData.obtenerVehiculos(vehiculo);
    }

}
