package tp.kits3.learntogether.user.dao;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.user.interfaces.IAnswerMultichoiceqDAO;
import tp.kits3.learntogether.user.vo.AnswerMultichoiceq;
import tp.kits3.learntogether.user.vo.MultichoiceQuestion;


@Repository
public class AnswerMultichoiceqDao implements IAnswerMultichoiceqDAO<AnswerMultichoiceq> {

	@Autowired
	private SqlSession session;

	@Override
	public void add(AnswerMultichoiceq t) {
		session.insert("mappers.answerMultichoiceqMapper.insert", t);
	}

	@Override
	public void update(AnswerMultichoiceq t) {
		session.update("mappers.answerMultichoiceqMapper.update", t);
	}
	
	@Override
	public void updateContent(AnswerMultichoiceq t) {
		session.update("mappers.answerMultichoiceqMapper.updateContent", t);
	}

	@Override
	public void delete(int id) {

	}

	@Override
	public List<AnswerMultichoiceq> findAll() {
		return null;
	}

	@Override
	public AnswerMultichoiceq findOne(int id) {
		return null;
	}

	@Override
	public List<AnswerMultichoiceq> findAnserByQuestionID(int questionID) {
		List<AnswerMultichoiceq> list = session.selectList("mappers.answerMultichoiceqMapper.selectAllByQuestionID",
				questionID);
		return list;
	}

	@Override
	public List<AnswerMultichoiceq> findAnswerByInQuestions(List<MultichoiceQuestion> questionList) {
		List<AnswerMultichoiceq> list = session.selectList("mappers.answerMultichoiceqMapper.selectAllByMultichoiceq",
				questionList);
		return list;
	}

}
