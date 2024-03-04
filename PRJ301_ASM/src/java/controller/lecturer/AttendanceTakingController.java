/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.lecturer;

import controller.authentication.BaseRequiredAuthenticationController;
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
public class AttendanceTakingController extends BaseRequiredAuthenticationController {
   

   @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int leid = Integer.parseInt(req.getParameter("id"));
        LessionDBContext db = new LessionDBContext();
        ArrayList<Student> students = db.getStudentsByLession(leid);
        ArrayList<Attendence> atts = new ArrayList<>();//những att đã sửa hoặc update
        Lession lession = new Lession();
        lession.setId(leid);
        for (Student student : students) {
            Attendence a = new Attendence();
            a.setId(Integer.parseInt(req.getParameter("aid" + student.getId())));
            a.setLession(lession);
            a.setStudent(student);
            a.setDescription(req.getParameter("description"+student.getId()));
            a.setPresent(req.getParameter("present"+student.getId()).equals("yes"));
            atts.add(a);
        }
        
        
        ArrayList<Attendence> att1st = db.getAttendencesByLession(leid);//nhưng att đang có trong database
        ArrayList<Attendence> att2nd = new ArrayList<>();
        for(int i = 0; i < atts.size(); i++){
            if(!att1st.get(i).getDescription().equals(atts.get(i).getDescription()) || !att1st.get(i).isPresent() == atts.get(i).isPresent()){
                att2nd.add(atts.get(i));//so sánh khác nhau thì nhét vào att2
            }
        }
        db.takeAttendances2(leid, att2nd);//att2 update thay thế cái bị thay đổi, còn lại giữ nguyên
        resp.sendRedirect("att?id="+leid);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        int leid = Integer.parseInt(req.getParameter("id"));
        LessionDBContext db = new LessionDBContext();
        ArrayList<Attendence> atts = db.getAttendencesByLession(leid);
        req.setAttribute("atts", atts);
        req.getRequestDispatcher("../view/lecturer/att.jsp").forward(req, resp);
    
    }

}
