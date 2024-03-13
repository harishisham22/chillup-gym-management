/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.programBean;
import bean.trainerBean;
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
public class updateProgramServlet extends HttpServlet {

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
            int id = Integer.parseInt(request.getParameter("program_id"));
            String programName = request.getParameter("program_name").toUpperCase();
            String programIntensity = request.getParameter("program_intensity").toUpperCase();
            String programDuration = request.getParameter("program_duration").toUpperCase();
            String programDesc = request.getParameter("program_desc");
            
            programBean pb = new programBean(programName, programIntensity, programDuration, programDesc);
            
            updateDao ud = new updateDao();
            
            String validate = ud.updateProgram(id, pb);
            
            if(validate.equalsIgnoreCase("SUCCESS")){
                request.setAttribute("errMessage", "Program update successful.");
                request.getRequestDispatcher("update-program.jsp?ID="+id).forward(request, response);
            }
            else{
                request.setAttribute("errMessage", validate);
                request.getRequestDispatcher("update-program.jsp?ID="+id).forward(request, response);
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(updateMemberServlet.class.getName()).log(Level.SEVERE, null, ex);
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
