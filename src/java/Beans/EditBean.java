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
 * @author Cj
 */
public class EditBean extends org.apache.struts.action.ActionForm {
    
    private String p_id;
    private String do_admin;
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
