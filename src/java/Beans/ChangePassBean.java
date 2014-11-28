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
public class ChangePassBean extends org.apache.struts.action.ActionForm {
    
    private String oldpass;
    private String newpass;
    private String newpass1;
    
    /**
     * @return the oldpass
     */
    public String getOldpass() {
        return oldpass;
    }

    /**
     * @param oldpass the oldpass to set
     */
    public void setOldpass(String oldpass) {
        this.oldpass = oldpass;
    }

    /**
     * @return the newpass
     */
    public String getNewpass() {
        return newpass;
    }

    /**
     * @param newpass the newpass to set
     */
    public void setNewpass(String newpass) {
        this.newpass = newpass;
    }

    /**
     * @return the newpass1
     */
    public String getNewpass1() {
        return newpass1;
    }

    /**
     * @param newpass1 the newpass1 to set
     */
    public void setNewpass1(String newpass1) {
        this.newpass1 = newpass1;
    }
}
