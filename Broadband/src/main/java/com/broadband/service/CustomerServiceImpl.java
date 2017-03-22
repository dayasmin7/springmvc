package com.broadband.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.broadband.dao.CustomerDao;
import com.broadband.model.Customer;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	private CustomerDao customerDao;

	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	
	@Transactional
	public void addCustomer(Customer p) {
		this.customerDao.addCustomer(p);
	}
	
	@Transactional
	public void updateCustomer(Customer p) {
		this.customerDao.updateCustomer(p);
	}
	
	@Transactional
	public List<Customer> listCustomers() {
		return this.customerDao.listCustomers();
	}
	
	@Transactional
	public Customer getCustomerById(int id) {
		return this.customerDao.getCustomerById(id);
	}
	
	@Transactional
	public void removeCustomer(int id) {
		this.customerDao.removeCustomer(id);
	}

}
