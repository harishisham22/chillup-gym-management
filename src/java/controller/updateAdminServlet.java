/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.adminBean;
import bean.memberBean;
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
public class updateAdminServlet extends HttpServlet {

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
            String fullname = request.getParameter("fullname").toUpperCase();
            String email = request.getParameter("email");
            String phone = request.getParameter("phone").toUpperCase();
            String username = request.getParameter("username");
            
            adminBean ab = new adminBean();
            ab.setFullname(fullname);
            ab.setEmail(email);
            ab.setPhone(phone);
            ab.setUsername(username);
            
            updateDao ud = new updateDao();
            
            String validate = ud.updateAdmin(ab);
            
            if(validate.equalsIgnoreCase("SUCCESS")){
                request.setAttribute("errMessage", "Profile update successful.");
                request.getRequestDispatcher("update-profile.jsp?ID="+id).forward(request, response);
            }
            else{
                request.setAttribute("errMessage", validate);
                request.getRequestDispatcher("update-profile.jsp?ID="+id).forward(request, response);
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
