
import Model.User;
import dal.DAO;
import java.util.List;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Minh
 */
public class test {
    public static void main(String[] args) {
        DAO da=new DAO();
        List<User> list=da.getAllU("1");
        System.out.println(list.get(0).uid);
    }
}
