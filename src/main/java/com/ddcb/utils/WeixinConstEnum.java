package com.ddcb.utils;

public enum WeixinConstEnum {

	TOKEN("zaq12wsx"),

	/*TEST_APP_ID("wx309df15b6ddc5371"),

	TEST_APP_SECRET("690172c0932f50f20f7b67c629a66917"),

	TEST_ACCESS_TOKEN_URL("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET"),

	TEST_JS_TICKET_URL("https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=ACCESSTOKEN"),*/
	
	COMPANY_APP_ID("wx519f44ba99e2ec36"),

	COMPANY_APP_SECRET("1f0e5a7cd452b7c673611e55fd05ea75"),

	COMPANY_ACCESS_TOKEN_URL("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET"),
	//COMPANY_ACCESS_TOKEN_URL("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET"),

	COMPANY_JS_TICKE_TURL("https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=ACCESSTOKEN");
	//COMPANY_JS_TICKE_TURL("https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=ACCESSTOKEN");
	
	private final String constStr;
	
	private WeixinConstEnum(String str) {
		this.constStr = str;
	}
	
	public String toString() {
		return this.constStr;
	}
}
