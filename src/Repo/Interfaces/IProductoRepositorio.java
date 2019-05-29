package Repo.Interfaces;

import Entities.DetalleIngreso;
import Entities.Producto;

public interface IProductoRepositorio {
 
    public int InsertarProductos(Producto producto, DetalleIngreso detalleIngreso);
    
}
