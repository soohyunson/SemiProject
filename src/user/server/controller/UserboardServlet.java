package user.server.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ChallengeDAO;
import DTO.ChallengeDTO;

@WebServlet("*.board")
public class UserboardServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();
		String path = request.getContextPath();

		String realPath = uri.substring(path.length());
		System.out.println(realPath);
		if (realPath.contentEquals("/detail.board")) {
			//int challengeNum = Integer.parseInt(request.getParameter("challengeNum"));
			//int recordNum = Integer.parseInt(request.getParameter("seq"));

			try {
				ChallengeDTO dto = ChallengeDAO.getInstance().getChallenge(16);

				
				System.out.println(dto.getStart_date());
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date formatDate=format.parse(dto.getStart_date());
				String day = new SimpleDateFormat("MM").format(formatDate);
				String month = new SimpleDateFormat("dd").format(formatDate);
				
				System.out.println(day);
				System.out.println(month);
				
				
				
				request.setAttribute("day", day);
				request.setAttribute("month", month);
				request.setAttribute("recordNum", 11);
				request.setAttribute("dto", dto);
				
				request.getRequestDispatcher("UserTestNotNotNOt/detailTest.jsp").forward(request, response);
			} catch (Exception e) {
				System.out.println("오류났어요!!오류오류");
			}

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
