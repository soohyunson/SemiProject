package user.server.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ChallengeDAO;
import DAO.ChallengeRecordDAO;
import DTO.ChallengeDTO;
import DTO.Challenge_recordDTO;

@WebServlet("*.board")
public class UserboardServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();
		String path = request.getContextPath();

		String realPath = uri.substring(path.length());

		if (realPath.contentEquals("/detail.board")) {

			String id = (String) request.getSession().getAttribute("id");
			int seq = Integer.parseInt(request.getParameter("seq"));

			try {
				Challenge_recordDTO dto = new Challenge_recordDTO();

				dto = ChallengeRecordDAO.getInstance().detailChallenge(id, seq);
				int num = dto.getChallenge_num();
				ChallengeDTO challengeDto = new ChallengeDTO();
				challengeDto = ChallengeDAO.getInstance().getChallenge(num);

				request.setAttribute("RecordDTO", dto);
				request.setAttribute("challengeDTO", challengeDto);
				request.getRequestDispatcher(path+"/usertestNotNotNOt/detail.jsp").forward(request, response);

			} catch (Exception e) {
				System.out.println("데이터 가져오기 오류~~!~~!");
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
