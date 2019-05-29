package Entities;

public class Presentacion {
    private int IdPresentacion;
    private String Nombre;
    private String Descripcion;

   
    public int getIdPresentacion() {
        return IdPresentacion;
    }

    public void setIdPresentacion(int IdPresentacion) {
        this.IdPresentacion = IdPresentacion;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    
    @Override
    public String toString(){
        return Nombre;
    }
    
    
    
}
