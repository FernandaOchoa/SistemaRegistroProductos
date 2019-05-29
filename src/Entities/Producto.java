package Entities;

import java.util.ArrayList;

public class Producto {
    
    private int IdProducto;
    private String CodigoBarras;
    private String Nombre;
    private String Descripcion;
    private String Imagen;
    
    // Relaciones
    public Categoria categoria;
    public Presentacion presentacion;
    public ArrayList<DetalleIngreso> detalleIngreso=new ArrayList<>();
    
    /*public Producto(int IdProducto, String CodigoBarras, String Nombre, String Descripcion, String Imagen) {
        this.IdProducto = IdProducto;
        this.CodigoBarras = CodigoBarras;
        this.Nombre = Nombre;
        this.Descripcion = Descripcion;
        this.Imagen = Imagen;
    }*/

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public Presentacion getPresentacion() {
        return presentacion;
    }

    public void setPresentacion(Presentacion presentacion) {
        this.presentacion = presentacion;
    }

    public ArrayList<DetalleIngreso> getDetalleIngreso() {
        return detalleIngreso;
    }

    public void setDetalleIngreso(ArrayList<DetalleIngreso> detalleIngreso) {
        this.detalleIngreso = detalleIngreso;
    }
    
    

    public int getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(int IdProducto) {
        this.IdProducto = IdProducto;
    }

    public String getCodigoBarras() {
        return CodigoBarras;
    }

    public void setCodigoBarras(String CodigoBarras) {
        this.CodigoBarras = CodigoBarras;
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

    public String getImagen() {
        return Imagen;
    }

    public void setImagen(String Imagen) {
        this.Imagen = Imagen;
    }
    
    
    
    
}
