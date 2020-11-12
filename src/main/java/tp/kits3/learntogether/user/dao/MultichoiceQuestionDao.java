package tp.kits3.learntogether.user.dao;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.user.interfaces.IMultichoiceQuestionDAO;
import tp.kits3.learntogether.user.vo.MultichoiceQuestion;

@Repository
public class MultichoiceQuestionDao implements IMultichoiceQuestionDAO<MultichoiceQuestion> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(MultichoiceQuestion t) {
		session.insert("mappers.multichoiceQuestionMapper.insert", t);
	}

	@Override
	public void updateTitle(MultichoiceQuestion t) {
		session.update("mappers.multichoiceQuestionMapper.updateTitle", t);
	}
	
	@Override
	public void update(MultichoiceQuestion t) {
		
	}

	@Override
	public void delete(int id) {

	}

	@Override
	public List<MultichoiceQuestion> findAll() {
		return null;
	}

	@Override
	public MultichoiceQuestion findOne(int id) {
		return null;
	}

	@Override
	public List<MultichoiceQuestion> selectAllQuestionByTestID(int testID) {
		List<MultichoiceQuestion> list=session.selectList("mappers.multichoiceQuestionMapper.selectAllByTestID",testID);
		return list;
	}
	
	@Override
	public List<MultichoiceQuestion> selectAllQuestionByTestID_NoRD(int testID) {
		List<MultichoiceQuestion> list=session.selectList("mappers.multichoiceQuestionMapper.selectAllByTestID_NoRD",testID);
		return list;
	}

}
