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
import entity.Score;
import entity.ScoreType;
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
        
        GroupDBContext db  =  new GroupDBContext();
        ScoreDBContext sdb = new ScoreDBContext();
        int groupchoosen = Integer.parseInt(req.getParameter("groupchoosen"));
        int subjectchoosen = Integer.parseInt(req.getParameter("subjectchoosen"));
        List<Student> listStudent = db.getAllStudentByGroupId(groupchoosen);
        List<ScoreType> listScoreType = sdb.getScoreTypeBySubjectId(subjectchoosen);
        List<Score> listScore = new ArrayList<>();
        for (Student student : listStudent) {
            for (ScoreType scoreType : listScoreType) {
                int score = Integer.parseInt(req.getParameter("score" + student.getId() + "and" + scoreType.getSctid()));
                Score scoreObj = new Score();
                scoreObj.setScore(score);
                scoreObj.setStudent(student);
                scoreObj.setScoreType(scoreType);
                listScore.add(scoreObj);
                PrintWriter out = resp.getWriter();
                out.print(student.getName() + " " + scoreType.getSctname() + " " + scoreObj.getScore() + "\n");
            }
        }
        
//        sdb.UpdateScoreByGroupIdAndSubjetId(listScore, groupchoosen, subjectchoosen);
//        
//        req.getRequestDispatcher("../lecturer/markreport?groupchoosen="+groupchoosen+"&subject=" + subjectchoosen).forward(req, resp);
//        
//        
        
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
             int groupchoosen = Integer.parseInt(req.getParameter("groupchoosen"));//id lop
             req.setAttribute("listStudent", db.getAllStudentByGroupId(groupchoosen));
             int subject = Integer.parseInt(req.getParameter("subject"));//id mon hoc
             req.setAttribute("listScoreType", sdb.getScoreTypeBySubjectId(subject));
             ScoreDBContext scdb = new ScoreDBContext();
             req.setAttribute("listScore", scdb.getAllScoreByGroupIdAndSubjectId(groupchoosen, subject));
             req.setAttribute("groupchoosen", groupchoosen);
             req.setAttribute("subjectchoosen", subject);
        }
        req.setAttribute("studentgroup", studentgroup);
        req.getRequestDispatcher("../view/lecturer/markreport.jsp").forward(req, resp);
        
    }
}
