package Upload;

import Classes.SQLCon;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/images/*")
public class ImageServlet extends HttpServlet {

    private static Statement stmt;
    private static PreparedStatement pstmt;
    private static ResultSet rs;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String img = request.getPathInfo().substring(1);       
                
        String ID = img.substring(0,2);
        int num = Integer.parseInt(img.substring(img.length()-1, img.length()));
        
        System.out.println(ID + "  " + num);
                        
        try {
            if (SQLCon.getIsConn() == false) {
                SQLCon.Connect();
            }
                        
            String query = "SELECT * FROM ITEMS WHERE ID = " + ID;
           
            stmt = SQLCon.getConn().createStatement();
            
            pstmt = SQLCon.getConn().prepareStatement(query);                       
                                    
            rs = pstmt.executeQuery();
            
            rs.next();
            
            byte[] content = rs.getBytes("IMAGE" + num);                
            response.setContentType(getServletContext().getMimeType(ID));
            response.setContentLength(content.length);
            response.getOutputStream().write(content);
            
        } catch(SQLException e) { 
        }
    }
}
