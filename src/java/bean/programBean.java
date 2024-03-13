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
public class programBean implements java.io.Serializable {
    private String program_name, program_intensity, program_duration, program_desc;
    
    public programBean(){
        program_name = program_intensity = program_duration = program_desc = null;
    }

    public programBean(String program_name, String program_intensity, String program_duration, String program_desc) {
        this.program_name = program_name;
        this.program_intensity = program_intensity;
        this.program_duration = program_duration;
        this.program_desc = program_desc;
    }

    public String getProgram_name() {
        return program_name;
    }

    public void setProgram_name(String program_name) {
        this.program_name = program_name;
    }

    public String getProgram_intensity() {
        return program_intensity;
    }

    public void setProgram_intensity(String program_intensity) {
        this.program_intensity = program_intensity;
    }

    public String getProgram_duration() {
        return program_duration;
    }

    public void setProgram_duration(String program_duration) {
        this.program_duration = program_duration;
    }
    
    public String getProgram_desc() {
        return program_desc;
    }

    public void setProgram_desc(String program_desc) {
        this.program_desc = program_desc;
    }

    
    
    
}
