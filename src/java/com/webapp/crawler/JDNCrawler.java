/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.webapp.crawler;

import com.webapp.settings.Constants;
import com.webapp.settings.PropertiesReading;

/**
 *
 * @author stephen
 */
public class JDNCrawler extends BaseCrawler implements Runnable{

	private Thread t;
	private String threadName;
	private String contextPath;
	
	public JDNCrawler(String threadName, String contextPath) {
		this.contextPath = contextPath;
		this.threadName = threadName;
	}
	

	@Override
	public void run() {
		BaseCrawler jdnCrawler = new BaseCrawler();
		jdnCrawler.setWebPageName(threadName);
		jdnCrawler.setPropertiesReading(new PropertiesReading(contextPath + Constants.JADINY_CONFIG_DIRECTORY));
		jdnCrawler.setContextPath(contextPath);
		jdnCrawler.setXslLinkDirectory(contextPath + Constants.JADINY_XSL_DIRECTORY);
		jdnCrawler.setXslDetailDirectory(contextPath + Constants.JADINY_XSL_DETAIL_DIRECTORY);
		jdnCrawler.setXmlOutputLinksFile(contextPath + Constants.JADINY_XML_OUTPUT_ALL_LINKS);
		jdnCrawler.setXmlOutputDetailFile(contextPath + Constants.JADINY_XML_OUTPUT_ALL_PRODUCT_DETAILS);
		try {
			jdnCrawler.crawl();
			//jdnCrawler.test();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void start() {
		System.out.println("Starting thread: " + threadName);
		if (t == null) {
			t = new Thread(this, threadName);
			t.start();
		}
	}
	
}
