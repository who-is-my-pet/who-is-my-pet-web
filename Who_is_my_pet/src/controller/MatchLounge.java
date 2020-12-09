package controller;

import dto.AnimalDTO;
import dto.UserDTO;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import dto.UserDTO;

/**
 * Servlet implementation class MatchLounge
 */
@WebServlet("/MatchLounge")
public class MatchLounge extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MatchLounge() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("url: " + request.getRequestURL());
		// TODO Auto-generated method stub
		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		// findMatchedUser
		HttpSession session = request.getSession();
		int user_id = (int) session.getAttribute("id");
		System.out.println(user_id);
		ArrayList<UserDTO> matchedUserList = UserDAO.findMatchedUserList(conn, user_id);
		ArrayList<UserDTO> yetMatchedUserList = UserDAO.findYetMatchedUserList(conn, user_id);
		for (int i = 0; i < matchedUserList.size(); i++)
			System.out.println("matchedUserList: " + i);
		System.out.println("yetMatchedUserList: " + yetMatchedUserList);
		request.setAttribute("matchedUserList", matchedUserList);
		request.setAttribute("yetMatchedUserList", yetMatchedUserList);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/matchPeople.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
