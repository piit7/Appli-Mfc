
package application;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.AbstractTableModel;


public class ResultSetTableModel extends AbstractTableModel {
    
    //déclaration
    //ResultSet contient les résultat d'une requete
    
    private ResultSet rs;
    
    public ResultSetTableModel(ResultSet rs){
        this.rs = rs;
        fireTableDataChanged();
    }
    
    //Fonction compte NbColonne
    public int getColumnCount(){
        try{
            if (rs == null){
                return 0;
            } else {
                return rs.getMetaData().getColumnCount();
            }
        } catch (SQLException e) {
            System.out.println("getColumncount resulteset generating error while getting column count"); // Message d'erreur
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    //Fonction compte NbLigne
    public int getRowCount(){
        try{
            if (rs == null){
                return 0;
            } else {
                rs.last();
                return rs.getRow();
            }
        } catch (SQLException e) {
            System.out.println("getrowcount resulteset generating error while getting rows count"); // Message d'erreur
            System.out.println(e.getMessage());
            return 0;
        }
    }
    
    //Fonction récupère valeur
    public Object getValueAt(int rowIndex, int columnIndex){
        if (rowIndex < 0 || rowIndex > getRowCount() || columnIndex < 0 || columnIndex > getColumnCount()){
            return null;
        }
        try {
            if (rs == null) {
                return null;
            } else {
                rs.absolute(rowIndex + 1);
                return rs.getObject(columnIndex + 1);
            }
        } catch (SQLException e) {
            System.out.println("getvalueat resultset generating error while fetching rows");
            System.out.println(e.getMessage());
            return null;
        }
    }
    //fonction récupère nom colonne
    @Override
    public String getColumnName(int columnIndex){
        try {
            return rs.getMetaData().getColumnName(columnIndex + 1);
        } catch (SQLException e) {
            System.out.println("getColumnname resulstset generating error while fetching column name");
            System.out.println(e.getMessage());
            }
        return super.getColumnName(columnIndex);
    }
}
