package user.server.controller;

import java.awt.print.Printable;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import DAO.FileListDAO;
import DTO.File_ListDTO;

@WebServlet("*.file")
public class fileServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf8");
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());

		System.out.println(cmd);
		if (cmd.contentEquals("/confirm.file")) {
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
				// int seq = Integer.parseInt(multi.getParameter("seq"));

				// System.out.println(seq);
				String fileName = multi.getFilesystemName("fileImg"); // 업로드되는 파일의 이름이 뭐냐
				String oriFileName = multi.getOriginalFileName("fileImg"); // 업로드 할 때 당시의 파일의 원래 이름이 뭐냐

				System.out.println(fileName);
				System.out.println(oriFileName);
				// response.getWriter().append("works done");

				// int result = FilesDAO.getInstance().insert(dto);

				String resPath = "files/";
				resPath += fileName;
				System.out.println(resPath);
				File_ListDTO dto = new File_ListDTO(0, fileName, resPath, oriFileName, null, 14);

				int result = FileListDAO.getInstance().insert(dto);
				System.out.println("파일이 업로드 된 경로 : " + resPath);

				if (result > 0) {

					JsonObject obj = new JsonObject();
					obj.addProperty("url", resPath);

					Thread.sleep(1000);
					Gson g = new Gson();

					response.reset();

					// response에 담을 데이터 타입 형태
					// 파일 전송시 : application/octet-stream
					response.setContentType("application/octet-stream");

					// 파일 이름을 인코딩 변경
					String encFileName = new String(fileName.getBytes("utf8"), "iso-8859-1");
					// response의 header에 파일 이름과 파일 크기
					// .setHeader("Content-Disposltion", "attachment; filename=인코딩한파일이름");
					// .setHeader("Content-Lenth", 파일크기를String형으로);
//					response.setHeader("Content-Disposition", "attachment; filename=\"" + encFileName + "\"");
//					response.setHeader("Content-Lenth", String.valueOf(f.length()));

					String gson = new Gson().toJson(resPath);
					System.out.println(gson);
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().append(gson);
//					File f = new File(uploadPath + "\\" +fileName);
//
//					try (
//							FileInputStream fis = new FileInputStream(f);
//							DataInputStream fileDis = new DataInputStream(fis);
//							ServletOutputStream sos = response.getOutputStream();
//							){
//
//						byte[] fileContents = new byte[(int) f.length()];
//						fileDis.readFully(fileContents);
//						fileDis.close();
//						// response에 담을 데이터 타입 형태
//						// 파일 전송시 : application/octet-stream
//						response.setContentType("application/octet-stream");
//
//						// 파일 이름을 인코딩 변경
//						String encFileName = new String(fileName.getBytes("utf8"), "iso-8859-1");
//						// response의 header에 파일 이름과 파일 크기
//						// .setHeader("Content-Disposltion", "attachment; filename=인코딩한파일이름");
//						// .setHeader("Content-Lenth", 파일크기를String형으로);
//						response.setHeader("Content-Disposition", "attachment; filename=\"" + encFileName + "\"");
//						response.setHeader("Content-Lenth", String.valueOf(f.length()));
//
//						sos.write(fileContents);
//						sos.flush();
//
//					}

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
