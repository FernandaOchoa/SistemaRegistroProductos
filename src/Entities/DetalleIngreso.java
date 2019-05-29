package Entities;

public class DetalleIngreso {
    
    private int IdDetalleIngreso;
    private float PrecioCompra;
    private float PrecioVenta;
    private int StockMinimo;
    private int StockInicial;
    private int StockActual;
    private float Utilidad;
    private boolean Estado;
    
    public Producto producto;

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }
   
    
    public int getIdDetalleIngreso() {
        return IdDetalleIngreso;
    }

    public void setIdDetalleIngreso(int IdDetalleIngreso) {
        this.IdDetalleIngreso = IdDetalleIngreso;
    }

    public float getPrecioCompra() {
        return PrecioCompra;
    }

    public void setPrecioCompra(float PrecioCompra) {
        this.PrecioCompra = PrecioCompra;
    }

    public float getPrecioVenta() {
        return PrecioVenta;
    }

    public void setPrecioVenta(float PrecioVenta) {
        this.PrecioVenta = PrecioVenta;
    }

    public int getStockMinimo() {
        return StockMinimo;
    }

    public void setStockMinimo(int StockMinimo) {
        this.StockMinimo = StockMinimo;
    }

    public int getStockInicial() {
        return StockInicial;
    }

    public void setStockInicial(int StockInicial) {
        this.StockInicial = StockInicial;
    }

    public int getStockActual() {
        return StockActual;
    }

    public void setStockActual(int StockActual) {
        this.StockActual = StockActual;
    }

    public float getUtilidad() {
        return Utilidad;
    }

    public void setUtilidad(float Utilidad) {
        this.Utilidad = Utilidad;
    }

    public boolean isEstado() {
        return Estado;
    }

    public void setEstado(boolean Estado) {
        this.Estado = Estado;
    }
    
    
    
    
    
}
