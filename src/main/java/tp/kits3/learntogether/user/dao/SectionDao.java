package tp.kits3.learntogether.user.dao;

/**
 * @author Diep
 *
 */

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.user.interfaces.ISection;
import tp.kits3.learntogether.user.vo.Section;

@Repository
public class SectionDao implements ISection<Section> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(Section t) {
		session.insert("mappers.sectionMapper.insert", t);
	}

	@Override
	public void update(Section t) {
		session.update("mappers.sectionMapper.update", t);
	}

	@Override
	public void delete(int id) {
		session.update("mappers.sectionMapper.delete", id);
	}

	@Override
	public List<Section> findAll() {
		List<Section> list = session.selectList("mappers.sectionMapper.selectAll");
		return list;
	}

	@Override
	public List<Section> getSectionByCourseID(int courseID) {
		List<Section> sectionListByCourseID = session.selectList("mappers.sectionMapper.selectSectionByCourseID", courseID);
		return sectionListByCourseID;
	}
	
	/**
	 * @author PhungDinhHuy
	 *
	 */
	@Override
	public Section findOne(int id) {
		Section section =session.selectOne("mappers.sectionMapper.selectOne", id);
		return section;
	}
}
