/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author Abhinav Kumar
 */
public class LoginBean extends org.apache.struts.action.ActionForm {
    
    private String admin_id;
    private String pass;
    private String fpass;
    
    /**
     * @return the pass
     */
    public String getPass() {
        return pass;
    }

    /**
     * @param pass the pass to set
     */
    public void setPass(String pass) {
        this.pass = pass;
    }

    /**
     * @return the admin_id
     */
    public String getAdmin_id() {
        return admin_id;
    }

    /**
     * @param admin_id the admin_id to set
     */
    public void setAdmin_id(String admin_id) {
        this.admin_id = admin_id;
    }

    /**
     * @return the fpass
     */
    public String getFpass() {
        return fpass;
    }

    /**
     * @param fpass the fpass to set
     */
    public void setFpass(String fpass) {
        this.fpass = fpass;
    }
}
