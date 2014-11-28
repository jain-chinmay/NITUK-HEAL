/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

/**
 *
 * @author Cj
 */
public class UpdateBean extends org.apache.struts.action.ActionForm {
    
    private String do_update;
    private String date;
    private String pres;
    private String adv;
    
    
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
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     * @return the pres
     */
    public String getPres() {
        return pres;
    }

    /**
     * @param pres the pres to set
     */
    public void setPres(String pres) {
        this.pres = pres;
    }

    /**
     * @return the adv
     */
    public String getAdv() {
        return adv;
    }

    /**
     * @param adv the adv to set
     */
    public void setAdv(String adv) {
        this.adv = adv;
    }

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
}
