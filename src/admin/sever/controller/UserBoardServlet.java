package admin.sever.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.AbstractDocument.Content;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.ChallengeDAO;
import DAO.ChallengeRecordDAO;
import DTO.ChallengeDTO;
import DTO.Challenge_recordDTO;
import adminboardCongiuration.Configuration;

@WebServlet("*.usboard")
public class UserBoardServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StringBuffer url = request.getRequestURL();
		String uri = request.getRequestURI();
		String projectPath = request.getContextPath();
//	System.out.println(url);
//	System.out.println(uri);
//	System.out.println(projectPath);
//	System.out.println();
		String realPath = uri.substring(projectPath.length());
		System.out.println(realPath);
		if (realPath.contentEquals("/banner.usboard")) {

			try {

				ArrayList<ChallengeDTO> list1 = new ArrayList<>();
				ArrayList<ChallengeDTO> list2 = new ArrayList<>();
				ArrayList<Challenge_recordDTO> record1 = new ArrayList<>();
				ArrayList<Challenge_recordDTO> record2 = new ArrayList<>();
				ChallengeDTO realdto = new ChallengeDTO();
				
				String id = request.getParameter("id");
				List<Challenge_recordDTO> dto = ChallengeRecordDAO.getInstance().selectAll("sky");
				for (int i = 0; i < dto.size(); i++) {
					System.out.println(dto.size());
					System.out.println(dto.get(i).getChallenge_num());
					realdto = ChallengeDAO.getInstance().getChallenge(dto.get(i).getChallenge_num());
					System.out.println(realdto.getGiveortake());
                      String give = "give";
                      String take = "take";
					if (realdto.getGiveortake().equalsIgnoreCase(give)) {
						record1.add(dto.get(i));
						list1.add(realdto);
					} else if(realdto.getGiveortake().equalsIgnoreCase(take)){
						record2.add(dto.get(i));
						list2.add(realdto);
					}else if(realdto.getGiveortake()==null) {
						record2.add(dto.get(i));
						list2.add(realdto);
					}
					else {
						record2.add(dto.get(i));
						list2.add(realdto);
					}
				}
				System.out.println("## : " + record1.size());
				System.out.println("## : " + record2.size());
				System.out.println("## : " + list1.size());
				System.out.println("## : " +  list2.size());
				request.setAttribute("giverecord", record1);
				request.setAttribute("takerecord", record2);
				request.setAttribute("givedetail", list1);
				request.setAttribute("takedetail", list2);
				request.getRequestDispatcher("jsp/userMyPage.jsp").forward(request, response);

			} catch (Exception e) {
				System.out.println("오류다~~!!");
				e.printStackTrace();
			}

		} else if (realPath.contentEquals("/fromList.usboard")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			ChallengeDTO detail = new ChallengeDTO();
			try {
				detail = ChallengeDAO.getInstance().getChallenge(seq);
				request.setAttribute("detailpage", detail);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/detail.jsp");
				rd.forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}else if (realPath.contentEquals("/myPageDetailView.usboard")) {
			
			System.out.println("여기로 넘어 왔나욤???ㅎㅎㅎ");
			int challengeNum = Integer.parseInt(request.getParameter("challengeSeq"));
			int recordNum = Integer.parseInt(request.getParameter("recordSeq"));
			
			System.out.println(challengeNum+":::::::::::::::"+recordNum);

			try {
				ChallengeDTO dto = ChallengeDAO.getInstance().getChallenge(challengeNum);

				
				System.out.println(dto.getStart_date());
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date formatDate=format.parse(dto.getStart_date());
				String day = new SimpleDateFormat("dd").format(formatDate);
				String month = new SimpleDateFormat("MM").format(formatDate);
				
				System.out.println(day);
				System.out.println(month);
				
				
				
				request.setAttribute("day", day);
				request.setAttribute("month", month);
				request.setAttribute("recordNum", recordNum);
				request.setAttribute("dto", dto);
				
				request.getRequestDispatcher("UserTestNotNotNOt/detail.jsp").forward(request, response);
			} catch (Exception e) {
				System.out.println("오류났어요!!오류오류");
			}

		}
		
//		else if(realPath.contentEquals("/myPageDetailView.usboard")) {
//			int challengeseq = Integer.parseInt(request.getParameter("seq"));
//			int recordseq = Integer.parseInt(request.getParameter("seq2"));
//			System.out.println(challengeseq);
//			System.out.println(recordseq);
//		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
