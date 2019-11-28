package user.server.controller;

import java.awt.print.Printable;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

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

				String fileName = multi.getFilesystemName("fileImg"); // 업로드되는 파일의 이름이 뭐냐
				String oriFileName = multi.getOriginalFileName("fileImg"); // 업로드 할 때 당시의 파일의 원래 이름이 뭐냐

				
				
				System.out.println(fileName);
				System.out.println(oriFileName);
	
				
				int recordNum = Integer.parseInt(multi.getParameter("recordNum"));
			

				String resPath = "files/";
				resPath += fileName;
				System.out.println(resPath);
				String date = new SimpleDateFormat("yy/MM/dd").format(System.currentTimeMillis());

				
				File_ListDTO dto = new File_ListDTO(0, fileName, resPath, oriFileName, date, recordNum);

				int result = 0;

				System.out.println("디비 입력!");
				try {
					result = FileListDAO.getInstance().insert(dto);
					System.out.println("파일이 업로드 된 경로 : " + resPath);
					System.out.println(result);
				} catch (Exception e) {
					int seq = FileListDAO.getInstance().getSeq();
					System.out.println(seq);
					result = FileListDAO.getInstance().update(seq, dto);
					
					System.out.println(result);
				}

				if (result > 0) {

					JsonObject obj = new JsonObject();
					obj.addProperty("url", resPath);

					Gson g = new Gson();

					response.reset();

					// response에 담을 데이터 타입 형태
					// 파일 전송시 : application/octet-stream
					response.setContentType("application/octet-stream");

					// 파일 이름을 인코딩 변경
					String encFileName = new String(fileName.getBytes("utf8"), "iso-8859-1");

					String gson = new Gson().toJson(resPath);
					System.out.println(gson);
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().append(gson);

				}

			} catch (Exception e) {
				System.out.println("ㅈㅅㅈㅅㅈㅅㅈ :::: ");
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
