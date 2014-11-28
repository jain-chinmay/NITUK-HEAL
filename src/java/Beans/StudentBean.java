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
public class StudentBean extends org.apache.struts.action.ActionForm {
    
    private String dept;
    private int hostel;
    private int room;
    private int year;
    private String do_update;

    /**
     * @return the dept
     */
    public String getDept() {
        return dept;
    }

    /**
     * @param dept the dept to set
     */
    public void setDept(String dept) {
        this.dept = dept;
    }

    /**
     * @return the hostel
     */
    public int getHostel() {
        return hostel;
    }

    /**
     * @param hostel the hostel to set
     */
    public void setHostel(int hostel) {
        this.hostel = hostel;
    }

    /**
     * @return the room
     */
    public int getRoom() {
        return room;
    }

    /**
     * @param room the room to set
     */
    public void setRoom(int room) {
        this.room = room;
    }

    /**
     * @return the year
     */
    public int getYear() {
        return year;
    }

    /**
     * @param year the year to set
     */
    public void setYear(int year) {
        this.year = year;
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
