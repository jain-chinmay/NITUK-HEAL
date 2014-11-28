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
public class Medical_HistoryAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static String SUCCESS;
    private String p_id;
    private String f_history;
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
        PrintWriter out = response.getWriter();
        String admin_id = (String) session.getAttribute("admin_id");
        if(admin_id!=null){
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_nituk","root","9897089099");
                PreparedStatement pst = con.prepareStatement("select * from health where p_id=? ");
                pst.setString(1,p_id);
                ResultSet rs = pst.executeQuery();
                PreparedStatement pst1 = con.prepareStatement("select family.f_history from family where p_id=? ");
                pst1.setString(1, p_id);
                ResultSet rs1 = pst1.executeQuery();
                if(rs1.first())
                    f_history = rs1.getString(1);
                List Health = new ArrayList();
                if(rs.first()){
                    Health.add(rs.getString(1));
                    Health.add(rs.getString(2));
                    Health.add(rs.getString(3)); 
                    Health.add(rs.getString(4));
                    Health.add(rs.getString(5));
                    Health.add(rs.getString(6));
                    Health.add(rs.getString(7));
                    Health.add(rs.getString(8));
                    Health.add(rs.getString(9));
                    Health.add(rs.getString(10));
                    Health.add(rs.getString(11));
                    session.setAttribute("Health", Health);
                    session.setAttribute("f_history",f_history);
                    SUCCESS = "success";
                }
                else{
                    request.setAttribute("adminmsg","No Data Found!!!!!");
                     SUCCESS = "fail";
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
