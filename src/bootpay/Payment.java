package bootpay;

import com.google.gson.Gson;

import bootpay.request.Cancel;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import java.util.Arrays;


public class Payment {
    static BootpayApi api;
    //public static void main(String[] args) {
//    	//REST Application ID, Private Key  - 고정값
//        api = new BootpayApi("5dd10c304f74b4002fc15ac4", "mMPuP5NSt3sZCwTmp3S2PNuE3hQ+rz63wCqOecefcTs=");
        //goGetToken(); //결제 검증용 토큰 얻기
        //goVerfity("5de20b1d5ade1600282b59b2");  //결제 검증
//        //goCancel();
//        //goSubscribeBilling();
//        //goRemoteForm();
    //}

    private static Payment instance;

	public synchronized static Payment getInstance() {
		if(instance == null) {
			instance = new Payment();
		}
		return instance;
	}
    
    public void goGetToken() {
    	//결제 검증용 토큰 얻기
    	api = new BootpayApi("5dd10c304f74b4002fc15ac4", "mMPuP5NSt3sZCwTmp3S2PNuE3hQ+rz63wCqOecefcTs=");
        try {
            api.getAccessToken();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String goVerfity(String receipt_id) {
    	//결제 검증
        try {
        	//결제 검증용 키 값  : receipt_id , 영수증ID - 변동값
        	this.getInstance();
        	goGetToken();
        	System.out.println(receipt_id);
            HttpResponse res = api.verify(receipt_id);
            String str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
            System.out.println(str);
            return str;
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }

    public String goCancel(String receipt_id, int price) {
    	this.getInstance();
    	goGetToken();

        Cancel cancel = new Cancel();
        //결제 검증용 키 값  : receipt_id , 영수증ID - 변동값
        cancel.receipt_id = receipt_id;
        
        //취소자 명  - 변동 가능?
        cancel.name = "관리자";
        
        //취소 사유  - 변동 가능?
        cancel.reason = "사용자 취소요청";
        
        cancel.price = price;
        //취소 금액 
        //생략시 전체 취소, 1000원 이상
        //지원가능 PG사: 이니시스, kcp, 다날, 페이레터, 나이스페이, 카카오페이, 페이코
        //cancel.price = 2000;

        
        try {
            HttpResponse res = api.cancel(cancel);
            String str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
            return str;
        } catch (Exception e) {
            e.printStackTrace();
            return "false";
        }
    }
}
