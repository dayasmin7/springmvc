package com.broadband.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.broadband.model.Customer;

@Repository
public class CustomerDaoImpl implements CustomerDao {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerDaoImpl.class);

	private SessionFactory sessionFactory;	
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	public void addCustomer(Customer c) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(c);
		logger.info("Customer saved successfully, Customer Details="+c);
	}

	
	public void updateCustomer(Customer c) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(c);
		logger.info("Customer updated successfully, Customer Details="+c);
	}

	@SuppressWarnings("unchecked")
	public List<Customer> listCustomers() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Customer> customersList = session.createQuery("from Customer").list();
		for(Customer c : customersList){
			logger.info("Customer List::"+c);
		}
		return customersList;
	}
	
	public Customer getCustomerById(int id) {
		Session session = this.sessionFactory.getCurrentSession();		
		Customer p = (Customer) session.load(Customer.class, new Integer(id));
		logger.info("Customer loaded successfully, Customer details="+p);
		return p;
	}
	
	public void removeCustomer(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Customer p = (Customer) session.load(Customer.class, new Integer(id));
		if(null != p){
			session.delete(p);
		}
		logger.info("Customer deleted successfully, person details="+p);
	}
	
}