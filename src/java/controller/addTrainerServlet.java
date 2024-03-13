/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.trainerBean;
import dao.createDao;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MOHAMMAD NORHARIS
 */
public class addTrainerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String fullname = (String) request.getParameter("fullname").toUpperCase();
            int age = Integer.parseInt(request.getParameter("age"));
            String gender = (String) request.getParameter("gender").toUpperCase();
            String icno = (String) request.getParameter("icno").toUpperCase();
            String phone = (String) request.getParameter("phone").toUpperCase();
            String email = (String) request.getParameter("email");
            
            trainerBean tb = new trainerBean(fullname, age, gender, icno, phone, email);
            
            createDao cd = new createDao();
            
            String validate = cd.addTrainer(tb);
            
            if(validate.equalsIgnoreCase("SUCCESS")){
                request.setAttribute("errMessage", "Trainer successfully added.");
                request.getRequestDispatcher("addtrainer.jsp").forward(request, response);
            }
            else{
                request.setAttribute("errMessage", validate);
                request.getRequestDispatcher("addtrainer.jsp").forward(request, response);
            }
            
        }catch (ClassNotFoundException ex) {
            Logger.getLogger(signupServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
