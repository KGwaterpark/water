package com.water.park.vo;

public class BookVO {
	private String re_type;
	private int RESERVATION_COUNT;
	private int rebook_id;
	private String m_id;
	private String re_type2;
	private String check_in_date;
	private String check_out_date;
	private int price;
	
	private String book_date;
	
	private String state;
	
	//결제내역 조회 필드
	private String merchant_uid;
	private int cancel_amount; // 취소(환불) 금액
	private String pg_provider; // 결제수단
	private int apply_num; // 승인 번호
	private String buyer_email; //구매자 이메일
	private String buyer_name; // 구매자 이름
	private String buyer_tel; //  구매자 전번
	private String channel;  // pc or mobile
	private String card_name; // 카드 이름
	private String card_num; // 카드 번호
	private String pay_date; // 결제시각
	private String emb_pg_provider;  // 결제 수단 (카카오페이, 네이버페이 등)
	private String cancel_reason; // 취소사유
	private String cancelled_at; // 취소시각  
	private String fail_reason;	// 실패사유
	

	public BookVO(String merchant_uid, int price, String pg_provider,int apply_num,int cancel_amount, String buyer_email, String buyer_name, String buyer_tel,String channel, String card_name,
			String card_num, String pay_date, String re_type, String state, 
			String cancel_reason,String cancelled_at, String fail_reason) {
		super();
		this.merchant_uid = merchant_uid;
		this.cancel_amount = cancel_amount;
		this.apply_num = apply_num;
		this.pg_provider = pg_provider;
		this.price = price;
		this.buyer_email = buyer_email;
		this.buyer_name = buyer_name;
		this.buyer_tel = buyer_tel;
		this.channel = channel;
		this.card_name = card_name;
		this.card_num = card_num;
		this.pay_date = pay_date;
		this.re_type = re_type;
		this.cancel_reason = cancel_reason;
		this.cancelled_at = cancelled_at;
		this.state = state;
		this.fail_reason = fail_reason;
	}
	
	public String getMerchant_uid() {
		return merchant_uid;
	}

	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}

	public int getApply_num() {
		return apply_num;
	}

	public void setApply_num(int apply_num) {
		this.apply_num = apply_num;
	}

	public String getPg_provider() {
		return pg_provider;
	}

	public void setPg_provider(String pg_provider) {
		this.pg_provider = pg_provider;
	}

	public int getCancel_amount() {
		return cancel_amount;
	}

	public void setCancel_amount(int cancel_amount) {
		this.cancel_amount = cancel_amount;
	}

	public String getPay_date() {
		return pay_date;
	}

	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}

	public String getCancel_reason() {
		return cancel_reason;
	}

	public void setCancel_reason(String cancel_reason) {
		this.cancel_reason = cancel_reason;
	}

	public String getCancelled_at() {
		return cancelled_at;
	}

	public void setCancelled_at(String cancelled_at) {
		this.cancelled_at = cancelled_at;
	}

	public String getBuyer_email() {
		return buyer_email;
	}

	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}

	public String getBuyer_name() {
		return buyer_name;
	}

	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}

	public String getBuyer_tel() {
		return buyer_tel;
	}

	public void setBuyer_tel(String buyer_tel) {
		this.buyer_tel = buyer_tel;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}


	public String getCard_name() {
		return card_name;
	}

	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}

	public String getCard_num() {
		return card_num;
	}

	public void setCard_num(String card_num) {
		this.card_num = card_num;
	}

	public String getEmb_pg_provider() {
		return emb_pg_provider;
	}

	public void setEmb_pg_provider(String emb_pg_provider) {
		this.emb_pg_provider = emb_pg_provider;
	}

	public String getFail_reason() {
		return fail_reason;
	}

	public void setFail_reason(String fail_reason) {
		this.fail_reason = fail_reason;
	}

	public BookVO(String re_type, int rESERVATION_COUNT, int rebook_id, String m_id, String re_type2,
			String check_in_date, String check_out_date, int price, String state) {
		super();
		this.re_type = re_type;
		RESERVATION_COUNT = rESERVATION_COUNT;
		this.rebook_id = rebook_id;
		this.m_id = m_id;
		this.re_type2 = re_type2;
		this.check_in_date = check_in_date;
		this.check_out_date = check_out_date;
		this.price = price;
		this.state = state;
	}
	
	public BookVO(String re_type, int rebook_id, String m_id, String check_in_date, String check_out_date, int price,
			String book_date, String state) {
		super();
		this.re_type = re_type;
		this.rebook_id = rebook_id;
		this.m_id = m_id;
		this.check_in_date = check_in_date;
		this.check_out_date = check_out_date;
		this.price = price;
		this.book_date = book_date;
		this.state = state;
	}

	public String getBook_date() {
		return book_date;
	}

	public void setBook_date(String book_date) {
		this.book_date = book_date;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public BookVO(int rebook_id, String m_id, String re_type2, String check_in_date, String check_out_date, int price) {
		super();
		this.rebook_id = rebook_id;
		this.m_id = m_id;
		this.re_type2 = re_type2;
		this.check_in_date = check_in_date;
		this.check_out_date = check_out_date;
		this.price = price;
	}

	public int getRebook_id() {
		return rebook_id;
	}

	public void setRebook_id(int rebook_id) {
		this.rebook_id = rebook_id;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getRe_type2() {
		return re_type2;
	}

	public void setRe_type2(String re_type2) {
		this.re_type2 = re_type2;
	}

	public String getCheck_in_date() {
		return check_in_date;
	}

	public void setCheck_in_date(String check_in_date) {
		this.check_in_date = check_in_date;
	}

	public String getCheck_out_date() {
		return check_out_date;
	}

	public void setCheck_out_date(String check_out_date) {
		this.check_out_date = check_out_date;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public BookVO() {}
	
	public BookVO(String re_type, int rESERVATION_COUNT) {
		super();
		this.re_type = re_type;
		this.RESERVATION_COUNT = rESERVATION_COUNT;
	}

	public String getRe_type() {
		return re_type;
	}
	public void setRe_type(String re_type) {
		this.re_type = re_type;
	}
	public int getRESERVATION_COUNT() {
		return RESERVATION_COUNT;
	}
	public void setRESERVATION_COUNT(int rESERVATION_COUNT) {
		RESERVATION_COUNT = rESERVATION_COUNT;
	}
	
	
	
}
