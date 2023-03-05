package Upload;

import Classes.SQLCon;
import Classes.AddItem;
import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
 
@WebServlet("/upload")
@MultipartConfig(maxFileSize = 16177215)
public class FileUploadDBServlet extends HttpServlet {
     
    private PreparedStatement pstmt;
    private Statement stmt;
    
    private AddItem i = new AddItem();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {       
        HttpSession session = request.getSession();
                            
        int check = i.checkData(request.getParameter("Item Name"), request.getParameter("Type"), request.getParameter("Price"), 
                request.getParameter("Condition"), request.getParameter("Size"),  request.getParameter("Brand"), 
                request.getParameter("Link"), request.getParameter("Notes"));
                
        if (check == 0) {
            session.setAttribute("Done", "0");
            
            String name = request.getParameter("Item Name");
            String type = request.getParameter("Type");
            Double price = Double.parseDouble(request.getParameter("Price"));
            Integer condition = Integer.parseInt(request.getParameter("Condition"));
            String size = request.getParameter("Size");
            String brand = request.getParameter("Brand");
            String link = request.getParameter("Link");
            String notes = request.getParameter("Notes");
            
            InputStream iStream1 = null;
            Part fPart1 = request.getPart("Image1");
            if (fPart1 != null) {
                iStream1 = fPart1.getInputStream();
            }

            InputStream iStream2 = null;
            Part fPart2 = request.getPart("Image2");
            if (fPart2 != null) {
                iStream2 = fPart2.getInputStream();
            }

            InputStream iStream3 = null;
            Part fPart3 = request.getPart("Image3");
            if (fPart3 != null) {
                iStream3 = fPart3.getInputStream();
            }

            InputStream iStream4 = null;
            Part fPart4 = request.getPart("Image4");
            if (fPart4 != null) {
                iStream4 = fPart4.getInputStream();
            }

            InputStream iStream5 = null;
            Part fPart5 = request.getPart("Image5");
            if (fPart5 != null) {
                iStream5 = fPart5.getInputStream();
            }

            try {
                if (SQLCon.getIsConn() == false) {
                    SQLCon.Connect();
                }

                String query = "INSERT INTO ITEMS (Name, Type, Price, Condition, Size, Brand, Link, Notes, Sold, Image1, Image2, Image3, Image4, Image5) "
                        + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                stmt = SQLCon.getConn().createStatement();
                pstmt = SQLCon.getConn().prepareStatement(query);

                pstmt.setString(1, name);
                pstmt.setString(2, type);
                pstmt.setDouble(3, price);
                pstmt.setInt(4, condition);
                pstmt.setString(5, size);
                pstmt.setString(6, brand);
                pstmt.setString(7, link);
                pstmt.setString(8, notes);
                pstmt.setBoolean(9, false);

                if (iStream1 != null) {
                    pstmt.setBlob(10, iStream1);
                }

                if (iStream2 != null) {
                    pstmt.setBlob(11, iStream2);
                }

                if (iStream3 != null) {
                    pstmt.setBlob(12, iStream3);
                }

                if (iStream4 != null) {
                    pstmt.setBlob(13, iStream4);
                }

                if (iStream5 != null) {
                    pstmt.setBlob(14, iStream5);
                }

                pstmt.executeUpdate();

            } catch (SQLException e) {
            }
        } else if(check == 1) {
            session.setAttribute("Done", "1");
        }             
            response.sendRedirect("additem.jsp");
    }
}




