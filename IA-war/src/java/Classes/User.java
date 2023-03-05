package Classes;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class User {
        
    private PreparedStatement pstmt;
    private Statement stmt;
    private ResultSet rs;
        
    public void addUser(String FName, String LName, String Email, String User, String Pass) throws SQLException {
                
        try {            
            if (SQLCon.getIsConn() == false) {
                SQLCon.Connect();
            }
                                    
            String SQL = "INSERT INTO USERS"
                    + " (FirstName, LastName, Email, Username, Password)"
                    + " values (?,?,?,?,?)";

            stmt = SQLCon.getConn().createStatement();
            pstmt = SQLCon.getConn().prepareStatement(SQL);
            
            pstmt.setString(1, FName);
            pstmt.setString(2, LName);
            pstmt.setString(3, Email);
            pstmt.setString(4, User);
            pstmt.setString(5, Pass);

            pstmt.executeUpdate();
                        
        } catch (SQLException exc) {
        }
    }
    
    public int checkUser(String user) {                
        if (user.equals("")) {
            return 2;
        }
        
        try {
            
            if (SQLCon.getIsConn() == false) {
                SQLCon.Connect();
            }
            
            String query = "SELECT * FROM USERS WHERE USERNAME = '" + user + "'";
            
            stmt = SQLCon.getConn().createStatement();
            rs = stmt.executeQuery(query);
            
            rs.next();
            
            try {
                String temp = rs.getString("Username");
                return 1;
            } catch (Exception e) {
                System.out.println("yes");
                e.printStackTrace();
                
                return 0;
            }
            
        } catch (SQLException e) {
            return 1;
        }
    }
    
    public int checkEmail(String email) {
        try {            
            if (SQLCon.getIsConn() == false) {
                SQLCon.Connect();
            }

            String query = "SELECT * FROM USERS WHERE EMAIL = '" + email + "'";
            
            stmt = SQLCon.getConn().createStatement();
            rs = stmt.executeQuery(query);
            
            rs.next();
            
            try {
                String temp = rs.getString("Username");
                return 1;
            } catch (SQLException e) {                
                return 0;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            return 1;
        }
    }
    
    public int checkNewUser(String FName, String LName, String Email, String User, String Pass1, String Pass2) {
                        
        if (FName.equals("") || LName.equals("") || Email.equals("") || User.equals("") || Pass1.equals("") || Pass2.equals("")) {
            return 1;
        } else if (!Pass1.equals(Pass2)) {
            return 2; 
        } else if (!Email.contains("@") || !Email.contains(".")) {
            return 3;
        } else if (checkEmail(Email) == 1) {         
            return 4;
        } else if (checkUser(User) == 1) {
            return 5;
        }
        return 0;
    }
    
    public static String getError1() {
        return "Please Enter All Data";
    }
    
    public static String getError2() {
        return "Passwords Don't Match";
    }
    
    public static String getError3() {
        return "Please Enter a Valid Email";
    }
    
    public static String getError4() {
        return "Email is Already in Use";
    }
    
    public static String getError5() {
        return "Username is Already in Use";
    }
    
         
    public int checkUser(String User, String Pass) throws SQLException {
                
        if (SQLCon.getIsConn() == false) {
            SQLCon.Connect();
        }
        
        String query = "SELECT PASSWORD FROM USERS WHERE USERNAME = '" + User + "'";
                
        try {
            stmt = SQLCon.getConn().createStatement();
            rs = stmt.executeQuery(query);
            
            rs.next();
                        
            String checkPass = rs.getString("PASSWORD");
                
            return 0;           
        } catch (Exception e) {
            e.printStackTrace();
            return 6;
        }
    }
    
    public static String getError6() {
        return "Password and Username Don't Match";
    }
    
    public String getName(String User) throws SQLException {
                
        if (SQLCon.getIsConn() == false) {
            SQLCon.Connect();
        }
        
        String query = "SELECT FIRSTNAME FROM USERS WHERE USERNAME = '" + User + "'";
        
        try {
            stmt = SQLCon.getConn().createStatement();
            rs = stmt.executeQuery(query);

            rs.next();

            return rs.getString("FIRSTNAME");
        } catch (SQLException e) {            
            return "error";
        }
    }
    
    public void updateUser(String user, String column, String newData) throws SQLException {
                
        if (SQLCon.getIsConn() == false) {
            SQLCon.Connect();
        }
        
        String query = "UPDATE USERS SET " + column + " = " + "'" + newData + "' WHERE USERNAME = '" + user + "'";
        
        if (column.equals("Password")) {
            query = "UPDATE USERS SET " + column + " = " + "'" + newData + "' WHERE USERNAME = '" + user + "'";
        }
        
        try {
            stmt = SQLCon.getConn().createStatement();
           
            stmt.executeUpdate(query);
            
        } catch (SQLException e) {
        }
    }
    
    public void saveItem(String user, int id) throws SQLException {        
        try {
            if (SQLCon.getIsConn() == false) {
                SQLCon.Connect();
            }

            String query = "INSERT INTO SavedItems (Username, ItemID) values (?, ?)";

            stmt = SQLCon.getConn().createStatement();
            pstmt = SQLCon.getConn().prepareStatement(query);

            pstmt.setString(1, user);
            pstmt.setInt(2, id);

            pstmt.executeUpdate();
        } catch (SQLException e) {
        }                
    }
    
    public void removeSaved(String user, int id) throws SQLException {
        if (SQLCon.getIsConn() == false) {
            SQLCon.Connect();
        }
        
        String query = "DELETE FROM SavedItems WHERE Username = '" + user + "' AND ItemID = " + id;
                
        try {
            stmt = SQLCon.getConn().createStatement();
            
            stmt.execute(query);            
        } catch (SQLException e) {            
        }        
    }
    
    public ArrayList<Integer> savedItemsList(String user) throws SQLException {
        ArrayList<Integer> nums = new ArrayList<>();
        
        if (SQLCon.getIsConn() == false) {
            SQLCon.Connect();
        }
        
        String query = "SELECT ITEMID FROM SAVEDITEMS WHERE USERNAME = '" + user + "'";
        
        try {
            stmt = SQLCon.getConn().createStatement();
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                nums.add(rs.getInt("ITEMID"));
            }            
        } catch (SQLException e) {            
        }
        
        return nums;
    }
}