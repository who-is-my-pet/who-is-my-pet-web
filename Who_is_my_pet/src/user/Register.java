package user;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.DBUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/Register.do")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String id, pw, name, gender, age, insta, email1, email2, imgurl, description;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		id = request.getParameter("newid");
		pw = request.getParameter("newpassword");
		name = request.getParameter("name");
		gender = request.getParameter("gender");
		age = request.getParameter("age");
		insta = request.getParameter("insta");
		email1 = request.getParameter("mail1");
		email2 = request.getParameter("mail2");
		description = request.getParameter("description");
		//imgurl = request.getParameter("profileimg");
		
		ServletContext sct = getServletContext();
		Connection conn = (Connection) sct.getAttribute("DBconnection");

		ResultSet rs = DBUtil.findUser(conn, id);
		
		PrintWriter out = response.getWriter();
		
		/*InputStream inputstream = null;
		
		Part filePart = request.getPart("profileimg");
		
		if(filePart!=null) {
			inputstream = filePart.getInputStream();
		}*/

		System.out.println(id+pw+name+gender+age+insta+email1+"@"+email2+description);
		
		if(rs != null) {
			try {
				if(rs.next()) {
					response.sendRedirect("checkPage.jsp");
				}
				else {					
					DBUtil.addMember(conn, id, pw, name, gender, age, insta, email1, email2, description);
					
					request.setAttribute("name", name);
					RequestDispatcher view = request.getRequestDispatcher("/RegisterSuccess.jsp"); 
					view.forward(request, response);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);	
	}
}
