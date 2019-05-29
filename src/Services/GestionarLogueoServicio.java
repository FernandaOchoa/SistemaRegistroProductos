package Services;

import Services.Contratos.IGestionarLogueoServicio;
import Entities.Usuario;
import Repo.Interfaces.IUsuarioRepositorio;
import Repo.UsuarioRepositorio;

public class GestionarLogueoServicio implements IGestionarLogueoServicio{

    final private IUsuarioRepositorio _repositorioUsuario;
    
    public GestionarLogueoServicio(){
        _repositorioUsuario=new UsuarioRepositorio();
    }
    
    @Override
    public boolean VerificarAcceso(Usuario usuario) {
      
        try{
            return _repositorioUsuario.VerificarAcceo(usuario);
            
        }catch(Exception ex){
            System.out.println(ex.getMessage());
            throw ex;
        }
        
        
    }
    
    
}
