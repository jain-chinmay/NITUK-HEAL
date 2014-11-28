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
public class FamilyBean extends org.apache.struts.action.ActionForm {
    
    private String[] f_history;
    private String f_name;
    private String m_name;
    private String f_occupation;
    private String m_occupation;
    private String f_address;
    private String f_contact;
    private String do_update;

    /**
     *
     */
    public FamilyBean() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @return the father
     */
   
    /**
     * @return the f_occupation
     */
    public String getF_occupation() {
        return f_occupation;
    }

    /**
     * @param f_occupation the f_occupation to set
     */
    public void setF_occupation(String f_occupation) {
        this.f_occupation = f_occupation;
    }

    /**
     * @return the m_occupation
     */
    public String getM_occupation() {
        return m_occupation;
    }

    /**
     * @param m_occupation the m_occupation to set
     */
    public void setM_occupation(String m_occupation) {
        this.m_occupation = m_occupation;
    }

    /**
     * @return the f_address
     */
    public String getF_address() {
        return f_address;
    }

    /**
     * @param f_address the f_address to set
     */
    public void setF_address(String f_address) {
        this.f_address = f_address;
    }

    
    /**
     * @return the f_history
     */
    public String[] getF_history() {
        return f_history;
    }

    /**
     * @param f_history the f_history to set
     */
    public void setF_history(String[] f_history) {
        this.f_history = f_history;
    }

    /**
     * @return the f_name
     */
    public String getF_name() {
        return f_name;
    }

    /**
     * @param f_name the f_name to set
     */
    public void setF_name(String f_name) {
        this.f_name = f_name;
    }

    /**
     * @return the m_name
     */
    public String getM_name() {
        return m_name;
    }

    /**
     * @param m_name the m_name to set
     */
    public void setM_name(String m_name) {
        this.m_name = m_name;
    }

    /**
     * @return the f_contact
     */
    public String getF_contact() {
        return f_contact;
    }

    /**
     * @param f_contact the f_contact to set
     */
    public void setF_contact(String f_contact) {
        this.f_contact = f_contact;
    }

    /**
     * @return the do_update
     */
    public String getDo_update() {
        return do_update;
    }

    /**
     * @param do_update the do_update to set
     */
    public void setDo_update(String do_update) {
        this.do_update = do_update;
    }


    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
}
