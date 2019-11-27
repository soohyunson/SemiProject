package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberDAO;
import DTO.MemberDTO;

@WebServlet("*.mem")
public class member extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String URI = request.getRequestURI();
		String ctx = request.getContextPath();
		String realPath = URI.substring(ctx.length());
		
		MemberDAO dao = MemberDAO.getInstance();
		
		if(realPath.contentEquals("/login.mem")) {
			try {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			//id, pw 넘어오는거 ok
			boolean loginResult = dao.isLoginOK(id, dao.encrypt(pw));
			
			request.getSession().setAttribute("loginResult", loginResult);
			request.getSession().setAttribute("id", id);
			request.getRequestDispatcher("logincheck.jsp").forward(request, response);
			
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if(realPath.contentEquals("/idcheck.mem")) {
			try {
			String id = request.getParameter("id");
			//id 받아오기 ok
			boolean result = dao.isIdOk(id);
			PrintWriter pw = response.getWriter();
			pw.append("{\"result\" :" + result + "}");
			
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}else if(realPath.contentEquals("/signup.mem")) {
			request.setCharacterEncoding("utf8");
			try {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");

				dao.insert(new MemberDTO(id, pw, name, phone, email, 0, null));
				response.sendRedirect("realmain.jsp");
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
