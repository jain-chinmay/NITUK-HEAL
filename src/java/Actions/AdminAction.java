/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Beans.AdminBean;
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
 * @author Cj
 */
public class AdminAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static String SUCCESS;
    private String query;
    private String primary_query;
    private String secondary_query;
    private String drop;
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
        String admin_id=(String)session.getAttribute("admin_id");
        if(admin_id!=null){
            AdminBean ab = (AdminBean)form;
            String select = ab.getDo_admin();
            if(select.equals("Add")){
                SUCCESS = "add";}
            else if(select.equals("Delete")){
                SUCCESS = "delete";}
            else if(select.equals("Edit")){
                SUCCESS = "edit";
            }
            else{
                if(select.equals("Search")){
                    drop = ab.getDrop();
                    query = ab.getQuery();
                    primary_query = ab.getPrimary_query();
                    secondary_query = ab.getSecondary_query();
                    try{
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = null; 
                        if(query!=""){
                            request.setAttribute("query",query);
                            request.setAttribute("primary_query", primary_query);
                            request.setAttribute("secondary_query", secondary_query);
                            //out.println(secondary_query);
                            if(secondary_query.equals("name")){
                                con =DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_nituk","root","9897089099");
                                PreparedStatement pst = con.prepareStatement("select * from "+primary_query+" where "+secondary_query+" LIKE '%"+query+"%'");
                                //pst.setString(1,query);
                                ResultSet rs = pst.executeQuery();
                                String Person ="";
                                if(rs.first()){
                                    do{
                                        Person += rs.getString(1)+":!!: ";
                                        Person += rs.getString(2)+":!!: ";
                                        Person += rs.getString(3)+":!!: ";
                                        Person += rs.getString(4)+":##:";
                                    }while(rs.next());
                                    request.setAttribute("Person_list",Person);
                                    SUCCESS = "list_person";
                                }
                                else{
                                    request.setAttribute("adminmsg","No Results Found.");
                                    SUCCESS = "fail";
                                 }
                            }
                            else if(secondary_query.equals("p_id")){
                                query  = query.toUpperCase();
                                session.setAttribute("p_id",query);
                                SUCCESS = "person";
                            }
                        }
                        else{
                            if(secondary_query.equals("Blood_group")){
                                if(drop.contains("plus")){
                                    drop = drop.replaceAll("plus", "+");
                                }  
                                else{
                                    drop = drop.replaceAll("minus", "-");
                                }
                             }      

                            else if(secondary_query.equals("Present_n_Past")){
                                drop = "yes"+drop;
                            }
                            else if(secondary_query.equals("Vaccination")){
                                secondary_query = drop;
                                drop = "-";
                            }
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_nituk","root","9897089099");
                            String sql ="select Person.p_id,Person.Name,Person.Age,Person.Type,Health."+secondary_query+" from Person,Health where Person.p_id=Health.p_id and "+secondary_query+" LIKE '%"+drop+"%' order by Person.p_id asc";
                            PreparedStatement pst = con.prepareStatement(sql);
                            ResultSet rs; 
                            rs =  pst.executeQuery();
                            String medical_c = "";
                            if(rs.first()){
                                do{
                                    medical_c +=rs.getString(1)+":!!: ";
                                    medical_c +=rs.getString(2)+":!!: ";
                                    medical_c +=rs.getString(3)+":!!: ";
                                    medical_c +=rs.getString(4)+":!!: ";
                                    medical_c +=rs.getString(5)+":##:";
                                }while(rs.next());
                                request.setAttribute("Medical_c",medical_c);
                                request.setAttribute("secondary_query", secondary_query);
                                SUCCESS = "result_medical";
                           } 
                       else{
                            request.setAttribute("adminmsg","No Results Found.");
                            SUCCESS = "fail";
                       } 
                   } 
                    con.close();
                }catch(Exception e){
                    e.printStackTrace();
                }  
            }

        }}else{
            request.setAttribute("msgg","Not Logged in!");
            SUCCESS="notlogged";
        }
        
        return mapping.findForward(SUCCESS);
    }
}

