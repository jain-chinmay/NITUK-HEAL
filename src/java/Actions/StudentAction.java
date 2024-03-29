/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Beans.StudentBean;
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
public class StudentAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static String SUCCESS;
    private String p_id;
    private String dept;
    private int hostel;
    private int room;
    private int year;

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
        p_id = (String)session.getAttribute("p_id");
        String admin_id = (String)session.getAttribute("admin_id");
        if(admin_id!=null){
            StudentBean sb = (StudentBean)form;
            String select = sb.getDo_update();
            if(select.equals("Update Prescription"))
                SUCCESS="up_presc";
            else if(select.equals("Edit Family Background"))
                SUCCESS = "edit_fbackground";
            else if(select.equals("Edit Health Profile"))
                SUCCESS = "edit_hprofile";
            else if(select.equals("Edit History"))
                SUCCESS = "edit_history";
            else{
                dept = sb.getDept();
                hostel = sb.getHostel();
                room = sb.getRoom();
                year = sb.getYear();
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_nituk","root","9897089099");
                    PreparedStatement pst = con.prepareStatement("update student set department=?,year=?,hostel_no=?,room_no=? where p_id=?");
                    pst.setString(1, dept);
                    pst.setInt(2,year);
                    pst.setInt(3,hostel);
                    pst.setInt(4,room);
                    pst.setString(5,p_id);
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
