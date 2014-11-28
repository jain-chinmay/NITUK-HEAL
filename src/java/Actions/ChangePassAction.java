/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Beans.ChangePassBean;
import Controller.PasswordGenerator;
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
 * @author Abhinav Kumar
 */
public class ChangePassAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static String SUCCESS;
    private String admin_id;
    private String oldpass;
    private String newpass;
    private String newpass1;

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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        String admin_id=(String)session.getAttribute("admin_id");
        if(admin_id!=null){
            ChangePassBean cb = (ChangePassBean)form;
            oldpass = cb.getOldpass();
            newpass = cb.getNewpass();
            newpass1 = cb.getNewpass1();
            String oldp = "";
            if(newpass.equals(newpass1)){
                try{
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_nituk","root","9897089099");
                        PreparedStatement pstt =con.prepareStatement("select admin.password from admin where admin_id=? ");
                        pstt.setString(1, admin_id);
                        ResultSet rst = pstt.executeQuery();
                        if(rst.first())
                            oldp = rst.getString(1);
                        if(oldp.equals(PasswordGenerator.generate(oldpass))){
                            PreparedStatement pst = con.prepareStatement("update admin set password=? where admin_id=? ");
                            pst.setString(1, PasswordGenerator.generate(newpass));
                            pst.setString(2, admin_id);
                            int status=pst.executeUpdate();
                            if(status>0){
                                request.setAttribute("adminmsg1","Password Changed Successfully!");
                                SUCCESS="success"; 
                           }
                        }else{
                            request.setAttribute("ermsg","You have entered wrong password.");
                            SUCCESS="fail";
                        }
                 }
                catch(Exception e){
                e.printStackTrace();
                }
            }
            else{
                request.setAttribute("ermsg","Password didn't match!!!!!");
                SUCCESS="fail";
            }
        }else{
            request.setAttribute("msgg","*Not Logged in!!");
            SUCCESS="notlogged";
        
        }
      
        return mapping.findForward(SUCCESS);
    }
}
