package Repo.Interfaces;

import java.sql.Connection;

public interface IGestorDAOSql {
    public Connection abrirConexion();
    public Connection cerrarConexion();
    public Connection iniciarTransaccion();
    public Connection terminarTransaccion(); 
    public Connection cancelarTransaccion();
}
