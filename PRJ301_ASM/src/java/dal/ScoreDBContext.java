/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import entity.Lecturer;
import entity.Role;
import entity.ScoreType;
import entity.Student;
import entity.StudentGroup;
import entity.Subject;
import java.lang.reflect.Array;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.jasper.tagplugins.jstl.core.ForEach;

/**
 *
 * @author DEll
 */
public class ScoreDBContext extends DBContext<Student> {

    public List<ScoreType> getScoreTypeBySubjectId(int subjectId) {
        List<ScoreType> scores = new ArrayList<>();
        try {
            String sql = "select sc.sctid, sc.sctname, sc.sctpercent, su.subid, su.suname from ScoreType sc \n"
                    + "join Subject su on su.subid = sc.subid\n"
                    + "where su.subid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, subjectId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ScoreType scoreType = new ScoreType();
                Subject subject = new Subject();
                subject.setId(rs.getInt("subid"));
                subject.setName(rs.getString("suname"));
                scoreType.setSubject(subject);
                scoreType.setSctid(rs.getInt("sctid"));
                scoreType.setSctname(rs.getString("sctname"));
                scoreType.setSctpercent(rs.getString("sctpercent"));
                scores.add(scoreType);
            }

        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return scores;
    }

    public ArrayList<Student> getAllStudentByGroupId(int lname) {
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "select s.sid, s.sname from Student s\n"
                    + "join Enrollment e on s.sid = e.sid\n"
                    + "join StudentGroup sg on sg.gid = e.gid\n"
                    + "where sg.gid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lname);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("sid"));
                student.setName(rs.getString("sname"));
                students.add(student);
            }

        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }

    public Lecturer getLecturerByUsername(String username) {
        Lecturer lecturer = new Lecturer();
        try {
            String sql = "select * from Lecturer where lname = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                lecturer.setId(rs.getInt(1));
                lecturer.setName(rs.getString(2));
            }

        } catch (SQLException ex) {
            Logger.getLogger(RoleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lecturer;
    }

    @Override
    public ArrayList<Student> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Student get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
