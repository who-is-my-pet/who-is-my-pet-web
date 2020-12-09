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

import dao.AnimalDAO;
import dao.UserDAO;

/**
 * Servlet implementation class ExploreLounge
 */
@WebServlet("/exploreLounge")
public class ExploreLounge extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ExploreLounge() {
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

		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		// findMatchedUser
		HttpSession session = request.getSession();
		int user_id = (int) session.getAttribute("id");
		int animal_id = Integer.parseInt(request.getParameter("id"));
		System.out.println("user_id: " + user_id + "\tanimal_id: " + animal_id);
		ArrayList<UserDTO> initUserList = UserDAO.findInitUserList(conn, user_id, animal_id);
		AnimalDAO animalDAO = new AnimalDAO();
		ArrayList<AnimalDTO> list = animalDAO.getAnimalInfo();
		System.out.println("animal: " + list.get(animal_id).getName());
		request.setAttribute("animal", list.get(animal_id).getName());
		System.out.println(initUserList);
		request.setAttribute("initUserList", initUserList);
		System.out.println(initUserList);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/explorePeople.jsp");
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
