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
public class AdminBean extends org.apache.struts.action.ActionForm {
    private String do_admin;
    private String query;
    private String primary_query;
    private String secondary_query;
    private String drop;
    
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

    /**
     * @return the query
     */
    public String getQuery() {
        return query;
    }

    /**
     * @param query the query to set
     */
    public void setQuery(String query) {
        this.query = query;
    }

    /**
     * @return the primary_query
     */
    public String getPrimary_query() {
        return primary_query;
    }

    /**
     * @param primary_query the primary_query to set
     */
    public void setPrimary_query(String primary_query) {
        this.primary_query = primary_query;
    }

    /**
     * @return the secondary_query
     */
    public String getSecondary_query() {
        return secondary_query;
    }

    /**
     * @param secondary_query the secondary_query to set
     */
    public void setSecondary_query(String secondary_query) {
        this.secondary_query = secondary_query;
    }

    /**
     * @return the drop
     */
    public String getDrop() {
        return drop;
    }

    /**
     * @param drop the drop to set
     */
    public void setDrop(String drop) {
        this.drop = drop;
    }


    
}
