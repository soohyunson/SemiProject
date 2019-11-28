package bootpay.request;

/**
 * Created by ehowlsla on 2017. 8. 3..
 */
public class Cancel {
    public String receipt_id; //부트페이 거래 고유 키 값, 영수증 ID
    public String name; //취소자 명
    public String reason; //취소 사유 
    public int price; //취소 금액, 생략시 전체 취소
}
