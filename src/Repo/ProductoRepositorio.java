package Repo;

import Entities.DetalleIngreso;
import Entities.Producto;
import Repo.Interfaces.IProductoRepositorio;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

public class ProductoRepositorio implements IProductoRepositorio {

    @Override
    public int InsertarProductos(Producto producto, DetalleIngreso detalleIngreso) {
        Connection cn=null;
        CallableStatement call=null;
        int filasAfectas=0;
        try{
            cn=new GestorDAOSql().abrirConexion();
            String procedimiento="{call spInsertarProducto(?,?,?,?,?,?,?,?,?,?)}";
            call=cn.prepareCall(procedimiento);
            
            call.setString(1,producto.getCodigoBarras());
            call.setString(2,producto.getNombre());
            call.setString(3,producto.getDescripcion());
            call.setInt(4,producto.getCategoria().getIdCategoria());
            call.setInt(5,producto.getPresentacion().getIdPresentacion());
            call.setFloat(6,detalleIngreso.getPrecioCompra());
            call.setFloat(7,detalleIngreso.getPrecioVenta());
            call.setInt(8,detalleIngreso.getStockInicial());
            call.setInt(9,detalleIngreso.getStockMinimo());
            call.setFloat(10,detalleIngreso.getUtilidad());
            
            filasAfectas=call.executeUpdate();          
            
            
            
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        
        return filasAfectas;
        
    }
    
    
    
    
}
