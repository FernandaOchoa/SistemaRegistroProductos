package Services.Contratos;

import Entities.Categoria;
import Entities.DetalleIngreso;
import Entities.Presentacion;
import Entities.Producto;
import java.util.ArrayList;

public interface IGestionarProductoServicio {
    
    public int InsertarProducto(Producto producto, DetalleIngreso detalleIngreso);
    public ArrayList<Categoria> ListarCategorias();
    public ArrayList<Presentacion> ListarPresentacion();
    
    
}
