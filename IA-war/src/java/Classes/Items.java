package Classes;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Items {    
    private static Statement stmt;
    private static ResultSet rs;
    private static PreparedStatement pstmt;
        
    private ArrayList<ItemNode> items;
    
    public Items() throws IOException {
        items = new ArrayList<>();
        AddExistingData();
        
    }
    
    
    public void AddExistingData() throws IOException {
        try {
            if (SQLCon.getIsConn() == false) {
                SQLCon.Connect();
            }
            
            String query = "SELECT * from ITEMS";
            
            stmt = SQLCon.getConn().createStatement();
            rs = stmt.executeQuery(query);
            
            while (rs.next()) {   
                items.add(new ItemNode(rs.getInt("ID"), rs.getString("NAME"), rs.getString("TYPE"), rs.getDouble("PRICE"), rs.getInt("Condition"), 
                        rs.getString("Size"), rs.getString("Brand"), rs.getString("Link"), rs.getString("Notes"), rs.getBoolean("Sold")));                
            }
            
        } catch(SQLException e) {
        }
    }
  
    public void refreshItems() throws IOException {
        
        
        
        
        
        items = new ArrayList<>();
        AddExistingData();
    }

    public ArrayList<ItemNode> getItems() {
        return items;
    }      
    
    public void removeItem(int index) throws IOException {        
        try {
            if (SQLCon.getIsConn() == false) {
                SQLCon.Connect();
            }
            
            String sql = "DELETE FROM Items WHERE ID = ?";
            PreparedStatement preparedStatement = SQLCon.getConn().prepareStatement(sql);
            preparedStatement.setInt(1, items.get(index).getId());
            preparedStatement.executeUpdate();
            
//            String query = "DELETE FROM Items WHERE ID = " + items.get(index).getId();
//            
//            stmt = SQLCon.getConn().createStatement();
//            pstmt = SQLCon.getConn().prepareStatement(query);
//            
//            pstmt.setBoolean(1, true);
//            
//            pstmt.executeUpdate();
                            
        } catch(SQLException e) {
        }
        
//        items.remove(index);
    }
}
