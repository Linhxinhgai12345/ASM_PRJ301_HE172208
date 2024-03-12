/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.lecturer;

import controller.authentication.authorization.BaseRBACController;
import dal.GroupDBContext;
import dal.LessionDBContext;
import dal.ScoreDBContext;
import dal.TimeSlotDBContext;
import entity.Account;
import entity.Lecturer;
import entity.Lession;
import entity.Role;
import entity.Student;
import entity.StudentGroup;
import entity.TimeSlot;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import util.DateTimeHelper;

/**
 *
 * @author DEll
 */
public class MarkReportController extends BaseRBACController {
   
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        GroupDBContext db  =  new GroupDBContext();
        ScoreDBContext sdb = new ScoreDBContext();
        HttpSession session = req.getSession();
        //in ra lowps theo lecturer id
        Lecturer lecturer = (Lecturer)session.getAttribute("lecturer");
        List<StudentGroup> studentgroup = db.getStudentGroupByLecturerId(lecturer.getId());
        if(req.getParameter("groupchoosen") != null){
             int groupchoosen = Integer.parseInt(req.getParameter("groupchoosen"));
             req.setAttribute("listStudent", db.getAllStudentByGroupId(groupchoosen));
             int subject = Integer.parseInt(req.getParameter("subject"));
             req.setAttribute("listScoreType", sdb.getScoreTypeBySubjectId(subject));
        }
        req.setAttribute("studentgroup", studentgroup);
        req.getRequestDispatcher("../view/lecturer/markreport.jsp").forward(req, resp);
        
    }
}
