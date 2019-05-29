package Repo;

import Entities.Presentacion;
import Repo.Interfaces.IPresentacionRepositorio;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PresentacionRepositorio implements IPresentacionRepositorio{

    @Override
    public ArrayList<Presentacion> ListarPresentacion() {
        ArrayList<Presentacion>lista=null;
        Connection cn=null;
        ResultSet rs=null;
        CallableStatement call=null;
        
        try{
            lista=new ArrayList<>();
            cn=new GestorDAOSql().abrirConexion();
            String procedimiento="{call spListarPresentacion}";
            call=cn.prepareCall(procedimiento);
            rs=call.executeQuery();
            
            Presentacion presentacion=null;
            
            while(rs.next()){
                presentacion=new Presentacion();
                presentacion.setNombre(rs.getString("NombrePresentacion"));
                lista.add(presentacion);
            }
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
       
        return lista;
        
    }
    
}
