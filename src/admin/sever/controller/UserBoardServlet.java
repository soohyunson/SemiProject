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

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import DAO.ChallengeDAO;
import DAO.ChallengeRecordDAO;
import DAO.FileListDAO;
import DAO.MemberDAO;
import DTO.ChallengeDTO;
import DTO.Challenge_recordDTO;
import DTO.File_ListDTO;
import DTO.MemberDTO;


@WebServlet("*.usboard")
public class UserBoardServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StringBuffer url = request.getRequestURL();
		String uri = request.getRequestURI();
		String projectPath = request.getContextPath();
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

		} else if (realPath.contentEquals("/fromList.usboard")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			ChallengeDTO detail = new ChallengeDTO();
			try {
				detail = ChallengeDAO.getInstance().getChallenge(seq);
				System.out.println(detail);
				String content = detail.getContent(); //content출력o
				String text = "{" + content + "}"; //json타입o
				System.out.println(text);
				JsonParser parser = new JsonParser();
				JsonElement data = parser.parse(text); //data출력o
				System.out.println(data);
				JsonObject obj = data.getAsJsonObject();
				System.out.println("obj : " + obj);
				String day = obj.get("인증가능요일").getAsString(); 
				String frequency = obj.get("인증빈도").getAsString();
				String time = obj.get("인증가능시간").getAsString();
				String number = obj.get("하루인증횟수").getAsString(); //출력o
				System.out.println(day + " : " + frequency + " : " + time + " : " + number);
				
				request.setAttribute("detailpage", detail);
				request.setAttribute("day", day);
				request.setAttribute("frequency", frequency);
				request.setAttribute("time", time);
				request.setAttribute("number", number);
				
				RequestDispatcher rd = request.getRequestDispatcher("user/detail.jsp");
				rd.forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if (realPath.contentEquals("/myPageDetailView.usboard")) {

			System.out.println("여기로 넘어 왔나욤???ㅎㅎㅎ");
			// int challengeNum = Integer.parseInt(request.getParameter("challengeSeq"));
			// int recordNum = Integer.parseInt(request.getParameter("recordSeq"));


			String id = (String) request.getSession().getAttribute("id");
			try {

				int recordNum = ChallengeRecordDAO.getInstance().selectSeq(16, "sky");

				// System.out.println(challengeNum + ":::::::::::::::" + recordNum);
				System.out.println("레코드 넘버 !! ::: " + recordNum);
				ChallengeDTO dto = ChallengeDAO.getInstance().getChallenge(16);

				System.out.println(dto.getStart_date());
				SimpleDateFormat yearFormat = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat dayFormat = new SimpleDateFormat("dd");
				SimpleDateFormat monthFormat = new SimpleDateFormat("MM");

				Date formatDate = yearFormat.parse(dto.getStart_date());
				String day = dayFormat.format(formatDate);
				String month = monthFormat.format(formatDate);

				List<File_ListDTO> fileList = new ArrayList<>();

				fileList = FileListDAO.getInstance().selectAll(recordNum);
				ArrayList<Integer> file_days = new ArrayList<>();

				int size = fileList.size();
				System.out.println(fileList.size());
				for (int i = 0; i < fileList.size(); i++) {
					Date fileDate = new SimpleDateFormat("yy/MM/dd").parse(fileList.get(i).getUpload_date());
					String fileday = dayFormat.format(fileDate);
					String fileMonth = monthFormat.format(fileDate);
					System.out.println(fileday + "일 " + fileMonth + " 월");

					int startDay = Integer.parseInt(day);
					int uploadDay = Integer.parseInt(fileday);

					if (!month.equals(fileMonth)) {
						int resultDay = (30 - startDay) + uploadDay;
						fileList.get(i).setDay(resultDay);
						file_days.add(resultDay);
						System.out.println("으아아아아앙 ::" + resultDay);

					} else {
						int resultDay = uploadDay - startDay;
						fileList.get(i).setDay(resultDay);
						file_days.add(resultDay);
						System.out.println("뭐야야야야ㅑ양 ::" + resultDay);

					}
				}

				System.out.println("날짜 사이즈 : "+file_days.size());
				System.out.println("파일 사이즈 : "+fileList.size());
				
				for(int i =0;i<file_days.size();i++) {
					System.out.println(file_days.get(i));
				}
				System.out.println(day);
				System.out.println(month);

				if (size == 0) {
					System.out.println("null로 넘어가기");

					request.setAttribute("day", day);
					request.setAttribute("month", month);
					request.setAttribute("recordNum", recordNum);
					request.setAttribute("dto", dto);

					request.getRequestDispatcher("UserTestNotNotNOt/null_detail.jsp").forward(request, response);

				} else {
					System.out.println("null이 아닌 곳으로 넘어가기");
					request.setAttribute("size", size);
					request.setAttribute("file_days", file_days);
					request.setAttribute("fileList", fileList);
					request.setAttribute("day", day);
					request.setAttribute("month", month);
					request.setAttribute("recordNum", recordNum);
					request.setAttribute("dto", dto);

					request.getRequestDispatcher("UserTestNotNotNOt/detail.jsp").forward(request, response);

				}

			} catch (Exception e) {
				System.out.println("오류났어요!!오류오류");
				e.printStackTrace();
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
