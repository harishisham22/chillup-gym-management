/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.memberBean;
import bean.programBean;
import dao.createDao;
import java.io.IOException;
import java.io.PrintWriter;
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
public class addProgramServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String program_name = request.getParameter("program_name").toUpperCase();
            String program_intensity = request.getParameter("program_intensity").toUpperCase();
            String program_duration = request.getParameter("program_duration").toUpperCase();
            String program_desc = request.getParameter("program_desc");
            
            programBean pb = new programBean(program_name, program_intensity, program_duration, program_desc);
            
            createDao cd = new createDao();
            
            String validate = cd.addProgram(pb);
            
            if(validate.equalsIgnoreCase("SUCCESS")){
                request.setAttribute("errMessage", "Program successfully added.");
                request.getRequestDispatcher("addprogram.jsp").forward(request, response);
            }
            else{
                request.setAttribute("errMessage", validate);
                request.getRequestDispatcher("addprogram.jsp").forward(request, response);
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
