package tp.kits3.learntogether.admin.dao;

/**
 * @author NguyenDoanNam
 */
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.admin.vo.Invoice;
import tp.kits3.learntogether.user.interfaces.IService;

@Repository
public class InvoiceAdminDao implements IService<Invoice> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(Invoice t) {
		session.insert("mapperAdmin.invoiceMapper.insert", t);
	}

	@Override
	public void update(Invoice t) {
		session.update("mapperAdmin.invoiceMapper.update", t);
	}

	@Override
	public void delete(int id) {

	}

	@Override
	public List<Invoice> findAll() {
		List<Invoice> list = session.selectList("mapperAdmin.invoiceMapper.selectAll");
		return list;
	}

	@Override
	public Invoice findOne(int id) {
		Invoice Invoice = session.selectOne("mapperAdmin.invoiceMapper.selectbyId", id);
		return Invoice;
	}
}
