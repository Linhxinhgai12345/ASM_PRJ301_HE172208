/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.lecturer;

import dal.LessionDBContext;
import entity.Account;
import entity.Attendence;
import entity.Lession;
import entity.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author DEll
 */
public class AttendanceTakingController extends HttpServlet {
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param req
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int leid = Integer.parseInt(req.getParameter("id"));
        LessionDBContext db = new LessionDBContext();
        ArrayList<Attendence> atts = db.getAttendencesByLession(leid);
        req.setAttribute("atts", atts);
        req.getRequestDispatcher("../view/lecturer/att.jsp").forward(req, resp);
    
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
        int leid = Integer.parseInt(req.getParameter("id"));
        LessionDBContext db = new LessionDBContext();
        ArrayList<Student> students = db.getStudentsByLession(leid);
        ArrayList<Attendence> atts = new ArrayList<>();
        Lession lession = new Lession();
        lession.setId(leid);
        for (Student student : students) {
            Attendence a = new Attendence();
            a.setLession(lession);
            a.setStudent(student);
            a.setDescription(req.getParameter("description"+student.getId()));
            a.setPresent(req.getParameter("present"+student.getId()).equals("yes"));
            atts.add(a);
        }
        db.takeAttendances(leid, atts);
        resp.sendRedirect("att?id="+leid);
    
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
