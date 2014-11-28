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
public class PersonAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static String SUCCESS = "success";
    private String p_id ;
    private String type;
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
        p_id = (String) session.getAttribute("p_id");
        String admin_id = (String) session.getAttribute("admin_id");
        if(admin_id!=null){
            String name="";
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_nituk","root","9897089099");
                PreparedStatement pst = con.prepareStatement("select * from person where p_id=? ");
                pst.setString(1,p_id);
                ResultSet rs = pst.executeQuery();
                //out.println(rs.first());
                if(rs.first()){
                    PreparedStatement psty = con.prepareStatement("select person.name from person where p_id=?");
                    psty.setString(1, p_id);
                    ResultSet rsy = psty.executeQuery();
                    if(rsy.first())
                        name = rsy.getString(1);
                    session.setAttribute("name", name);
                    if(p_id.startsWith("BT")){
                        type = "student";
                    }else{
                        type = "staff";
                    }
                    PreparedStatement pst1 = con.prepareStatement("select * from "+type+" where p_id=? ");
                    pst1.setString(1,p_id);
                    ResultSet rs1 = pst1.executeQuery();
                    List Person = new ArrayList();
                    if(rs.first()){
                            Person.add(rs.getString(1));
                            Person.add(rs.getString(2));
                            Person.add(rs.getString(3)); 
                            Person.add(rs.getString(4));
                            Person.add(rs.getString(5));
                            Person.add(rs.getString(6));
                            Person.add(rs.getString(7));
                        }
                    if(rs1.first()){
                            Person.add(rs1.getString(2));
                            Person.add(rs1.getString(3));
                            Person.add(rs1.getString(4));
                            Person.add(rs1.getString(5));
                        }
                    
                    session.setAttribute("Person",Person);
                    if(type.equals("student")){
                        SUCCESS = "basic_student";
                    }
                    else if(type.equals("staff")){
                        SUCCESS = "basic_staff";
                    }
                }
                else{
                    request.setAttribute("adminmsg","Invalid ID.");
                    SUCCESS = "fail";
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        else{
            request.setAttribute("msgg","*Not Logged in!!");
            SUCCESS="notlogged";
        }
        
        return mapping.findForward(SUCCESS);
    }
}
