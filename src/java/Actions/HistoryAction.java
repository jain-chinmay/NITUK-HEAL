/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Beans.HealthBean;
import Beans.HistoryBean;
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
public class HistoryAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static String SUCCESS;
    private static String p_id ;
    private String present_and_past;
    private String personal;
    private String counseling;


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
    
    private String getPersonal(String personall[]){
        String personal = "";
        try{
        if(personall.length>0){
        for(int i=0; i<personall.length;i++){
            personal += personall[i] + "-"; 
        }
        }}catch(Exception e){
            personal ="None";
        }
        return personal;
    }
    
    private String getCounseling(String counsellingg[]){
        String counseling = "";
        try{
        if(counsellingg.length>0){
        for(int i=0; i<counsellingg.length;i++){
            counseling += counsellingg[i] + "-"; 
        }
        }
        }catch(Exception e){
            counseling ="None";
        }
        return counseling;
    }
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession(false);
        p_id = (String)session.getAttribute("p_id");
        String admin_id = (String)session.getAttribute("admin_id");
        if(admin_id!=null){
            HistoryBean hb = (HistoryBean)form;
            String select = hb.getDo_update();
            if(select.equals("Update Prescription"))
                SUCCESS="up_presc";
            else if(select.equals("Edit Family Background"))
                SUCCESS = "edit_fbackground";
            else if(select.equals("Edit Health Profile"))
                SUCCESS = "edit_hprofile";
            else if(select.equals("Edit Basic Details"))
                SUCCESS = "edit_bdetails";
            else{
                present_and_past = "";
                present_and_past += hb.getH_prob() + "-";
                present_and_past += hb.getH_ill() + "-";
                present_and_past += hb.getH_med() + "-";
                present_and_past += hb.getH_allerg() + "-";
                present_and_past += hb.getH_phy() + "-";
                personal = getPersonal(hb.getPersonal());
                counseling = getCounseling(hb.getCounseling()); 
            
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_nituk","root","9897089099");
                    PreparedStatement pst = con.prepareStatement("update health set present_n_past=?,personal=?,counselling=? where p_id=?");
                    pst.setString(4,p_id);
                    pst.setString(3, counseling);
                    pst.setString(2,personal);
                    pst.setString(1,present_and_past);
                    int status = pst.executeUpdate();
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
