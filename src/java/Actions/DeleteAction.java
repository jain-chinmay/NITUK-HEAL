/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Beans.DeleteBean;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Cj
 */
public class DeleteAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static String SUCCESS;
    private String p_id;
    
    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
       HttpSession session = request.getSession(false);
       String admin_id = (String)session.getAttribute("admin_id");
       if(admin_id!=null){
            DeleteBean db = (DeleteBean)form;
            p_id = db.getP_id().toUpperCase();
            String select = db.getDo_admin();
            if(select.equals("Add")){
                SUCCESS = "add";}
            else if(select.equals("Edit")){
                SUCCESS = "edit";}
            else if(select.equals("Search")){
                SUCCESS = "search";
            }
            else{
               Boolean id = false;
               try
               {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_nituk","root","9897089099");
                    PreparedStatement pst = con.prepareStatement("select person.p_id from person where p_id=?");
                    pst.setString(1, p_id);
                    ResultSet rs = pst.executeQuery();
                    if(rs.first()){
                        id = true;
                    }
                    if(id){
                        PreparedStatement psty = con.prepareStatement("delete from person where p_id=?");
                        psty.setString(1, p_id);
                        int status = psty.executeUpdate();
                        Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/prescription","root","9897089099");
                        PreparedStatement pst1 = con1.prepareStatement("drop table "+p_id+"p");
                        int status1 = pst1.executeUpdate();
                        if(status>0 && status1==0){
                            request.setAttribute("delsuc",p_id+" deleted successfully.");
                            SUCCESS = "success";
                        }
                        else{
                            request.setAttribute("delerr","Deletion Unsuccessful.");
                            SUCCESS = "fail";
                        }
                    }
                    else{
                        request.setAttribute("delerr",p_id+" doesn't exist. Please try again.");
                        SUCCESS = "fail";
                    }
               }catch(Exception e){
                   e.printStackTrace();
               }
            }
       }else{
           request.setAttribute("msgg","*Not Logged in!!");
           SUCCESS="notlogged";
       }
       
       return mapping.findForward(SUCCESS);
    }
}
