/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Actions;

import Beans.HealthBean;
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
public class HealthAction extends org.apache.struts.action.Action {

    /* forward name="success" path="" */
    private static String SUCCESS ;
    private static String p_id ;
    private String bg;
    private String h_year;
    private String foot;
    private String inch;
    private int weight;
    private int waist;
    private int bphigh;
    private int bplow;
    private String v_right;
    private String v_left;
    private String dental;
    private String chest;
    private String abdomen;
    private String other;
    private String advice;
    private String hepb1;
    private String hepb2;
    private String hepb3;
    private String mmr1;
    private String mmr2;
    private String tn1;
    private String tn2;
    private String tn3;
    private String hepa1;
    private String hepa2;
    private String ch1;
    private String ch2;
    private String HepB;
    private String HepA;
    private String MMR;
    private String Tetanus;
    private String ChPox;
    private String typh;
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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        p_id = (String)session.getAttribute("p_id");
        String admin_id = (String) session.getAttribute("admin_id");
        if(admin_id!=null){
            HealthBean hb = (HealthBean)form;
            String select = hb.getDo_update();
            if(select.equals("Edit Basic Details"))
                SUCCESS="edit_bdetails";
            else if(select.equals("Edit Family Background"))
                SUCCESS = "edit_fbackground";
            else if(select.equals("Update Prescription"))
                SUCCESS = "up_presc";
            else if(select.equals("Edit History"))
                SUCCESS = "edit_history";
            else{
                 h_year = hb.getH_year();
                foot = hb.getFoot();
                inch = hb.getInch();
                weight = hb.getWeight();
                waist = hb.getWaist();
                bphigh = hb.getBphigh();
                bplow = hb.getBplow();
                v_right = hb.getV_right();
                v_left = hb.getV_left();
                dental = hb.getDental();
                chest = hb.getChest();
                abdomen = hb.getAbdomen();
                other = hb.getOther();
                advice = hb.getAdvice();
                bg = hb.getBg();
                hepa1 = hb.getHepa1();
                hepa2 = hb.getHepa2();
                HepA = hepa1+']'+hepa2;
                hepb1 = hb.getHepb1();
                hepb2 = hb.getHepb2();
                hepb3 = hb.getHepb3();
                HepB = hepb1+']'+hepb2+']'+hepb3;
                mmr1 = hb.getMmr1();
                mmr2 = hb.getMmr2();
                MMR = mmr1+']'+mmr2;
                tn1 = hb.getTn1();
                tn2 = hb.getTn2();
                tn3 = hb.getTn3();
                Tetanus = tn1+']'+tn2+']'+tn3;
                ch1 = hb.getCh1();
                ch2 = hb.getCh2();
                ChPox = ch1+']'+ch2;
                typh = hb.getTyph()+']';
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/medical_nituk","root","9897089099");
                    PreparedStatement pst = con.prepareStatement("update health"+h_year+" set height=?,weight=?,waist=?,blood_pressure=?,vision=?,dental=?,chest=?,abdomen=?,other=?,advice=? where p_id=?");
                    pst.setString(1, foot+"-"+inch);
                    pst.setInt(2,weight);
                    pst.setInt(3,waist);
                    pst.setString(4,bphigh+" - "+bplow);
                    pst.setString(5,v_right+" - "+v_left);
                    pst.setString(6,dental);
                    pst.setString(7,chest);
                    pst.setString(8,abdomen);
                    pst.setString(9,other);
                    pst.setString(10,advice);
                    pst.setString(11,p_id);
                    int status = pst.executeUpdate();

                    PreparedStatement pst1 = con.prepareStatement("update health set hepatitisb=?,mmr=?,tetanus=?,typhoid=?,hepatitisa=?,chickenpox=?,blood_group=? where p_id=?");

                    pst1.setString(1, HepB);
                    pst1.setString(2, MMR);
                    pst1.setString(3, Tetanus);
                    pst1.setString(4, typh);
                    pst1.setString(5, HepA);
                    pst1.setString(6, ChPox);
                    pst1.setString(8, p_id);
                    pst1.setString(7, bg);
                    if(status>0){
                       int status1 = pst1.executeUpdate();
                       if(status1>0){
                           request.setAttribute("presgo","Update Successful.");
                           SUCCESS = "success"; 
                       }else{
                            SUCCESS = "fail";
                        }
                    }
                    else{
                        SUCCESS = "fail";
                    }

                } catch(Exception e){
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
