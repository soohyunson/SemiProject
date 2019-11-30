package Controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import DAO.MemberDAO;
import DAO.PayDAO;
import DAO.PaymentDAO;
import DTO.MemberDTO;
import DTO.PayDTO;
import DTO.PaymentDTO;
import bootpay.Payment;


@WebServlet("*.pay")
public class PayMentServelt extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rootURL = request.getContextPath();
		String realURL = request.getRequestURI();
		String URL = realURL.replace(rootURL, "");

		System.out.println(URL);
		System.out.println(realURL);
		if(URL.equals("/payCheck.pay")) {
			//결제 검증용 
			String receipt_Id =  request.getParameter("receipt_id"); //영수증
			String result = Payment.getInstance().goVerfity(receipt_Id); //검증결과
			System.out.println("영수증 " + receipt_Id);
			System.out.println("검증 결과 " + result);

			//검증결과로 결제가 완료됬는지 여부 파악
			JsonParser parser = new JsonParser();
			JsonElement elemt = parser.parse(result);
			String status = elemt.getAsJsonObject().get("data").getAsJsonObject().get("status_ko").getAsString();

			if(status.equals("결제완료")) {
				try {
					System.out.println("결제 완료 검증 성공");
					String member_id = (String) request.getSession().getAttribute("id"); //사용자 id
					int bPoint = elemt.getAsJsonObject().get("data").getAsJsonObject().get("price").getAsInt(); //구매한 포인트
					//String order_id = elemt.getAsJsonObject().get("data").getAsJsonObject().get("order_id").getAsString(); //주문번호
					String company = elemt.getAsJsonObject().get("data").getAsJsonObject().get("method_name").getAsString(); //결제한 은행

					PaymentDTO dto = new PaymentDTO(0, bPoint, null, receipt_Id, company, member_id);
					int insertAll = PaymentDAO.getInstance().insertAll(dto);

					//현재 가지고 있는 포인트	
					//실패시 -1 출력
					int oPoint = MemberDAO.getInstance().selectByPoint(member_id);
					//현재 포인트와 구매포인트 합산
					int resultPoint = oPoint + bPoint; 
					int updateByPoint = MemberDAO.getInstance().updateByPoint(member_id, resultPoint);

					System.out.println("PaymentDAO 모든입력: " + insertAll);
					System.out.println("현재 포인트: " + oPoint);
					System.out.println("합산 포인트: " + resultPoint);
					System.out.println("member 입력: " + updateByPoint);

					request.setAttribute("url", realURL);
					request.getRequestDispatcher("/user/pay/close.jsp").forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		}else if(URL.equals("/payCancel.pay")) {
			try {
				//결제 취소
				String member_id = (String) request.getSession().getAttribute("id");
				int seq = Integer.parseInt(request.getParameter("seq"));
				PaymentDTO dto = PaymentDAO.getInstance().selectByreceipt_Id(member_id, seq);
				if(dto !=null) {
					String result = Payment.getInstance().goCancel(dto.getReceipt_id(), dto.getPoint());
					System.out.println(result);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}

		}else if(URL.equals("/charge.pay")) {
			//포인트 충전
			try {
				String id = (String) request.getSession().getAttribute("id");
				MemberDTO MemberDTO = MemberDAO.getInstance().select(id);
				request.setAttribute("dto", MemberDTO);

				//영수증 ID 
				//사용자ID_날짜_시간_구매한포인트
				Date date = new Date();
				SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd_kkmmss"); 
				request.setAttribute("order_id", format.format(date).toString());

				request.getRequestDispatcher("/user/pay/charge.jsp").forward(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}

		}else if(URL.equals("/refunds.pay")) {
			//아이디 불러옴
			//String id = (String) request.getSession().getAttribute("");
			request.getRequestDispatcher("/user/pay/refunds.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
