/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.classBean;
import bean.memberBean;
import dao.createDao;
import dao.updateDao;
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
public class updateClassServlet extends HttpServlet {

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
            int id = Integer.parseInt(request.getParameter("id"));
            String day = request.getParameter("day").toUpperCase();
            String time = request.getParameter("time").toUpperCase();
            String programName = request.getParameter("program").toUpperCase();
            String trainerName =request.getParameter("trainer").toUpperCase();
            
            classBean cb = new classBean(day, time, programName, trainerName);
            
            updateDao ud = new updateDao();
            
            String validate = ud.updateClass(id,cb);
            
            if(validate.equalsIgnoreCase("SUCCESS")){
                request.setAttribute("errMessage", "Class update successful.");
                request.getRequestDispatcher("update-class.jsp?ID="+id).forward(request, response);
            }
            else{
                request.setAttribute("errMessage", validate);
                request.getRequestDispatcher("update-class.jsp?ID="+id).forward(request, response);
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
