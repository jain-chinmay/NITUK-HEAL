/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;
import Beans.FamilyBean;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
public class FamilyAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static String SUCCESS;
    private String p_id;
    private String f_name;
    private String m_name;
    private String f_occupation;
    private String m_occupation;
    private String f_address;
    private String f_history;
    private String f_contact;

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
    
    private String getFhistory(String f_history[]){
        String fhistory = "";
        for(int i=0; i<f_history.length;i++){
            fhistory += f_history[i] + "-"; 
        }
        return fhistory;
    }
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession(false);
        p_id = (String)session.getAttribute("p_id");
        PrintWriter out = response.getWriter();
        String admin_id = (String) session.getAttribute("admin_id");
        if(admin_id!=null){
            FamilyBean fb = (FamilyBean)form;
            String select = fb.getDo_update();
            if(select.equals("Edit Basic Details"))
                SUCCESS="edit_bdetails";
            else if(select.equals("Update Prescription"))
                SUCCESS = "up_presc";
            else if(select.equals("Edit Health Profile"))
                SUCCESS = "edit_hprofile";
            else if(select.equals("Edit History"))
                SUCCESS = "edit_history";
            else{
                f_name = fb.getF_name();
                m_name = fb.getM_name();
                f_address = fb.getF_address();
                f_occupation = fb.getF_occupation();
                m_occupation = fb.getM_occupation();
                f_contact = fb.getF_contact();
                f_history = getFhistory(fb.getF_history());
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_nituk","root","9897089099");
                    PreparedStatement pst = con.prepareStatement("update family set father=?,mother=?,f_occupation=?,m_occupation=?,f_address=?,f_contact=?,f_history=? where p_id=?");
                    pst.setString(1, f_name);
                    pst.setString(2,m_name);
                    pst.setString(3,f_occupation);
                    pst.setString(4,m_occupation);
                    pst.setString(5,f_address);
                    pst.setString(6,f_contact);
                    pst.setString(7, f_history);
                    pst.setString(8,p_id);
                    // out.println("awfscfd");
                    int status = pst.executeUpdate();
                    //out.println("awfd");
                    if(status>0){
                        request.setAttribute("presgo","Update Successful.");
                        SUCCESS = "success";
                    }
                    else{
                        SUCCESS = "fail";
                    }
                }
                catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
        else{
            request.setAttribute("msgg","*Not Logged in!!");
            SUCCESS="notlogged";
        }
        return mapping.findForward(SUCCESS);
    }
}
