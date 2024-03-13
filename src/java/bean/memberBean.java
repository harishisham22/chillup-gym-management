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
public class memberBean implements java.io.Serializable{
    private String fullname, gender, icno, phone, email;
    private int age;
    
    public memberBean(){
        fullname = gender = icno = phone = email = null;
        age = 0;
    }

    public memberBean(String fullname, int age, String gender, String icno, String phone, String email) {
        this.fullname = fullname;
        this.gender = gender;
        this.icno = icno;
        this.phone = phone;
        this.email = email;
        this.age = age;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getIcno() {
        return icno;
    }

    public void setIcno(String icno) {
        this.icno = icno;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    
}
