/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.adminBean;
import dao.signupDao;
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
public class updatePasswordServlet extends HttpServlet {

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
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String confirmpassword = request.getParameter("confirmpassword");

            adminBean ab = new adminBean();
            ab.setUsername(username);
            ab.setPassword(password);

            updateDao ud = new updateDao();
            
            String validate = ud.updatePassword(ab);

            if(password.equals(confirmpassword)){
                if(validate.equals("SUCCESS")){
                    request.setAttribute("errMessage", "Password change successful.");
                    request.getRequestDispatcher("/update-password.jsp?ID="+id).forward(request, response);
                }
                else{
                    request.setAttribute("errMessage", validate);
                    request.getRequestDispatcher("/update-password.jsp?ID="+id).forward(request, response);
                }
            }
            else{
                request.setAttribute("errMessage", "Make sure both password is correct.");
                request.getRequestDispatcher("/update-password.jsp?ID="+id).forward(request, response);
            }
        } catch (ClassNotFoundException ex) {
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
