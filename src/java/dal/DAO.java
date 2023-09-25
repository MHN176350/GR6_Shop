/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.BlogCategory;
import Model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *Select * from Product order by p_id OFFSET " + (i - 1) * 8 + "  Row Fetch next 8 ROWS ONLY
 * @author Minh
 */
public class DAO extends DBContext {
    public List<User> getAllU(String param){
        List<User> list=new ArrayList<>();
        int i=Integer.parseInt(param);
    
          
        try {
            
            String com="Select * from users order by user_id Limit "+(i-1)*8 +" ,8";
            PreparedStatement st=connection.prepareStatement(com);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                User u=new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getDouble(9),rs.getInt(10),rs.getString(11),rs.getInt(12));
                list.add(u);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    public int getPage(){
        try {
            int c=0;
            String com="Select count(user_id) from users";
            PreparedStatement st=connection.prepareStatement(com);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                c=rs.getInt(1);
            }
            return c;
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    public User getU(String id){
        try {
            String com="Select * from users where user_id="+id;
            PreparedStatement st=connection.prepareStatement(com);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                User u=new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),rs.getDouble(9),rs.getInt(10),rs.getString(11),rs.getInt(12));
                return u;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public void user_cont(String id, String stt){
        try {
            String com="Update users set status="+stt+" where user_id="+id;
            PreparedStatement st=connection.prepareStatement(com);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void addB(String title, String cont, int a_id, int cate ){
        try {
            String com="Insert into blog(title, main, author_id, b_cate) values(?,?,?,?)";
            PreparedStatement st=connection.prepareStatement(com);
            st.setString(1, title);
            st.setString(2, cont);
            st.setInt(3, a_id);
            st.setInt(4, cate);
            st.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public List<BlogCategory> getAllBC(){
        List<BlogCategory> list=new ArrayList<>();
        try {
            String com="SELECT * FROM swp.b_cate";
            PreparedStatement st=connection.prepareStatement(com);
            ResultSet rs=st.executeQuery();
            while(rs.next()){
                BlogCategory b=new BlogCategory(rs.getInt(1),rs.getString(2));
                list.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
}
}
