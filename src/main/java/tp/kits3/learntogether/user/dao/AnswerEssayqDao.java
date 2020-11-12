package tp.kits3.learntogether.user.dao;

/**
 * @author PhungDinhHuy
 *
 */

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.user.interfaces.IAnswerEssayqDAO;
import tp.kits3.learntogether.user.vo.AnswerEssayq;

@Repository
public class AnswerEssayqDao implements IAnswerEssayqDAO<AnswerEssayq>{

	@Autowired
	private SqlSession session;

	@Override
	public void add(AnswerEssayq t) {
		session.insert("mappers.answerEssayqMapper.insert", t);
	}
	
	@Override
	public AnswerEssayq findAnswerByQuestionID(int questionID) {
		return session.selectOne("mappers.answerEssayqMapper.selectAnswerByQuestionID", questionID);
	}

	@Override
	public void update(AnswerEssayq t) {
		
	}	
	
	@Override
	public void updateContentAnswer(AnswerEssayq t) {
		session.update("mappers.answerEssayqMapper.updateContentAnswer", t);
		
	}

	@Override
	public void delete(int id) {
		
	}

	@Override
	public List<AnswerEssayq> findAll() {
		return null;
	}

	@Override
	public AnswerEssayq findOne(int id) {
		return null;
	}

//	@Override
//	public List<AnswerEssayq> findAnswerByQuestionID(int questionID) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public List<AnswerEssayq> findAnswerByInQuestions(List<AnswerEssayq> questionList) {
//		// TODO Auto-generated method stub
//		return null;
//	}


}
