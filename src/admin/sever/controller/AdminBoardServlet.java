package admin.sever.controller;

import java.io.File;
import java.io.IOException;
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
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		String projectPath = request.getContextPath();

		String realPath = uri.substring(projectPath.length());

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
				System.out.println("ç���� �������� ����~~!!");
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
					List<ChallengeDTO> dto = ChallengeDAO.getInstance().selectByPage(start, end);
					request.setAttribute("page", page);
					request.setAttribute("dto", dto);
					request.getRequestDispatcher("adminChallenge/adminChallengeList.jsp").forward(request, response);
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
					request.getRequestDispatcher("adminChallenge/adminChallengeList.jsp").forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
					response.sendRedirect("error.jsp");
				}
			}
		} else if (realPath.contentEquals("/write.adboard")) {
			String uploadPath = request.getServletContext().getRealPath("/files");
			String uploadPath2 = "D:\\semi_workspace\\SemiProject\\WebContent\\files";
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

				String respPath = "files/";
				respPath+=fileName;
				System.out.println(respPath);
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

				ChallengeDTO dto = new ChallengeDTO(0, title, contents, start_date, end_date, "N", 0, respPath,giveortake,category);
				try {
					int result = ChallengeDAO.getInstance().insertWrite(dto);
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
