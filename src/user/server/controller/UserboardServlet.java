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

			// String id = (String) request.getSession().getAttribute("id");
			// int seq = Integer.parseInt(request.getParameter("seq"));

			try {
				Challenge_recordDTO dto = new Challenge_recordDTO();

				dto = ChallengeRecordDAO.getInstance().detailChallenge("sky", 16);
				int num = dto.getChallenge_num();

				System.out.println(num);

				ChallengeDTO challengeDto = new ChallengeDTO();
				challengeDto = ChallengeDAO.getInstance().getChallenge(num);

				System.out.println();

				System.out.println(challengeDto.getStart_date());

				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				
				System.out.println(format.parse(challengeDto.getStart_date()));
				Date date=format.parse(challengeDto.getStart_date());
				String month_day = new SimpleDateFormat("MM").format(date);
				String day=new SimpleDateFormat("dd").format(date);
				System.out.println(month_day);
				System.out.println(day);
				
					
				request.setAttribute("day", day);
				request.setAttribute("month", month_day);
				request.setAttribute("RecordDTO", dto);
				request.setAttribute("challengeDTO", challengeDto);
				request.getRequestDispatcher("/UserTestNotNotNOt/detailTest.jsp").forward(request, response);

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
