package admin.sever.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.ChallengeDAO;
import DAO.ChallengeRecordDAO;
import DTO.ChallengeDTO;
import DTO.Challenge_recordDTO;
import adminboardCongiuration.Configuration;

@WebServlet("*.adboard")
public class AdminBoardServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String projectPath = request.getContextPath();

		String realPath = uri.substring(projectPath.length());
		System.out.println("요청된 경로는 : " + realPath + "입니다.");

		if (realPath.contentEquals("/detail.adboard")) {
			int seq = Integer.parseInt(request.getParameter("seq"));

			ChallengeDTO dto = new ChallengeDTO();

			try {
				dto = ChallengeDAO.getInstance().getChallenge(seq);

				ArrayList<Challenge_recordDTO> list = new ArrayList<>();

				list = ChallengeRecordDAO.getInstance().getParticipate(seq);

				request.setAttribute("recordList", list);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("test.jsp").forward(request, response);

			} catch (Exception e) {
				System.out.println("nonono~~!!");

				e.printStackTrace();
			}

		} else if (realPath.contentEquals("/succesCheck.adboard")) {
			String[] check = request.getParameterValues("succesCheck");
			int seq = Integer.parseInt(request.getParameter("seq"));

			System.out.println(seq);
			for (int i = 0; i < check.length; i++) {
				System.out.println(check[i]);
			}

			ArrayList<Challenge_recordDTO> list = new ArrayList<>();

			try {
				list = ChallengeRecordDAO.getInstance().getParticipate(2);

				for (Challenge_recordDTO dto : list) {
					for (int i = 0; i < check.length; i++) {
						if (dto.getMember_id().contentEquals(check[i])) {
							int result = ChallengeRecordDAO.getInstance().successUpdate(dto.getSeq());
							System.out.println(result);
						}
					}
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (realPath.contentEquals("/list.adboard")) {
			int currentPage = 0;
			String CPage = request.getParameter("currentPage");
			System.out.println("cpage : " + CPage);
			if (CPage == null) {
				try {
					currentPage = 1;
					String page = ChallengeDAO.getInstance().getPageNavi(1);
					int start = currentPage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage - 1);
					int end = currentPage * Configuration.recordCountPerPage;

					System.out.println();
					List<ChallengeDTO> dto = ChallengeDAO.getInstance().selectByPage(start, end);

					System.out.println(dto.size());

					request.setAttribute("page", page);
					request.setAttribute("dto", dto);
					request.getRequestDispatcher("admin/adminChallengeList.jsp").forward(request, response);

				} catch (Exception e) {
					e.printStackTrace();
					// response.sendRedirect("error.jsp");
				}
			} else {
				try {
					currentPage = Integer.parseInt(CPage);
					String page = ChallengeDAO.getInstance().getPageNavi(currentPage);

					int start = currentPage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage - 1);
					int end = currentPage * Configuration.recordCountPerPage;
					List<ChallengeDTO> dto = ChallengeDAO.getInstance().selectByPage(start, end);
					request.setAttribute("page", page);
					request.setAttribute("dto", dto);
					request.getRequestDispatcher("admin/adminChallengeList.jsp").forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
					response.sendRedirect("error.jsp");
				}
			}
		} else if (realPath.contentEquals("/write.adboard")) {
			String uploadPath = request.getServletContext().getRealPath("/files");
			File uploadFilePath = new File(uploadPath);
			System.out.println(uploadPath);
			System.out.println(uploadFilePath);
			if (!uploadFilePath.exists()) {
				uploadFilePath.mkdir();

			}
			try {
				int maxSize = 1024 * 1024 * 10; // 10mb 까지 용량제한

				MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF8",
						new DefaultFileRenamePolicy());

				// String name = multi.getParameter("file1");//파일 가져와라
				String fileName = multi.getFilesystemName("file1"); // 업로드되는 파일의 이름이 뭐냐
				String oriFileName = multi.getOriginalFileName("file1"); // 업로드 할 때 당시의 파일의 원래 이름이 뭐냐
				List<ChallengeDTO> list = ChallengeDAO.getInstance().getInstance().selectAll();
				// FilesDTO dto2 = new
				// FilesDTO(0,list.get(list.size()-1).getSeq()+1,fileName,oriFileName);
				// int result2 = FilesDAO.getInstance().insert(dto2);

				// seq
				String title = multi.getParameter("title");
				String contents = multi.getParameter("content");
				// String writer = (String)request.getSession().getAttribute("loginInfo");
				String start_date = multi.getParameter("startdate");
				String end_date = multi.getParameter("enddate");

				String giveortake = multi.getParameter("giveortake");
				String category = multi.getParameter("category");

				System.out.println(title);
				System.out.println(contents);

				ChallengeDTO dto = new ChallengeDTO(0, title, contents, start_date, end_date, "N", 0, oriFileName,
						giveortake, category, 10000, 10000);

					int result = ChallengeDAO.getInstance().insertWrite(dto);
					System.out.println(result);

					response.sendRedirect("list.adboard");
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.jsp");
			}

		}else if (realPath.contentEquals("/memberlist.adboard")) {

			String id = request.getParameter("id");
			//int seq = Integer.parseInt(request.getParameter("seq"));

			System.out.println("넘어온 아이디 값은 : " + id);
			Challenge_recordDTO recoardDTO = new Challenge_recordDTO();
			ChallengeDTO challengeDTO = new ChallengeDTO();
			try {
				//recoardDTO = ChallengeRecordDAO.getInstance().detailChallenge(id, seq); //참여한 챌린지의 seq얻음

				request.setAttribute("recoardDTO", recoardDTO);

				request.getRequestDispatcher("/admin/detailmemberlist.jsp").forward(request, response);

			} catch (Exception e) {
				System.out.println("ㅇ기 에러났어요~~!!!!!!: :::::");
				e.printStackTrace();
			}
		}
		else if(realPath.contentEquals("/searchList.adboard")) {
			request.setCharacterEncoding("utf8");
			String search = request.getParameter("search");
			String oldsearch = "%"+search+"%";
			System.out.println(oldsearch);

			int currentPage = 0;
			String CPage = request.getParameter("currentPage");
			System.out.println("cpage : " + CPage);
			if (CPage == null) {
				try {
					currentPage = 1;
					String page = ChallengeDAO.getInstance().getPageNavi2(1,search);
					int start = currentPage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage - 1);
					int end = currentPage * Configuration.recordCountPerPage;

					System.out.println();
					List<ChallengeDTO> dto = ChallengeDAO.getInstance().selectByPagesearch(start, end, oldsearch);

					System.out.println(dto.size());

					request.setAttribute("page", page);
					request.setAttribute("dto", dto);
					request.getRequestDispatcher("admin/adminChallengeList.jsp").forward(request, response);

				}catch(Exception e) {
					e.printStackTrace();
					//response.sendRedirect("error.jsp");
				}
			}
			else {
				try {
					currentPage = Integer.parseInt(CPage);
					String page = ChallengeDAO.getInstance().getPageNavi2(currentPage,search);

					int start = currentPage * Configuration.recordCountPerPage - (Configuration.recordCountPerPage-1); 
					int end = currentPage * Configuration.recordCountPerPage;
					List<ChallengeDTO> dto =  ChallengeDAO.getInstance().selectByPagesearch(start, end,oldsearch);
					request.setAttribute("page", page);
					request.setAttribute("dto", dto);
					request.getRequestDispatcher("admin/adminChallengeList.jsp").forward(request, response);
				}catch(Exception e) {
					e.printStackTrace();
					response.sendRedirect("error.jsp");
				}
			}
		}
		else if(realPath.contentEquals("/modify.adboard")) {
			try {
				int seq = Integer.parseInt(request.getParameter("seq"));
				ChallengeDTO dto = ChallengeDAO.getInstance().getChallenge(seq);
				List<Challenge_recordDTO> list = ChallengeRecordDAO.getInstance().selectAll(seq);
				System.out.println(dto.getTitle());
				request.setAttribute("challenge", dto);
				request.setAttribute("record", list);
				request.getRequestDispatcher("admin/DetailManage.jsp").forward(request, response);
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.jsp");
			}
		}else if(realPath.contentEquals("/delete.adboard")) {
			String seq = request.getParameter("seq");

			System.out.println(seq);
			int seq2 = Integer.parseInt(seq);
			try {
				int cresult = ChallengeDAO.getInstance().delete(seq2);

				int rresult = ChallengeRecordDAO.getInstance().deleteByChall(seq2);

				response.sendRedirect("list.adboard");
			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.jsp");

			}
		}else if(realPath.contentEquals("/update.adboard")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			String uploadPath = request.getServletContext().getRealPath("/files");
			File uploadFilePath = new File(uploadPath);
			System.out.println(uploadPath);
			System.out.println(uploadFilePath);
			if (!uploadFilePath.exists()) {
				uploadFilePath.mkdir();

			}
			try {
				int maxSize = 1024 * 1024 * 10; // 10mb 까지 용량제한

				MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF8",
						new DefaultFileRenamePolicy());

				// String name = multi.getParameter("file1");//파일 가져와라
				String fileName = multi.getFilesystemName("file1"); // 업로드되는 파일의 이름이 뭐냐
				String oriFileName = multi.getOriginalFileName("file1"); // 업로드 할 때 당시의 파일의 원래 이름이 뭐냐
				List<ChallengeDTO> list = ChallengeDAO.getInstance().selectAll();
				// FilesDTO dto2 = new
				// FilesDTO(0,list.get(list.size()-1).getSeq()+1,fileName,oriFileName);
				// int result2 = FilesDAO.getInstance().insert(dto2);

				// seq
				String title = multi.getParameter("title");
				String contents = multi.getParameter("content");
				// String writer = (String)request.getSession().getAttribute("loginInfo");
				String start_date = multi.getParameter("startdate");
				String end_date = multi.getParameter("enddate");
				String end = multi.getParameter("end");
				String giveortake = multi.getParameter("giveortake");
				String category = multi.getParameter("category");

				System.out.println(start_date);
				System.out.println(end_date);
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				SimpleDateFormat mat = new SimpleDateFormat("yyyy-MM-dd");

				String startdt = mat.format(format.parse(start_date));
				String enddt = mat.format(format.parse(end_date));

				System.out.println(title);
				System.out.println(contents);
				System.out.println(startdt);
				System.out.println(enddt);
				ChallengeDTO dto = new ChallengeDTO(0,title,contents,startdt,enddt,end,0,oriFileName,giveortake,category,10000,10000);

				try {
					int result = ChallengeDAO.getInstance().update(dto, seq);

					System.out.println(result);

					response.sendRedirect("list.adboard");
				} catch (Exception e) {
					e.printStackTrace();
				}
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.jsp");
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
