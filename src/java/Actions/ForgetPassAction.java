/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Beans.ForgetBean;
import Controller.PasswordGenerator;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author Abhinav Kumar
 */
public class ForgetPassAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static  String SUCCESS = "success";
    private String admin_id;
    private String password;

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
        ForgetBean fb = (ForgetBean)form;
        admin_id = fb.getAdminid();
        password = fb.getPassword();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_nituk","root","9897089099");
            PreparedStatement pst=con.prepareStatement("update admin set admin.password=? where admin.admin_id=?");
            pst.setString(1, PasswordGenerator.generate(password));
            pst.setString(2, admin_id);
            int status=pst.executeUpdate();
            if(status>0){
                request.setAttribute("msgg1", "Password Changed Successfully.");
                SUCCESS = "success";
            }
            else{
                request.setAttribute("msgg", "Password Not Changed.");
                SUCCESS = "fail";
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return mapping.findForward(SUCCESS);
    }
}
