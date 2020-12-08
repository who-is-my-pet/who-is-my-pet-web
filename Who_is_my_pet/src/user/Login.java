package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String id, pw;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		
		System.out.println(id+pw);
		ServletContext sc = getServletContext();
		Connection conn = (Connection)sc.getAttribute("DBconnection");
		
		ResultSet rs = DBUtil.findUser(conn, id);
		
		PrintWriter out = response.getWriter();
		
		if(rs != null) {
			try {
				if(rs.next()) {
					String checkpw = rs.getString(1);
					if(checkpw.equals(pw)) {
						request.setAttribute("id", id);
						RequestDispatcher view = request.getRequestDispatcher("/MyPage.jsp"); 
						view.forward(request, response);
					}
					else {
						out.println("Wrong password");
					}
				}
				else {
					out.println("Invalid user name");
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
