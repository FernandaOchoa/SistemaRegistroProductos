package Repo;

import Entities.Categoria;
import Repo.Interfaces.ICategoriaRepositorio;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CategoriaRepositorio implements ICategoriaRepositorio{

    @Override
    public ArrayList<Categoria> ListarCategorias() {
        ArrayList<Categoria>lista=null;
        Connection cn=null;
        ResultSet rs=null;
        CallableStatement call=null;
        
        try{
            lista=new ArrayList<>();
            cn=new GestorDAOSql().abrirConexion();
            String procedimiento="{call spListarCategorias}";
            call=cn.prepareCall(procedimiento);
            rs=call.executeQuery();
            
            Categoria categoria=null;
            
            while(rs.next()){
                categoria=new Categoria();
                categoria.setNombre(rs.getString("NombreCategoria"));
                lista.add(categoria);
            }
            
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            
        }
        return lista;
    }
    
}
