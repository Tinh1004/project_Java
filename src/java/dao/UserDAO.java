/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dbcontext.ConnectDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

public class UserDAO {
    public List<User> getUsers() {
        List<User> sl = new ArrayList<>();
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        
        try {
            con = db.openConnection();
            //Hien thi theo id
            String query = "select * from UserDB";
            statement = con.prepareStatement(query);
            rs = statement.executeQuery();
            while(rs.next()){
                int id = rs.getInt(1);
                String userName = rs.getString(2).trim();
                String userEmail = rs.getString(3).trim();
                String userPassword = rs.getString(4).trim();
                boolean userRole = (Boolean)rs.getBoolean(5);
                User tmpStudent = new User(id, userName, userEmail, userPassword, userRole);
                sl.add(tmpStudent);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try {
                rs.close();
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return sl;
    }
    public User getUser(String userEmail) {
        User user = new User();
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        
        try {
            con = db.openConnection();
            //Hien thi theo id
            String query = "select * from UserDB where userEmail=?";
            statement = con.prepareStatement(query);
            statement.setString(1, userEmail);
            
            rs = statement.executeQuery();
            while(rs.next()){
                int id = rs.getInt(1);
                String userName = rs.getString(2).trim();
                String email = rs.getString(3).trim();
                String userPassword = rs.getString(4).trim();
                boolean userRole = (Boolean) rs.getBoolean(5);
                
                user.setId(id);
                user.setUserName(userName);
                user.setUserEmail(email);
                user.setUserPassword(userPassword);
                user.setUserRole(userRole);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try {
                rs.close();
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return user;
    }
    
    public boolean login(User user) {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        
        try {
            con = db.openConnection();
            String query = "select * from UserDB where userEmail=? and userPassword=?";
            // Student insert CODE here
            statement = con.prepareStatement(query);
            
            statement.setString(1, user.getUserEmail().trim());
            statement.setString(2, user.getUserPassword().trim());
            
            rs = statement.executeQuery();
            
            if (rs.next()) {
                System.out.println("Success");
                return true;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try {
                rs.close();
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }
    
    public boolean register(User user) {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        
        try {
            con = db.openConnection();
            String query = "insert into UserDB(userName,userEmail,userPassword) values(?, ?,?)";
            // Student insert CODE here
            statement = con.prepareStatement(query);
            
            statement.setString(1, user.getUserName().trim());
            statement.setString(2, user.getUserEmail().trim());
            statement.setString(3, user.getUserPassword().trim());
            int rs = statement.executeUpdate();
            if (rs==1) {
                System.out.print("Success");
                return true;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try {
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }
    
    public void deleteUser(int id) {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        
        try {
            con = db.openConnection();
            String query = "DELETE FROM UserDB WHERE typeid=?";
            // Student insert CODE here
            statement = con.prepareStatement(query);
            statement.setInt(1, id);
            statement.execute();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try {
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public int numberUser(){
        List<User> sl = getUsers();
        return sl.size();
    }
}
