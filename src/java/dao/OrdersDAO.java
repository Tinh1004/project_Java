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
import model.Order;
import model.OrderBuy;
import model.Product;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Admin
 */
public class OrdersDAO {
    ProductDAO productDAO = new ProductDAO();
    ConnectDB db = ConnectDB.getInstance();
    Connection con = null;
    PreparedStatement statement = null;
    ResultSet rs = null;
    
    public List<Order> getOrders() throws SQLException {
        List<Order> sl = new ArrayList<>();
        
        try {
            con = db.openConnection();
            //Hien thi theo id
            String query = "select * from OrdersDB";
            statement = con.prepareStatement(query);
            rs = statement.executeQuery();
            
            while(rs.next()){
                int o_id = rs.getInt(1);
                int p_id = rs.getInt(2);
                int u_id = rs.getInt(3);
                int o_quantity = rs.getInt(4);
                String o_date = rs.getString(5);
                
                Order newOrder = new Order();
                newOrder.setOrderId(o_id);
                newOrder.setId(p_id);
                newOrder.setUid(u_id);
                newOrder.setQuantity(o_quantity);
                newOrder.setDate(o_date);
                sl.add(newOrder);
            }
           
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try {
                rs.close();
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        
        return sl;
    }
    
    public boolean insertOrder(Order model){
        try {
            con = db.openConnection();
            String query = "insert into OrdersDB values(?,?,?,?)";
            // Student insert CODE here
            statement = con.prepareStatement(query);
            
            statement.setInt(1, model.getId());
            statement.setInt(2,model.getUid());
            statement.setInt(3, model.getQuantity());
            statement.setString(4, model.getDate());
            int result = statement.executeUpdate();
            
            if (result==1) {
                System.out.print("Success");
                return true;
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try {
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return false;
    }
    
    public List<Order> getUserOrders(int id) throws SQLException {
        List<Order> sl = new ArrayList<>();
    
        try {
            con = db.openConnection();
            //Hien thi theo id
            String query = "select * from OrdersDB where u_id=? order by o_id desc";
            statement = con.prepareStatement(query);
            
            statement.setInt(1, id);
            
            rs = statement.executeQuery();
            
            while(rs.next()){
                int o_id = rs.getInt(1);
                int p_id = rs.getInt(2);
                int u_id = rs.getInt(3);
                int o_quantity = rs.getInt(4);
                String o_date = rs.getString(5);
                
                Order newOrder = new Order();
                newOrder.setOrderId(o_id);
                newOrder.setId(p_id);
                newOrder.setUid(u_id);
                newOrder.setQuantity(o_quantity);
                newOrder.setDate(o_date);
                
                Product product = productDAO.getProduct(p_id);
                newOrder.setProductName(product.getProductName());
                newOrder.setNewPrice(product.getNewPrice());
                
                sl.add(newOrder);
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try {
                rs.close();
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        
        return sl;
    }
    
    public void cancelOrder(int id){
        try {
            con = db.openConnection();
            String query = "DELETE FROM OrdersDB WHERE o_id=?";
            // Student insert CODE here
            statement = con.prepareStatement(query);
            statement.setInt(1, id);
            statement.execute();
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try {
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }    }    
    
    public int numberOrder() throws SQLException{
        List<Order> sl = getOrders();
        return sl.size();
    }
    
    public List<OrderBuy> getOrdersBuy() throws SQLException {
        List<OrderBuy> sl = new ArrayList<>();
        
        try {
            con = db.openConnection();
            //Hien thi theo id
            String query = "select OrdersDB.o_date, ProductDB.productName, ProductDB.newPrice, OrdersDB.o_quantity,UserDB.userName   from OrdersDB, ProductDB, UserDB\n" +
            "	where OrdersDB.p_id = ProductDB.id\n" +
            "	and OrdersDB.u_id = UserDB.typeid\n" +
            "	order by OrdersDB.o_id DESC";
            statement = con.prepareStatement(query);
            rs = statement.executeQuery();
            
            while(rs.next()){
                String o_date = rs.getString(1);
                String productName = rs.getString(2);
                String newPrice = rs.getString(3);
                int o_quantity = rs.getInt(4);
                String userName = rs.getString(5);
                
                OrderBuy newOrderBuy = new OrderBuy(o_date, productName, newPrice, o_quantity, userName);
                sl.add(newOrderBuy);
            }
           
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try {
                rs.close();
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(OrdersDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        
        return sl;
    }
    
}
