package tp.kits3.learntogether.user.dao;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.user.interfaces.IEssayQuestionDAO;
import tp.kits3.learntogether.user.vo.EssayQuestion;


@Repository
public class EssayQuestionDao implements IEssayQuestionDAO<EssayQuestion> {

	@Autowired
	private SqlSession session;

	@Override
	public List<EssayQuestion> selectAllQuestionByTestID(int testID) {
		List<EssayQuestion> list = session.selectList("mappers.essayQuestionMapper.selectAllByTestID", testID);
		return list;
	}
//	
//	@Override
//	public List<EssayQuestion> selectAllQuestionByTestID_NoRD(int testID) {
//		List<EssayQuestion> list=session.selectList("mappers.essayQuestionMapper.selectAllByTestID_NoRD",testID);
//		return list;
//	}

	@Override
	public void add(EssayQuestion t) {
		session.insert("mappers.essayQuestionMapper.insert", t);
	}

	@Override
	public int getId_after_addAnswerQuestion(EssayQuestion t) {
		session.insert("mappers.essayQuestionMapper.insert", t);
		return t.getId();
	}
	
	@Override
	public EssayQuestion findOne(int id) {
		return session.selectOne("mappers.essayQuestionMapper.selectOne", id);
	}

	@Override
	public void update(EssayQuestion t) {
		session.update("mappers.essayQuestionMapper.update", t);

	}
	
	@Override
	public void updateContent(EssayQuestion t) {
		session.update("mappers.essayQuestionMapper.updateContentScore", t);

	}

	@Override
	public void delete(int id) {

	}

	@Override
	public List<EssayQuestion> findAll() {
		return null;
	}

}
