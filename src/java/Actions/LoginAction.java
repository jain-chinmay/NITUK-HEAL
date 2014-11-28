/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Beans.LoginBean;
import Controller.PasswordGenerator;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
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
public class LoginAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static String SUCCESS = "success";
    private String admin_id;
    private String pass;
    private String fpass;

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
        HttpSession session = request.getSession();
        LoginBean lb = (LoginBean)form;
        admin_id = lb.getAdmin_id();
        pass = lb.getPass();
        fpass = lb.getFpass();
        boolean status=false;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_nituk","root","9897089099");
            try{
                if(fpass.equals("yes")){
                String s_ques="",s_ans="";
                PreparedStatement psti = con.prepareStatement("select admin.sec_ques,admin.sec_ans from admin where admin.admin_id=?");
                psti.setString(1, admin_id);
                ResultSet rsi=psti.executeQuery();
                if(rsi.first()){
                    s_ques = rsi.getString(1);
                    s_ans = rsi.getString(2);
                }
                request.setAttribute("ques", s_ques);
                request.setAttribute("ans", s_ans);
                request.setAttribute("admin_id",admin_id);
                SUCCESS = "forget";
                }
                else{
                    throw new Exception();
                }
            }catch(Exception e1){   
                PreparedStatement pst=con.prepareStatement("select * from admin where admin.admin_id=? and password=?");
                pst.setString(1, admin_id);
                pst.setString(2, PasswordGenerator.generate(pass));
                ResultSet rs=pst.executeQuery();
                status=rs.next();

                if(status){
                    session.setAttribute("admin_id",admin_id);
                    session.setAttribute("admin_name",rs.getString("name").toUpperCase());
                    SUCCESS="success"; 
               }
                else{
                    request.setAttribute("msgg", "Invalid Login");
                    SUCCESS="fail";
                }
            }
        }
        catch(Exception e){
	e.printStackTrace();
	}
        
        return mapping.findForward(SUCCESS);
    }
}
