package Classes;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Items {    
    private static Statement stmt;
    private static ResultSet rs;
        
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
}
