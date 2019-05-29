package Repo;

import Repo.Interfaces.IGestorDAOSql;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GestorDAOSql implements IGestorDAOSql{

    @Override
    public Connection abrirConexion() {
        Connection conexion=null; 
        try{
            String url="jdbc:sqlserver://DESKTOP-I9B75R1:1433;databaseName=ProyectoFinal;";
            String usuario="sa";
            String clave="81818181";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conexion=DriverManager.getConnection(url,usuario,clave); 

        }catch(ClassNotFoundException | SQLException ex){
            System.out.println(ex.getMessage());
        }
        return conexion;
        
    }

    @Override
    public Connection cerrarConexion() {
        Connection conexion=null;
        try{
            conexion.close();
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
        return conexion;
    }

    @Override
    public Connection iniciarTransaccion() {
        Connection conexion=null;
        try{
            if(conexion==null){
                try{
                    conexion.setAutoCommit(false);
                }catch(SQLException ex){
                    System.out.println(ex.getMessage());
                }
            }
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return conexion;
        
    }

    @Override
    public Connection terminarTransaccion() {
        Connection conexion=null;
        try{
            
            if(conexion!=null){
                try{
                    conexion.commit();  
                }catch(SQLException ex){
                    System.out.println(ex.getMessage());
                }
            }
            
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        
        return conexion;
    }

    @Override
    public Connection cancelarTransaccion() {
       Connection conexion=null;
        try{
            
            if(conexion!=null){
                try{
                    conexion.rollback();
                }catch(SQLException ex){
                    System.out.println(ex.getMessage());
                }
            }
            
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        
        return conexion;
    }

}
