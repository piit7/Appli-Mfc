
package application;

import java.net.Socket;
import java.sql.*;

public class BDD {
    
    // Déclarations
    
    Connection connection;
    Statement statement;
    String SQL;
    
    String url;
    String username;
    String password;
    Socket client; // Manipulation des fichiers
    int Port;
    String Host;
    
    // Classe information BDD 
    public BDD(String url, String username, String password, String Host, int Port){
        this.url = url; // This correspond a l'objet utiliser de la classe courante
        this.username = username;
        this.password = password;
        this.Host = Host;
        this.Port = Port;
    }
    
    // fonction connection à la BDD
    public Connection connexionDatabase() {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            
            connection = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            System.err.println(e.getMessage()); // Localisation du probleme
        }
        return connection;
    }
    
    // fonction déconnection à la BDD
    public Connection closeconnexion() {
        try{
            connection.close();
        } catch (Exception e) {
            System.err.println(e);
        }
        return connection;
    }
    
    // Permet execution de requete 
    public ResultSet exécutionQuery (String sql) {
        connexionDatabase();
        ResultSet resultSet = null;
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            System.out.println(sql);
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return resultSet;
    }
    
    // Permet Update Requete
    public String exécutionUpdate(String sql){
        connexionDatabase();
        String result = "";
        try {
            statement = connection.createStatement();
            statement.executeUpdate(sql);
            result = sql;
        } catch (SQLException ex) {
            result = ex.toString();
        }
        return result;
    }
    
    // Permet afficher Tous !
    public ResultSet querySelectAll (String nomTable) {
        connexionDatabase();
        SQL = "SELECT * FROM " + nomTable;
        System.out.println(SQL);
        return this.exécutionQuery(SQL);
    }
 
    // Permet afficher Tous en fonction de l'"état" (Faire ceci avec les autre fonction)
    public ResultSet querySelectAll (String nomTable, String état) {
        connexionDatabase();
        SQL = "SELECT * FROM " + nomTable + " WHERE " + état;
        return this.exécutionQuery(SQL);
    }
 
    // Permet afficher la table selon les colonnes demandées
    public ResultSet querySelect(String[] nomColonne, String nomTable){
        connexionDatabase();
        int i;
        SQL = "SELECT ";
        
        for (i = 0; i<= nomColonne.length - 1; i++) {
            SQL +=nomColonne[i];
            if (i < nomColonne.length - 1) {
                SQL += ",";
            }
        }
        
        SQL += " FROM " + nomTable;
        return this.exécutionQuery(SQL);
    }

    // Permet afficher la table selon les colonnes demandées et en fonction de l'état
    public ResultSet querySelect(String[] nomColonne, String nomTable, String état){
        connexionDatabase();
        int i;
        SQL = "SELECT ";
        
        for (i = 0; i<= nomColonne.length - 1; i++) {
            SQL +=nomColonne[i];
            if (i < nomColonne.length - 1) {
                SQL += ",";
            }
        }
        
        SQL += " FROM " + nomTable + " WHERE " + état;
        return this.exécutionQuery(SQL);
    }

    // Insertion dans la base de donnée
    public String queryInsert(String nomTable, String[] contenuTableau){
        connexionDatabase();
        int i;
        SQL = "INSERT INTO " + nomTable + " VALUES(";
        
        for (i = 0; i<= contenuTableau.length - 1; i++) {
            SQL += "'" + contenuTableau[i] + "'";
            if (i < contenuTableau.length - 1){
                SQL += ",";
            }
        }
        
        SQL += ")";
        return this.exécutionUpdate(SQL);
    }

    // Insertion dans la base de donnée en fonction des colonnes
    public String queryInsert(String nomTable, String[] nomColonne, String[] contenuTableau){
        connexionDatabase();
        int i;
        SQL = "INSERT INTO " + nomTable + " (";
        
        for (i = 0; i<= nomColonne.length - 1; i++) {
            SQL += nomColonne[i];
            if (i < nomColonne.length - 1){
                SQL += ",";
            }
        }
        
        SQL += ") VALUES(";
        
        for (i = 0; i<= contenuTableau.length - 1; i++) {
            SQL += "'" + contenuTableau[i] + "'";
            if (i < contenuTableau.length - 1){
                SQL += ",";
            }
        }
        
        SQL += ")";
        return this.exécutionUpdate(SQL);
    }
    
    // MAJ selon les colonnes et l'état
    public String queryUpdate(String nomTable, String[] nomColonne, String[] contenuTableau, String état){
        connexionDatabase();
        int i;
        SQL = "UPDATE " + nomTable + " SET ";
        
        for (i = 0; i <= nomColonne.length - 1; i++){
            SQL += nomColonne[i] + "='" + contenuTableau[i] +"'";
            if (i < nomColonne.length - 1){
                SQL += ",";
            }
        }
        
        SQL += " WHERE " + état;
        return this.exécutionUpdate(SQL);
    }

    // Suppresion de table, nomtable avec petit T
    public String queryDelete(String nomtable){
        connexionDatabase();
        SQL = "DELETE FROM " + nomtable;
        return this.exécutionUpdate(SQL);
    }
    
    // Suppresion de table avec parametre, nomtable avec petit T
    public String queryDelete(String nomtable, String état){
        connexionDatabase();
        SQL = "DELETE FROM " + nomtable + " WHERE " + état;
        return this.exécutionUpdate(SQL);
    }
    
}


 