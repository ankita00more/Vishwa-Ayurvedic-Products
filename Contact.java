package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Contact")
public class Contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Contact() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html");
		String pname=request.getParameter("fname");
		String pcode=request.getParameter("lname");
		String pqty=request.getParameter("cname");
		String price=request.getParameter("sname");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project1","root","");
			PreparedStatement pst = con.prepareStatement("insert into contact values (?,?,?,?)");
			pst.setString(1, pname);
			pst.setString(2, pcode);
			pst.setString(3, pqty);
			pst.setString(4, price);
			PrintWriter pw = response.getWriter();
			int status=pst.executeUpdate();
			
			if (status > 0) {
				RequestDispatcher rd = request.getRequestDispatcher("cont.html");
				rd.forward(request, response);
			}
			else {
				pw.print("<h2 >Something Went Wrong...</h2>");
				pw.print("<a href='Add.html'>Try Again...</a>");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	


		
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
