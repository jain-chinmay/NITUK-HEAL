package Beans;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author Cj
 */
public class RegisterBean extends org.apache.struts.action.ActionForm {
    
    private String p_id;
    private String name;
    private String dob;
    private String contact;
    private String gender;
    private String do_admin;
    /**
     * @return
     */
   
    public RegisterBean() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */

    /**
     * @return the p_id
     */
    public String getP_id() {
        return p_id;
    }

    /**
     * @param p_id the p_id to set
     */
    public void setP_id(String p_id) {
        this.p_id = p_id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the dob
     */
    public String getDob() {
        return dob;
    }

    /**
     * @param dob the dob to set
     */
    public void setDob(String dob) {
        this.dob = dob;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the contact
     */
    public String getContact() {
        return contact;
    }

    /**
     * @param contact the contact to set
     */
    public void setContact(String contact) {
        this.contact = contact;
    }

    /**
     * @return the do_admin
     */
    public String getDo_admin() {
        return do_admin;
    }

    /**
     * @param do_admin the do_admin to set
     */
    public void setDo_admin(String do_admin) {
        this.do_admin = do_admin;
    }

   
}
