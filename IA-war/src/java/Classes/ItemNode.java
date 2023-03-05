package Classes;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ItemNode {
    private int id;
    private String name;
    private String type;
    private double price;
    private int condition;
    private String size;
    private String brand;
    private String link;
    private String notes;
    private boolean sold;
    
    private static Statement stmt;
    private static PreparedStatement pstmt;
    private static ResultSet rs;
 
    public ItemNode(int id, String name, String type, double price, int condition, String size, String brand, String link, String notes, boolean sold) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.price = price;
        this.condition = condition;
        this.size = size;
        this.brand = brand;
        this.link = link;
        this.notes = notes;
        this.sold = sold;
    }
    
    public String toString() {
        return id + ", " + name + ", " + type + ", " + price + ", " + condition + ", " + size + ", " + brand + ", " + link + ", " + notes + ", " + sold;
    }
    
    public int numOfImages() {
        int count = 0;
        
        try {
            if (SQLCon.getIsConn() == false) {
                SQLCon.Connect();
            }
            
            String query = "SELECT IMAGE1, IMAGE2, IMAGE3, IMAGE4, IMAGE5 from ITEMS WHERE ID = " + id;
            
            stmt = SQLCon.getConn().createStatement();
            rs = stmt.executeQuery(query);
                           
            rs.next();
            
            byte[] i1 = rs.getBytes("IMAGE1");
            byte[] i2 = rs.getBytes("IMAGE2");
            byte[] i3 = rs.getBytes("IMAGE3");
            byte[] i4 = rs.getBytes("IMAGE4");
            byte[] i5 = rs.getBytes("IMAGE5");
            
            if (i1.length != 0) {
                count++;
            }
            if (i2.length != 0) {
                count++;
            }
            if (i3.length != 0) {
                count++;
            }
            if (i4.length != 0) {
                count++;
            }
            if (i5.length != 0) {
                count++;
            }
                            
        } catch(SQLException e) {
        }
        
        return count;
    }
    
    public int markAsSold() {
                
        try {
            if (SQLCon.getIsConn() == false) {
                SQLCon.Connect();
            }
            
            String query = "UPDATE ITEMS SET sold = ? WHERE ID = " + id;
            
            stmt = SQLCon.getConn().createStatement();
            pstmt = SQLCon.getConn().prepareStatement(query);
            
            pstmt.setBoolean(1, true);
            
            pstmt.executeUpdate();
                            
        } catch(SQLException e) {
        }
        
        return 0;
    }    
    
    public int markAsNotSold() {
        try {
            if (SQLCon.getIsConn() == false) {
                SQLCon.Connect();
            }
            
            String query = "UPDATE ITEMS SET sold = ? WHERE ID = " + id;
            
            stmt = SQLCon.getConn().createStatement();
            pstmt = SQLCon.getConn().prepareStatement(query);
            
            pstmt.setBoolean(1, false);
            
            pstmt.executeUpdate();
                            
        } catch(SQLException e) {
            System.out.println("Failed");
        }
        
        return 1;
    }
    
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public double getPrice() {
        return price;
    }

    public int getCondition() {
        return condition;
    }

    public String getSize() {
        return size;
    }

    public String getBrand() {
        return brand;
    }

    public String getLink() {
        return link;
    }

    public String getNotes() {
        return notes;
    }

    public boolean isSold() {
        return sold;
    }
}
