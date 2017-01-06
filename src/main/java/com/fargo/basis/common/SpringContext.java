package com.fargo.basis.common;

import javax.servlet.ServletContext;

import com.fargo.basis.service.SysConfig;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;


public class SpringContext {

	public static final String[] CONFIG_LOCATIONS = new String[] { "applicationContext-resources.xml", "applicationContext-service.xml",
		"applicationContext-dao.xml"
		//,"applicationContext-mail.xml" 
		};

	private SpringContext() {
	};

	static public void setSpringContext(ApplicationContext _content) {
		content = _content;
	}
	static public void setServletContext(ServletContext _content) {
		servletContext = _content;
	}

	public static ServletContext getServletContext() {
		return servletContext;
	}

	protected static ApplicationContext content = null;
	protected static ServletContext servletContext = null;

	public static void setApplicationContext(ApplicationContext ac1) {
		content=ac1;
	}
	
	public static ApplicationContext getApplicationContext() {
		if (content == null) {
			content = new ClassPathXmlApplicationContext(CONFIG_LOCATIONS);
		}
		return content;
	}
	private static JedisPool jedisPool=null;
	//private static ShardedJedisPool shardedJedisPool;
	protected static JdbcTemplate jdbcTemplate = null;
	protected static JdbcTemplate jdbcTemplateForBsquiz = null;
	
	
	
	static public JedisPool getJedisPool() {
		if (jedisPool == null) {
			JedisPoolConfig config = new JedisPoolConfig();
	        config.setMaxActive(100);
	        config.setMaxIdle(10);
	        config.setMaxWait(1000l);
	        
	        config.setTestOnBorrow(false);
	        

	        jedisPool = new JedisPool(config, "10.150.146.120", 6379);
			//jedisPool = (JdbcTemplate) SpringContext.getApplicationContext().getBean("jdbcTemplate");
		}
		return jedisPool;
	}

	
	static public JdbcTemplate getJdbcTemplate() {
		if (jdbcTemplate == null) {
			jdbcTemplate = (JdbcTemplate) SpringContext.getApplicationContext().getBean("jdbcTemplate");
		}
		return jdbcTemplate;
	}

	static public JdbcTemplate getJdbcTemplateForBsquiz() {
		if (jdbcTemplateForBsquiz == null) {
			jdbcTemplateForBsquiz = (JdbcTemplate) SpringContext.getApplicationContext().getBean("jdbcTemplateForBsquiz");
		}
		return jdbcTemplateForBsquiz;
	}
	
	
	static public Session getHibernateSession(){
		return ((SessionFactory)SpringContext.getApplicationContext().getBean("sessionFactory")).openSession();
	}
	static public SysConfig getSystemConfig(){
		return (SysConfig)SpringContext.getApplicationContext().getBean("sysConfig");
	}
}
