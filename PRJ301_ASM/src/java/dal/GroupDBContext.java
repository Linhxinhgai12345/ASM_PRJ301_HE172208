/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import entity.Lecturer;
import entity.Role;
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
public class GroupDBContext extends DBContext<Student> {

    public List<StudentGroup> getStudentGroupByLecturerId(int lname) {
        List<StudentGroup> group = new ArrayList<>();
        try {
            String sql = "select sg.gid, sg.gname, su.subid, su.suname from StudentGroup sg\n"
                    + "inner join Subject su on sg.subid = su.subid\n"
                    + "where lid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lname);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject su = new Subject();
                StudentGroup sg = new StudentGroup();
                su.setId(rs.getInt("subid"));
                su.setName(rs.getString("suname"));
                sg.setSubject(su);
                sg.setId(rs.getInt("gid"));
                sg.setName(rs.getString("gname"));
                group.add(sg);
            }

        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return group;
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
