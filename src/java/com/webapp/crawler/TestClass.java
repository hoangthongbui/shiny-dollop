/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webapp.crawler;

/**
 *
 * @author stephen
 */
public class TestClass extends BaseCrawler{
	
	 
	public static void main(String[] args) {
		//JDNCrawler jdnc = new JDNCrawler("Jadiny");
		//jdnc.start();
		//BLKCrawler bxsc = new BLKCrawler("BlueKids", );
	 // bxsc.start();
		//System.out.println("Insert item completed !");
		BaseCrawler b = new BaseCrawler();
		String document = "";
		try {
		    //document = b.getHtmlDocsBody("https://jadiny.vn/collections/be-trai/products/ao-vest-tay-den-bt-avt013", "<div class=\"product-container cf\">", "<div class=\"related-products\">");
				document = b.getHtmlDocsBody("https://bluekids.vn/collections/ban-chay-nhat/products/ao-phong-be-trai-hinh-cay-dua-1", "<main class=\"padding-top-mobile\">", "</main>");
//			URL url = new URL("https://jadiny.vn/collections/be-trai/products/ao-sm-tn-clt-linen-caro-xanh-cam-ast115-bt");
//			URLConnection connection = url.openConnection() ;
//			connection.addRequestProperty("User-Agent", Constants.GOOGLE_BOT);
//			InputStream is = connection.getInputStream();
//			BufferedReader reader = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8));
//		  document = reader.lines().collect(Collectors.joining());
			System.out.println("doc: " + document);
		} catch (Exception e) {
			e.printStackTrace();
		}
	  
	}
	
}
