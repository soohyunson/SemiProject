package mainTestServer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ChallengeDAO;
import DTO.ChallengeDTO;

@WebServlet("*.bo")
public class mainServer extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String path = request.getContextPath();

		String realPath = uri.substring(path.length());

		if (realPath.contentEquals("/donation.bo")) {

			try {
				ArrayList<ChallengeDTO> list = ChallengeDAO.getInstance().selectAll("give");

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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
