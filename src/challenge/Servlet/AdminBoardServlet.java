package challenge.Servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ChallengeDAO;
import DAO.ChallengeRecordDAO;
import DTO.ChallengeDTO;
import DTO.Challenge_recordDTO;


@WebServlet("*.adboard")
public class AdminBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String projectPath = request.getContextPath();
		
		String realPath = uri.substring(projectPath.length());
		
		if(realPath.contentEquals("/detail.adboard")) {
			//int seq = Integer.parseInt( request.getParameter("seq"));
			
			ChallengeDTO dto = new ChallengeDTO();
	
			
			try {
				dto = ChallengeDAO.getInstance().getChallenge(2);
				
				ArrayList<Challenge_recordDTO> list = new ArrayList<>();
				
				list = ChallengeRecordDAO.getInstance().getParticipate(2);
				
				request.setAttribute("recordList", list);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("test.jsp").forward(request, response);
				
		
				
			}catch(Exception e) {
				System.out.println("챌린지 가져오기 오류~~!!");
				e.printStackTrace();
			}
			
			
		}else if(realPath.contentEquals("/succesCheck.adboard")) {
			String[] check = request.getParameterValues("succesCheck");
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			System.out.println(seq);
			for(int i = 0; i<check.length;i++) {
				System.out.println(check[i]);
			}
			
			ArrayList<Challenge_recordDTO> list = new ArrayList<>();
			
			try {
				list = ChallengeRecordDAO.getInstance().getParticipate(2);
				
				for(Challenge_recordDTO dto : list) {
					for(int i = 0; i<check.length;i++) {
						if(dto.getMember_id().contentEquals(check[i])) {
							int result = ChallengeRecordDAO.getInstance().successUpdate(dto.getSeq());
							System.out.println(result);
						}
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
