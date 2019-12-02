package admin.sever.controller;

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


import DAO.ChallengeDAO;
import DAO.ChallengeRecordDAO;
import DAO.MemberDAO;
import DTO.ChallengeDTO;
import DTO.Challenge_recordDTO;
import DTO.MemberDTO;

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

			String id = (String) request.getSession().getAttribute("id");
			try {
				ArrayList<ChallengeDTO> list = new ArrayList<>();
				list = ChallengeDAO.getInstance().selectIdChallenge(id);
				ArrayList<ChallengeDTO> giveList = new ArrayList<>();
				ArrayList<ChallengeDTO> takeList = new ArrayList<>();
				System.out.println(id);
				MemberDTO dto = MemberDAO.getInstance().select(id);
				if (list.size() == 0) {
					giveList = null;
					takeList = null;
				} else {
					for (int i = 0; i < list.size(); i++) {
						if (list.get(i).getGiveortake().equals("give")) {
							giveList.add(list.get(i));
						} else {
							takeList.add(list.get(i));
						}

					}
				}

				System.out.println(giveList);
				System.out.println(takeList);
				
				request.setAttribute("giveList", giveList);
				request.setAttribute("takeList", takeList);
				request.setAttribute("dto", dto);
				
				request.getRequestDispatcher("user/userMyPage.jsp").forward(request, response);
			} catch (Exception e) {
				System.out.println("오류 났어요!!! 오류 확인해주세요!!");
				e.printStackTrace();

			}

//			System.out.println("여기까지는 왔어요");
//
//			try {
//
//				ArrayList<ChallengeDTO> list1 = new ArrayList<>();
//				ArrayList<ChallengeDTO> list2 = new ArrayList<>();
//				ArrayList<Challenge_recordDTO> record1 = new ArrayList<>();
//				ArrayList<Challenge_recordDTO> record2 = new ArrayList<>();
//				ChallengeDTO realdto = new ChallengeDTO();
//				
//				String id = (String)request.getSession().getAttribute("id");
//				List<Challenge_recordDTO> dto = ChallengeRecordDAO.getInstance().selectAll(id);
//				for (int i = 0; i < dto.size(); i++) {
//					System.out.println(dto.size());
//					System.out.println(dto.get(i).getChallenge_num());
//					realdto = ChallengeDAO.getInstance().getChallenge(dto.get(i).getChallenge_num());
//					System.out.println(realdto.getGiveortake());
//                      String give = "give";
//                      String take = "take";
//					if (realdto.getGiveortake().equalsIgnoreCase(give)) {
//						record1.add(dto.get(i));
//						list1.add(realdto);
//					} else if(realdto.getGiveortake().equalsIgnoreCase(take)){
//						record2.add(dto.get(i));
//						list2.add(realdto);
//					}else if(realdto.getGiveortake()==null) {
//						record2.add(dto.get(i));
//						list2.add(realdto);
//					}
//					else {
//						record2.add(dto.get(i));
//						list2.add(realdto);
//					}
//				}
//				System.out.println("## : " + record1.size());
//				System.out.println("## : " + record2.size());
//				System.out.println("## : " + list1.size());
//				System.out.println("## : " +  list2.size());
//				request.setAttribute("giverecord", record1);
//				request.setAttribute("takerecord", record2);
//				request.setAttribute("givedetail", list1);
//				request.setAttribute("takedetail", list2);
//				request.getRequestDispatcher("user/userMyPage.jsp").forward(request, response);
//
//			} catch (Exception e) {
//				System.out.println("오류다~~!!");
//				e.printStackTrace();
//			}

		} else if (realPath.contentEquals("/fromList.usboard")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			String id = (String) request.getSession().getAttribute("id");
			ChallengeDTO detail = new ChallengeDTO();	
			try {

				detail = ChallengeDAO.getInstance().getChallenge(seq);
				boolean isChallengeById = ChallengeRecordDAO.getInstance().idCompare(id, seq); //챌린지에 참가하고 있는가?
				System.out.println(isChallengeById);
				request.setAttribute("isChallengeById", isChallengeById);
				request.setAttribute("detailpage", detail);
				RequestDispatcher rd = request.getRequestDispatcher("user/detail.jsp");
				rd.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}


		} else if (realPath.contentEquals("/myPageDetailView.usboard")) {

			System.out.println("여기로 넘어 왔나욤???ㅎㅎㅎ");
			int challengeNum = Integer.parseInt(request.getParameter("challengeSeq"));
			// int recordNum = Integer.parseInt(request.getParameter("recordSeq"));


			String id = (String) request.getSession().getAttribute("id");
			try {

				int recordNum = ChallengeRecordDAO.getInstance().selectSeq(challengeNum, id);

				System.out.println(challengeNum + ":::::::::::::::" + recordNum);
				ChallengeDTO dto = ChallengeDAO.getInstance().getChallenge(challengeNum);

				System.out.println(dto.getStart_date());
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date formatDate = format.parse(dto.getStart_date());
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

		}else if(realPath.contentEquals("/terms.usboard")) {
			int challengeSeq = Integer.parseInt(request.getParameter("seq"));
			String id = request.getParameter("id");
			System.out.println(id);
			System.out.println(challengeSeq);
			ChallengeDTO dto = new ChallengeDTO();
			MemberDTO mdto = new MemberDTO();
			Challenge_recordDTO cdto = new Challenge_recordDTO();
			System.out.println("예스");
			try {				
				boolean idCompare = ChallengeRecordDAO.getInstance().idCompare(id, challengeSeq);
				if(idCompare == true) {
					System.out.println("중복확인");
					String giveOrTake = ChallengeDAO.getInstance().getChallenge(challengeSeq).getGiveortake();
					request.setAttribute("giveOrTake", giveOrTake);
					RequestDispatcher rd = request.getRequestDispatcher("user/challengeOverLap.jsp");
					rd.forward(request, response);
				}else {
					System.out.println("노중복");
					dto = ChallengeDAO.getInstance().getChallenge(challengeSeq);
					mdto = MemberDAO.getInstance().select(id);
					System.out.println(dto.getPp_point());
					System.out.println(mdto.getPoint());
					request.setAttribute("challenge", dto);
					request.setAttribute("userId", mdto);
					RequestDispatcher rd = request.getRequestDispatcher("user/bill.jsp");
					rd.forward(request, response);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(realPath.contentEquals("/participation.usboard")) {
			int challengeSeq = Integer.parseInt(request.getParameter("seq"));
			int challengePoint = Integer.parseInt(request.getParameter("pp_point"));
			String userId = request.getParameter("userId");
			int userPoint = Integer.parseInt(request.getParameter("userPoint"));
			ChallengeDAO dao = ChallengeDAO.getInstance();
			MemberDAO mdao = MemberDAO.getInstance();
			ChallengeRecordDAO cdao = ChallengeRecordDAO.getInstance();
			try {
				//챌린지 참여포인트증가
				int result = dao.updateTotalAmount(userPoint, challengeSeq);
				//챌린지 참여인원증가
				int result2 = dao.updateTotalParticipate(challengeSeq);
				//참여한 챌린지의 참여포인트만큼 유저포인트감소 
				int result3 = mdao.updatePoint(challengePoint, userId);
				//참여한 챌린지의 유저의 아이디를 저장
				int result4 = cdao.challengeParticipate(challengeSeq, userId);
				System.out.println(result);
				System.out.println(result);
				System.out.println(result2);
				System.out.println(result4);
				response.sendRedirect("fromList.usboard?seq="+challengeSeq);
			} catch (Exception e) {
				e.printStackTrace();
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
