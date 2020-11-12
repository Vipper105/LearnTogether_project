package tp.kits3.learntogether.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.learntogether.admin.dao.InvoiceAdminDao;
import tp.kits3.learntogether.admin.vo.Invoice;

@Service
public class InvoiceAdminService {
	@Autowired InvoiceAdminDao invoiceddminDao;
	
	
	public List<Invoice> findAll()
	{
		return invoiceddminDao.findAll();
	}
	public Invoice findOne(Integer id)
	{
		return invoiceddminDao.findOne(id);
	}
	public boolean insert(Invoice t)
	{
		invoiceddminDao.add(t);
		return true;
	}
	public void update(Invoice t)
	{
		invoiceddminDao.update(t);
	}
	public void delelebyId(Integer t)
	{
		invoiceddminDao.delete(t);
		
	}
}
