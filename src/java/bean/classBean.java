/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author MOHAMMAD NORHARIS
 */
public class classBean {
    private String program_name, trainer_fullname, day, time;
    
    public classBean(){
        program_name = trainer_fullname = day = time = null;
    }

    public classBean(String day, String time, String program_name, String trainer_fullname) {
        this.program_name = program_name;
        this.day = day;
        this.time = time;
        this.trainer_fullname = trainer_fullname;
    }

    public String getProgram_name() {
        return program_name;
    }

    public void setProgram_name(String program_name) {
        this.program_name = program_name;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getTrainer_Fullname() {
        return trainer_fullname;
    }

    public void setTrainer_Fullname(String getTrainer_Fullname) {
        this.trainer_fullname = trainer_fullname;
    }
    
    
}
