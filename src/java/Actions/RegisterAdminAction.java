/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Beans.RegisterAdminBean;
import Controller.PasswordGenerator;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;
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
public class RegisterAdminAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static String SUCCESS;
    private String fname;
    private String lname;
    private String sec_ques;
    private String sec_ans;
    private String mas_pass;
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
        HttpSession session = request.getSession();
        RegisterAdminBean rb = (RegisterAdminBean)form;
        fname = rb.getFname();
        lname = rb.getLname();
        sec_ques = rb.getSec_ques();
        sec_ans = rb.getSec_ans();
        mas_pass = rb.getMas_pass();
        String master_password="";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_nituk","root","9897089099");
            PreparedStatement pst=con.prepareStatement("select admin.password from admin where admin.admin_id=? ");
            pst.setString(1, PasswordGenerator.generate("mickeyvirus"));
            ResultSet rs=pst.executeQuery();
            if(rs.first())
                master_password = rs.getString(1);
            
            if(master_password.equals(PasswordGenerator.generate(mas_pass))){
                String admin_id="";
                String password="";
                int n;
                Random random = new Random();
                for(int i=0;i<4;i++){
                    n = random.nextInt(10);
                    admin_id +=n; 
                }
                for(int i=0;i<5;i++){
                    n = random.nextInt(10);
                    password +=n; 
                }
                password = "nituk"+password+"med";
                admin_id = "#"+fname.toLowerCase()+admin_id;
                PreparedStatement pst1=con.prepareStatement("insert into admin values(?,?,?,?,?)");
                pst1.setString(1, admin_id);
                pst1.setString(2, fname+" "+lname);
                pst1.setString(3, PasswordGenerator.generate(password));
                pst1.setString(4, sec_ques);
                pst1.setString(5, sec_ans);
                int status = pst1.executeUpdate();
                if(status>0){
                    session.setAttribute("admin_name", fname+" "+lname);
                    session.setAttribute("admin_id", admin_id);
                    request.setAttribute("password",password);
                    SUCCESS="success"; 
                }else{
                    request.setAttribute("regmsg","Registration Failed!!!");
                    SUCCESS="fail"; 
                }
            }else{
                request.setAttribute("regmsg","Master Password is WRONG!!!!!!!");
                SUCCESS="fail"; 
            }
            
        }
        
        catch(Exception e){
	e.printStackTrace();
	}
        
        
        return mapping.findForward(SUCCESS);
    }
}
