package user.server.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.file")
public class fileServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf8");
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());
		if (cmd.contentEquals("/confirm.file")) {
			try {
				List<FilesDTO> list = FilesDAO.getInstance().getAllFiles();
				request.setAttribute("list", list);

				request.getRequestDispatcher("list.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("error.jsp");
			}
		} else if (cmd.contentEquals("/upload.file")) {
			String uploadPath = request.getServletContext().getRealPath("/files");
			File uploadFilePath = new File(uploadPath);
			System.out.println(uploadPath);
			if (!uploadFilePath.exists()) {
				uploadFilePath.mkdir();

			}
			try {
				int maxSize = 1024 * 1024 * 10; // 10mb 까지 용량제한

				MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF8",
						new DefaultFileRenamePolicy());

				// String name = multi.getParameter("file1");//파일 가져와라
				String fileName = multi.getFilesystemName("img"); // 업로드되는 파일의 이름이 뭐냐
				String oriFileName = multi.getOriginalFileName("img"); // 업로드 할 때 당시의 파일의 원래 이름이 뭐냐

				System.out.println(fileName);
				System.out.println(oriFileName);
				// response.getWriter().append("works done");

				FilesDTO dto = new FilesDTO(0, 1, fileName, oriFileName);
				int result = FilesDAO.getInstance().insert(dto);

				String resPath = "files/";
				resPath += fileName;

				System.out.println("파일이 업로드 된 경로 : " + resPath);

				JsonObject obj = new JsonObject();
				obj.addProperty("url", resPath);

				Gson g = new Gson();
				response.getWriter().append(obj.toString());

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
