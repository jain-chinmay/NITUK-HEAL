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
public class HistoryBean extends org.apache.struts.action.ActionForm {
    
    private String h_prob;
    private String h_ill;
    private String h_med;
    private String h_allerg;
    private String h_phy;  
    private String personal[];
    private String counseling[];
    private String do_update;
    /**
     * @return the h_prob
     */
    public String getH_prob() {
        return h_prob;
    }

    /**
     * @param h_prob the h_prob to set
     */
    public void setH_prob(String h_prob) {
        this.h_prob = h_prob;
    }

    /**
     * @return the h_ill
     */
    public String getH_ill() {
        return h_ill;
    }

    /**
     * @param h_ill the h_ill to set
     */
    public void setH_ill(String h_ill) {
        this.h_ill = h_ill;
    }

    /**
     * @return the h_med
     */
    public String getH_med() {
        return h_med;
    }

    /**
     * @param h_med the h_med to set
     */
    public void setH_med(String h_med) {
        this.h_med = h_med;
    }

    /**
     * @return the h_allerg
     */
    public String getH_allerg() {
        return h_allerg;
    }

    /**
     * @param h_allerg the h_allerg to set
     */
    public void setH_allerg(String h_allerg) {
        this.h_allerg = h_allerg;
    }

    /**
     * @return the h_phy
     */
    public String getH_phy() {
        return h_phy;
    }

    /**
     * @param h_phy the h_phy to set
     */
    public void setH_phy(String h_phy) {
        this.h_phy = h_phy;
    }

    /**
     * @return the personal
     */
    public String[] getPersonal() {
        return personal;
    }

    /**
     * @param personal the personal to set
     */
    public void setPersonal(String[] personal) {
        this.personal = personal;
    }

    /**
     * @return the counseling
     */
    public String[] getCounseling() {
        return counseling;
    }

    /**
     * @param counseling the counseling to set
     */
    public void setCounseling(String[] counseling) {
        this.counseling = counseling;
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
    

    
}
