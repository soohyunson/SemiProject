package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.MemberDAO;
import DTO.MemberDTO;

@WebServlet("*.mem")
public class member extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String URI = request.getRequestURI();
		String ctx = request.getContextPath();
		String realPath = URI.substring(ctx.length());

		MemberDAO dao = MemberDAO.getInstance();
		System.out.println(realPath);
		

		if (realPath.contentEquals("/login/login.mem")) {
			try {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				System.out.println(id + " : " + pw);
				boolean loginResult = dao.isLoginOK(id, dao.encrypt(pw));
				
				request.getSession().setAttribute("loginResult", loginResult);
				request.getSession().setAttribute("id", id);
				request.getRequestDispatcher("logincheck.jsp").forward(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (realPath.contentEquals("/login/idcheck.mem")) {
			try {
				String id = request.getParameter("id");
				//id 받아오기 ok
				boolean result = dao.isIdOk(id);
				PrintWriter pw = response.getWriter();
				pw.append("{\"result\" :" + result + "}");

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (realPath.contentEquals("/login/signup.mem")) {
			request.setCharacterEncoding("utf8");
			try {
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				dao.insert(new MemberDTO(0, id, pw, name, phone, email, 0, null));
				response.sendRedirect("signupcheck.jsp");

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
			else if(realPath.contentEquals("/adminChallenge/memberlist.mem")) { //멤버리스트 클릭했을때 주소받아오기
				request.setCharacterEncoding("utf8");
				try {
					String navi = dao.getPageNavi(1);
					int cpage = 1;
					String page = request.getParameter("cpage");
					if(page != null) {
						cpage = Integer.parseInt(page);
					}
					int start = cpage * configuration.Configuration.recordCountPerPage - (configuration.Configuration.recordCountPerPage -1 );
					int end = cpage * configuration.Configuration.recordCountPerPage;
					System.out.println(start + " : " + end);
					List<MemberDTO> list = dao.selectByPage(start, end);
//					List<MemberDTO> list = dao.selectAll();
					request.setAttribute("list", list);
					request.setAttribute("navi", navi);
					request.getRequestDispatcher("../memberlist.jsp").forward(request, response);
					
					
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(realPath.contentEquals("/adminChallenge/search.mem")) {
				try {
				String id = request.getParameter("search");
				System.out.println(id); 
				List<MemberDTO> dto = dao.search(id);
//				System.out.println(dto.getId() + " : " + dto.getName()); ok
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("../memberlist.jsp").forward(request, response);
				
				}catch(Exception e) {
					e.printStackTrace();
				}
			}else if(realPath.contentEquals("/Main/logout.mem")) {
				request.getSession().invalidate();
				response.sendRedirect("../index.jsp");
			}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
