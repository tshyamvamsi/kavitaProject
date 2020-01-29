package com.dhanjyothi.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;
import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.h2.server.web.WebServlet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.dhanjyothi.model.Account;
import com.dhanjyothi.model.Beneficiaries;
import com.dhanjyothi.model.User;
import com.dhanjyothi.model.FileEntity;
import com.dhanjyothi.model.KYC;
import com.dhanjyothi.model.Transaction;


@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "com.dhanjyothi" })
@EnableTransactionManagement
@PropertySource("classpath:application.properties")
public class DhanJyothiConfig implements WebMvcConfigurer {

	@Autowired
	private ApplicationContext context;

	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
	@Bean
	public DataSource getDataSource() {
	    BasicDataSource dataSource = new BasicDataSource();
	    dataSource.setDriverClassName("org.h2.Driver");
	    // dataSource.setUrl("jdbc:h2:mem:webscarab3;DB_CLOSE_DELAY=-1");
	    dataSource.setUrl("jdbc:h2:file:~/dhanjyothi_db;DB_CLOSE_ON_EXIT=FALSE;AUTO_RECONNECT=TRUE");
	    dataSource.setUsername("sa");
	    dataSource.setPassword("");
	    return dataSource;
	}
	
	@Autowired
	public void onStartup(ServletContext servletContext) 
	  throws ServletException {
	  ServletRegistration.Dynamic servlet = servletContext
	    .addServlet("h2-console", new WebServlet());
	  servlet.setLoadOnStartup(2);
	  servlet.addMapping("/console/*");
	}
	

	@Bean
	public LocalSessionFactoryBean getsessionFactory() {
		LocalSessionFactoryBean factoryBean = new LocalSessionFactoryBean();
		factoryBean.setDataSource(getDataSource());
		factoryBean.setConfigLocation(context
				.getResource("classpath:hibernate-cfg.xml"));
		factoryBean.setAnnotatedClasses(
				Account.class,
				User.class, 
				FileEntity.class,
				Beneficiaries.class,
				Transaction.class,
				KYC.class);
		return factoryBean;
	}

	@Bean(name = "multipartResolver")
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(100000);
		return multipartResolver;
	}
	
	

	@Bean
	public HibernateTemplate getHibernateTemplate() {
		HibernateTemplate hibernateTemplate = new HibernateTemplate();
		hibernateTemplate.setSessionFactory(getsessionFactory().getObject());
		return hibernateTemplate;
	}

	@Bean
	public HibernateTransactionManager getTransactionManager() {
		HibernateTransactionManager transaction = new HibernateTransactionManager();
		transaction.setSessionFactory(getsessionFactory().getObject());
		return transaction;
	}
	
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
	    registry.addResourceHandler("/assets/css/**").addResourceLocations("/assets/css/");
	    registry.addResourceHandler("/assets/images/**").addResourceLocations("/assets/images/");
	}


}
