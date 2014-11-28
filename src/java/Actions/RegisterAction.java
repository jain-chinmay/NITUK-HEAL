package Actions;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
import Beans.RegisterBean;
import java.io.PrintWriter;
import java.util.Calendar;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
public class RegisterAction extends org.apache.struts.action.Action {

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
    
    private int getAge(String dob) throws ParseException{
        int age;
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        Date birthDate = sdf.parse(dob);
        Calendar birthDay = Calendar.getInstance();
        birthDay.setTimeInMillis(birthDate.getTime());
        long currentTime = System.currentTimeMillis();
        Calendar now = Calendar.getInstance();
        now.setTimeInMillis(currentTime);
        age = now.get(Calendar.YEAR) - birthDay.get(Calendar.YEAR);
        if(now.get(Calendar.MONTH) < birthDay.get(Calendar.MONTH)){
            age--;
        }
        else if(now.get(Calendar.MONTH) == birthDay.get(Calendar.MONTH)){
            if(now.get(Calendar.DAY_OF_MONTH) < birthDay.get(Calendar.DAY_OF_MONTH)){
                age--;
            }
        }
        return age;
    }
    
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        HttpSession session = request.getSession(false);
        PrintWriter out = response.getWriter();
        String admin_id = (String) session.getAttribute("admin_id");
        if(admin_id!=null){
            RegisterBean lb=(RegisterBean)form;
            String select = lb.getDo_admin();
            if(select.equals("Search")){
                SUCCESS = "admin";}
            else if(select.equals("Delete")){
                SUCCESS = "delete";}
            else if(select.equals("Edit")){
                SUCCESS = "edit";
            }
            else{
                String p_id = lb.getP_id().toUpperCase();
                String name = lb.getName();
                String dob = lb.getDob();
                String contact = lb.getContact();
                String gender = lb.getGender();
                int age = getAge(dob);
                String type;
                if(p_id.startsWith("BT")){
                     type= "student";

                }else{
                    type = "staff";
                }
                try{
                    boolean id = false;
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_nituk","root","9897089099");
                    PreparedStatement psti = con.prepareStatement("select person.p_id from person where p_id=?");
                    psti.setString(1, p_id);
                    ResultSet rsi = psti.executeQuery();
                    if(rsi.first()){
                        id = true;
                    }
                    if(id==false){
                        PreparedStatement pst = con.prepareStatement("insert into person values(?,?,?,?,?,?,?)");
                        pst.setString(1, p_id);
                        pst.setString(2, name);
                        pst.setString(3, dob);
                        pst.setString(4,gender);
                        pst.setInt(5, age);
                        pst.setString(6, contact);
                        pst.setString(7, type);
                        session.setAttribute("p_id", p_id);
                        session.setAttribute("name",name);
                        PreparedStatement psto = con.prepareStatement("insert into health values(?,'','','','','-','-','-','-','-','-')");
                        psto.setString(1, p_id);
                        PreparedStatement pst1 = con.prepareStatement("insert into family values(?,'-','-','-','-','-','-','None')");
                        pst1.setString(1,p_id);

                        PreparedStatement pst2 = con.prepareStatement("insert into health_1 values(?,'',null,null,'','','','','','','')");
                        pst2.setString(1,p_id);
                        PreparedStatement pst3 = con.prepareStatement("insert into health_2 values(?,'',null,null,'','','','','','','')");
                        pst3.setString(1,p_id);
                        PreparedStatement pst4 = con.prepareStatement("insert into health_3 values(?,'',null,null,'','','','','','','')");
                        pst4.setString(1,p_id);
                        PreparedStatement pst5 = con.prepareStatement("insert into health_4 values(?,'',null,null,'','','','','','','')");
                        pst5.setString(1,p_id);
                        PreparedStatement pst6 = con.prepareStatement("insert into health_5 values(?,'',null,null,'','','','','','','')");
                        pst6.setString(1,p_id);
                        PreparedStatement pst7;
                        if(type.equals("student")){
                            pst7 = con.prepareStatement("insert into student values(?,'',0,0,0)");
                            pst7.setString(1,p_id);


                        }else{
                            pst7 = con.prepareStatement("insert into staff values(?,'',0,'','')");
                            pst7.setString(1,p_id);

                        }

                        Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/prescription","root","9897089099");
                        String sql = "CREATE TABLE IF NOT EXISTS "+p_id+"p(name VARCHAR(30),age INTEGER,date VARCHAR(15),pres VARCHAR(80),adv VARCHAR(150))";
                        Statement stmt = con1.createStatement();
                        stmt.executeUpdate(sql);
                        int status = pst.executeUpdate();

                        if(status>0){
                            int status1 = pst1.executeUpdate();
                            int statuso = psto.executeUpdate();
                            int status2 = pst2.executeUpdate();
                            int status3 = pst3.executeUpdate();
                            int status4 = pst4.executeUpdate();
                            int status5 = pst5.executeUpdate();
                            int status6 = pst6.executeUpdate();
                            int status7 = pst7.executeUpdate();
                            if(statuso>0 && status1>0 && status2>0 && status3>0 && status4>0 && status4>0 && status5>0 && status6>0 && status7>0 ){
                                SUCCESS = "success";
                            }else{
                                request.setAttribute("regerr","Registration Failed");
                                SUCCESS = "fail";
                            }
                        }
                        else{
                            request.setAttribute("regerr","Registration Failed");
                            SUCCESS = "fail";
                        }
                    }
                    else{
                        request.setAttribute("regerr",p_id+" already exists!!");
                        SUCCESS="fail";
                    }
                    
                }
                 catch(Exception e){
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
