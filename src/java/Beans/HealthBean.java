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
public class HealthBean extends org.apache.struts.action.ActionForm {
    
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
    private String bg;
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
    private String typh;
    private String do_update;
    /**
     * @return the h_year
     */
    public String getH_year() {
        return h_year;
    }

    /**
     * @param h_year the h_year to set
     */
    public void setH_year(String h_year) {
        this.h_year = h_year;
    }

    /**
     * @return the foot
     */
    public String getFoot() {
        return foot;
    }

    /**
     * @param foot the foot to set
     */
    public void setFoot(String foot) {
        this.foot = foot;
    }

    /**
     * @return the inch
     */
    public String getInch() {
        return inch;
    }

    /**
     * @param inch the inch to set
     */
    public void setInch(String inch) {
        this.inch = inch;
    }

    /**
     * @return the weight
     */
    public int getWeight() {
        return weight;
    }

    /**
     * @param weight the weight to set
     */
    public void setWeight(int weight) {
        this.weight = weight;
    }

    /**
     * @return the waist
     */
    public int getWaist() {
        return waist;
    }

    /**
     * @param waist the waist to set
     */
    public void setWaist(int waist) {
        this.waist = waist;
    }

    /**
     * @return the bphigh
     */
    public int getBphigh() {
        return bphigh;
    }

    /**
     * @param bphigh the bphigh to set
     */
    public void setBphigh(int bphigh) {
        this.bphigh = bphigh;
    }

    /**
     * @return the bplow
     */
    public int getBplow() {
        return bplow;
    }

    /**
     * @param bplow the bplow to set
     */
    public void setBplow(int bplow) {
        this.bplow = bplow;
    }

    /**
     * @return the v_right
     */
    public String getV_right() {
        return v_right;
    }

    /**
     * @param v_right the v_right to set
     */
    public void setV_right(String v_right) {
        this.v_right = v_right;
    }

    /**
     * @return the v_left
     */
    public String getV_left() {
        return v_left;
    }

    /**
     * @param v_left the v_left to set
     */
    public void setV_left(String v_left) {
        this.v_left = v_left;
    }

    /**
     * @return the dental
     */
    public String getDental() {
        return dental;
    }

    /**
     * @param dental the dental to set
     */
    public void setDental(String dental) {
        this.dental = dental;
    }

    /**
     * @return the chest
     */
    public String getChest() {
        return chest;
    }

    /**
     * @param chest the chest to set
     */
    public void setChest(String chest) {
        this.chest = chest;
    }

    /**
     * @return the abdomen
     */
    public String getAbdomen() {
        return abdomen;
    }

    /**
     * @param abdomen the abdomen to set
     */
    public void setAbdomen(String abdomen) {
        this.abdomen = abdomen;
    }

    /**
     * @return the other
     */
    public String getOther() {
        return other;
    }

    /**
     * @param other the other to set
     */
    public void setOther(String other) {
        this.other = other;
    }

    /**
     * @return the advice
     */
    public String getAdvice() {
        return advice;
    }

    /**
     * @param advice the advice to set
     */
    public void setAdvice(String advice) {
        this.advice = advice;
    }

    /**
     * @return the bg
     */
    public String getBg() {
        return bg;
    }

    /**
     * @param bg the bg to set
     */
    public void setBg(String bg) {
        this.bg = bg;
    }

    /**
     * @return the hepb1
     */
    public String getHepb1() {
        return hepb1;
    }

    /**
     * @param hepb1 the hepb1 to set
     */
    public void setHepb1(String hepb1) {
        this.hepb1 = hepb1;
    }

    /**
     * @return the hepb2
     */
    public String getHepb2() {
        return hepb2;
    }

    /**
     * @param hepb2 the hepb2 to set
     */
    public void setHepb2(String hepb2) {
        this.hepb2 = hepb2;
    }

    /**
     * @return the hepb3
     */
    public String getHepb3() {
        return hepb3;
    }

    /**
     * @param hepb3 the hepb3 to set
     */
    public void setHepb3(String hepb3) {
        this.hepb3 = hepb3;
    }

    /**
     * @return the mmr1
     */
    public String getMmr1() {
        return mmr1;
    }

    /**
     * @param mmr1 the mmr1 to set
     */
    public void setMmr1(String mmr1) {
        this.mmr1 = mmr1;
    }

    /**
     * @return the mmr2
     */
    public String getMmr2() {
        return mmr2;
    }

    /**
     * @param mmr2 the mmr2 to set
     */
    public void setMmr2(String mmr2) {
        this.mmr2 = mmr2;
    }

    /**
     * @return the tn1
     */
    public String getTn1() {
        return tn1;
    }

    /**
     * @param tn1 the tn1 to set
     */
    public void setTn1(String tn1) {
        this.tn1 = tn1;
    }

    /**
     * @return the tn2
     */
    public String getTn2() {
        return tn2;
    }

    /**
     * @param tn2 the tn2 to set
     */
    public void setTn2(String tn2) {
        this.tn2 = tn2;
    }

    /**
     * @return the tn3
     */
    public String getTn3() {
        return tn3;
    }

    /**
     * @param tn3 the tn3 to set
     */
    public void setTn3(String tn3) {
        this.tn3 = tn3;
    }

    /**
     * @return the hepa1
     */
    public String getHepa1() {
        return hepa1;
    }

    /**
     * @param hepa1 the hepa1 to set
     */
    public void setHepa1(String hepa1) {
        this.hepa1 = hepa1;
    }

    /**
     * @return the hepa2
     */
    public String getHepa2() {
        return hepa2;
    }

    /**
     * @param hepa2 the hepa2 to set
     */
    public void setHepa2(String hepa2) {
        this.hepa2 = hepa2;
    }

    /**
     * @return the ch1
     */
    public String getCh1() {
        return ch1;
    }

    /**
     * @param ch1 the ch1 to set
     */
    public void setCh1(String ch1) {
        this.ch1 = ch1;
    }

    /**
     * @return the ch2
     */
    public String getCh2() {
        return ch2;
    }

    /**
     * @param ch2 the ch2 to set
     */
    public void setCh2(String ch2) {
        this.ch2 = ch2;
    }

    /**
     * @return the typh
     */
    public String getTyph() {
        return typh;
    }

    /**
     * @param typh the typh to set
     */
    public void setTyph(String typh) {
        this.typh = typh;
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
