package Services;

import Services.Contratos.IGestionarProductoServicio;
import Entities.Categoria;
import Entities.DetalleIngreso;
import Entities.Presentacion;
import Entities.Producto;
import Repo.CategoriaRepositorio;
import Repo.GestorDAOSql;
import Repo.Interfaces.ICategoriaRepositorio;
import Repo.Interfaces.IPresentacionRepositorio;
import Repo.Interfaces.IProductoRepositorio;
import Repo.PresentacionRepositorio;
import Repo.ProductoRepositorio;
import java.util.ArrayList;

public class GestionarProductoServicio implements IGestionarProductoServicio{

    final private IProductoRepositorio _repositorioProducto;
    final private ICategoriaRepositorio _repositorioCategoria;
    final private IPresentacionRepositorio _repositorioPresentacion;
    
    public GestionarProductoServicio(){
        _repositorioProducto=new ProductoRepositorio();
        _repositorioCategoria=new CategoriaRepositorio();
        _repositorioPresentacion=new PresentacionRepositorio();
    }
    
    @Override
    public int InsertarProducto(Producto producto, DetalleIngreso detalleIngreso) {
       
        try{
            
           new GestorDAOSql().iniciarTransaccion();
           int productoId=_repositorioProducto.InsertarProductos(producto, detalleIngreso);
           
           if(productoId<0){
               new GestorDAOSql().terminarTransaccion();
           }
           return productoId;
           
            
        }catch(Exception ex){
            new GestorDAOSql().cancelarTransaccion();
            System.out.println(ex.getMessage());
            throw ex;
        }
     
    }

    @Override
    public ArrayList<Categoria> ListarCategorias() {
        try{
            
            return _repositorioCategoria.ListarCategorias();            
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            throw ex;
        }
                
    }

    @Override
    public ArrayList<Presentacion> ListarPresentacion() {
          try{
            
            return _repositorioPresentacion.ListarPresentacion();
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            throw ex;
        }
    }
    
}
