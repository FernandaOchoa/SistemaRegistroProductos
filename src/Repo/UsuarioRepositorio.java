package Repo;

import Entities.Persona;
import Entities.Usuario;
import Repo.Interfaces.IUsuarioRepositorio;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UsuarioRepositorio implements IUsuarioRepositorio{

    @Override
    public boolean VerificarAcceo(Usuario usuario) {
          ArrayList<Usuario>lista=new ArrayList<>();
        boolean existe=false;
        try{
            Connection cn=new GestorDAOSql().abrirConexion();
            String procedimiento="{call spVerificarAcceso(?,?,?)}";
            CallableStatement call=cn.prepareCall(procedimiento);
            call.setString("usuario",usuario.getUsuario());
            call.setString("clave",usuario.getClave());
            call.setString("cargo",usuario.getCargo());
            
            ResultSet rs=call.executeQuery();
            while(rs.next()){
                Usuario us=new Usuario();
                us.setUsuario(rs.getString("usuario"));
                us.setCargo(rs.getString("cargo"));
                    Persona p=new Persona();
                    p.setApellidos(rs.getString("Apellidos"));
                    
                    us.persona=p;
                lista.add(us);
                                       
            }
            existe=lista.size()>0;         
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        return existe;                
    }

}
