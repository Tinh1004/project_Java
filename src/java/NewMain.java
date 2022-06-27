import dao.OrdersDAO;
import dao.ProductDAO;
import dao.UserDAO;
import java.sql.SQLException;
import java.util.List;
import model.Order;
import model.Product;
import model.User;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
/**
 *
 * @author Admin
 */
public class NewMain {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException {
        ProductDAO productDAO = new ProductDAO();
//        
//        List<Product> produts = productDAO.getProducts();
        Product product = new Product("Điện thoại Samsung Galaxy A52s 5G 128GB",0,7990000,"https://cdn.tgdd.vn/Products/Images/42/247507/samsung-galaxy-a52s-5g-1-5.jpg");
        System.out.println(product);
        System.out.println(productDAO.createProduct(product));
//
//        OrdersDAO orderDAO = new OrdersDAO();
//        System.out.println(orderDAO.getUserOrders(1));
//        List<Order> orders = orderDAO.getOrders();
//        for(Order o : orders){
//            System.out.println(o);
//        }
    }
    
}
