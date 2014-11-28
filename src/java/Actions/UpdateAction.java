/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Beans.UpdateBean;
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
public class UpdateAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static String SUCCESS ;

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
            UpdateBean ub = (UpdateBean)form;
            String select = ub.getDo_update();
            if(select.equals("Edit Basic Details"))
                SUCCESS="edit_bdetails";
            else if(select.equals("Edit Family Background"))
                SUCCESS = "edit_fbackground";
            else if(select.equals("Edit Health Profile"))
                SUCCESS = "edit_hprofile";
            else if(select.equals("Edit History"))
                SUCCESS = "edit_history";
            else{
                String date=ub.getDate();
                String pres = ub.getPres();
                String adv = ub.getAdv();
                String name="";
                String p_id="";
                String age="";
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_nituk","root","9897089099");
                    p_id = (String)session.getAttribute("p_id");
                    PreparedStatement pst = con.prepareStatement("select person.name,person.age from person where p_id=? ");
                    pst.setString(1,p_id);
                    ResultSet rs = pst.executeQuery();
                    if(rs.first()){
                        name = rs.getString(1);
                        age = rs.getString(2);
                    }
                    Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/prescription","root","9897089099");
                    PreparedStatement pst1 = con1.prepareStatement("insert into "+p_id+"p values(?,?,?,?,?)");
                    pst1.setString(1, name);
                    pst1.setString(2, age);
                    pst1.setString(3, date);
                    pst1.setString(4, pres);
                    pst1.setString(5, adv);
                    int status =pst1.executeUpdate();
                    if(status>0){
                        request.setAttribute("presgo","Update Successful.");
                        SUCCESS="success";
                    }
                    else{
                        request.setAttribute("presgo","Please Contact Developers.");
                        SUCCESS="fail";
                    }
                }catch(Exception e){
                    request.setAttribute("presgo","Please Contact Developers.");
                     SUCCESS="fail";
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
