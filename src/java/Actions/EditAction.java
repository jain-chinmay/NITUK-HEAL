/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Beans.EditBean;
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
public class EditAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static  String SUCCESS;
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
        String name="";
        String admin_id = (String)session.getAttribute("admin_id");
        if(admin_id!=null){
            EditBean eb =(EditBean)form;
            p_id = eb.getP_id().toUpperCase();
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_nituk","root","9897089099");
            PreparedStatement pst = con.prepareStatement("select person.name from person where p_id=?");
            pst.setString(1, p_id);
            ResultSet rs = pst.executeQuery();
            if(rs.first())
                name = rs.getString(1);
            }catch(Exception e){
                e.printStackTrace();
            }   
            session.setAttribute("p_id",p_id);
            session.setAttribute("name",name);
            String select = eb.getDo_admin();
            if(select.equals("Add")){
                SUCCESS = "add";}
            else if(select.equals("Delete")){
                SUCCESS = "delete";}
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
                    if(id)
                        SUCCESS = "success";
                    else{
                        request.setAttribute("editerr",p_id+" doesn't exist.");
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
