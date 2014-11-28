/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Abhinav Kumar
 */
public class Personal_MedicalServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        try{
        String h_year = request.getParameter("h_year");
        String p_id = request.getParameter("p_id");
        
        if(h_year!=null){
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_nituk","root","9897089099");
            PreparedStatement pst = con.prepareStatement("select * from Health"+h_year+" where p_id=? ");
            pst.setString(1, p_id);
            ResultSet rs = pst.executeQuery();
            String med_data ="012345";
            if(rs.first()){
                do{
                    med_data += rs.getString(1)+"012345";
                    med_data += rs.getString(2)+"012345";
                    String wt = rs.getString(3);
                    if(wt.equals("null")){
                         med_data +="012345";
                    }
                    else{
                        med_data += wt+"012345";
                    }
                    String wst = rs.getString(4);
                    if(wst.equals("null")){
                         med_data +="012345";
                    }
                    else{
                        med_data += wst+"012345";
                    }
                    med_data += rs.getString(5)+"012345";
                    med_data += rs.getString(6)+"012345";
                    med_data += rs.getString(7)+"012345";
                    med_data += rs.getString(8)+"012345";
                    med_data += rs.getString(9)+"012345";
                    med_data += rs.getString(10)+"012345";
                    med_data += rs.getString(11);
                 }while(rs.next());
            }
            out.write(med_data);
        }
        }
        catch (ClassNotFoundException ex) {            
            Logger.getLogger(Personal_MedicalServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Personal_MedicalServlet.class.getName()).log(Level.SEVERE, null, ex);
        }        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
