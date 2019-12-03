package admin.sever.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ChallengeDAO;
import DAO.ChallengeRecordDAO;
import DTO.ChallengeDTO;

@WebServlet("*.challenge")
public class ChallengeServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String URI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String realPath = URI.substring(ctxPath.length());
		System.out.println(realPath);

		if (realPath.contentEquals("/take.challenge")) {
			try {
				ArrayList<ChallengeDTO> list = ChallengeDAO.getInstance().selectAll("take");
				ArrayList<ChallengeDTO> exlist = ChallengeDAO.getInstance().getCatergoryChallege("take", "운동");
				ArrayList<ChallengeDTO> lifelist = ChallengeDAO.getInstance().getCatergoryChallege("take", "생활");
				ArrayList<ChallengeDTO> studylist = ChallengeDAO.getInstance().getCatergoryChallege("take", "공부");
				ArrayList<ChallengeDTO> healthlist = ChallengeDAO.getInstance().getCatergoryChallege("take", "건강");
		
				request.setAttribute("list", list);
				request.setAttribute("exlist", exlist);
				request.setAttribute("lifelist", lifelist);
				request.setAttribute("studylist", studylist);
				request.setAttribute("healthlist", healthlist);
				RequestDispatcher rd = request.getRequestDispatcher("Main/takeMain.jsp");
				rd.forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if (realPath.contentEquals("/donation.challenge")) {

			try {
				ArrayList<ChallengeDTO> list = ChallengeDAO.getInstance().selectAll("give");
				ArrayList<ChallengeDTO> exlist = ChallengeDAO.getInstance().getCatergoryChallege("give", "운동");
				ArrayList<ChallengeDTO> lifelist = ChallengeDAO.getInstance().getCatergoryChallege("give", "생활");
				ArrayList<ChallengeDTO> studylist = ChallengeDAO.getInstance().getCatergoryChallege("give", "공부");
				ArrayList<ChallengeDTO> healthlist = ChallengeDAO.getInstance().getCatergoryChallege("give", "건강");
				request.setAttribute("healthlist", healthlist);
				request.setAttribute("studylist", studylist);
				request.setAttribute("lifelist", lifelist);
				request.setAttribute("exlist", exlist);
				request.setAttribute("list", list);
				request.getRequestDispatcher("Main/donateMain.jsp").forward(request, response);
			} catch (Exception e) {
				System.out.println("djdkd");
				e.printStackTrace();

			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
