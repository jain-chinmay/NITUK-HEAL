/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
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
public class PrescriptAction extends org.apache.struts.action.Action {

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
        PrintWriter out = response.getWriter();
        p_id  = (String) session.getAttribute("p_id");
        String admin_id  = (String) session.getAttribute("admin_id");
        if(admin_id!=null){
            String presc_table = p_id+"p";
            String name;
            try
           {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_nituk","root","9897089099");
                PreparedStatement pst = con.prepareStatement("select person.name from person where p_id=?");
                pst.setString(1, p_id);
                ResultSet rs = pst.executeQuery();
                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/prescription","root","9897089099");
                PreparedStatement pst1 = con1.prepareStatement("select "+presc_table+".age,"+presc_table+".date,"+presc_table+".pres,"+presc_table+".adv from "+presc_table+"");
                ResultSet rs1 = pst1.executeQuery();
                List Prescript = new ArrayList();
                String pres_data="";
                int i=0;
                if(rs.first()){
                    name = rs.getString(1);
                    if(rs1.first()){
                        do{
                            pres_data+=rs1.getString(1)+":!!: ";
                            pres_data+=rs1.getString(2)+":!!: ";
                            pres_data+=rs1.getString(3)+":!!: ";
                            pres_data+=rs1.getString(4)+":##: ";
                        }while(rs1.next());
                        session.setAttribute("name",name);
                        session.setAttribute("Pres_data",pres_data);
                        SUCCESS = "success";
                    }
                    else{
                        request.setAttribute("presmsg","No Prescription for "+name.toUpperCase()+"");
                        SUCCESS = "fail";
                    }
                }
                
           }catch(Exception e){
               e.printStackTrace();
           }
        }else{
            request.setAttribute("msgg","*Not Logged in!!");
            SUCCESS="notlogged";
        }
        
        return mapping.findForward(SUCCESS);
    }
}
