package tp.kits3.learntogether.admin.dao;

/**
 * @author NguyenDoanNam
 */
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tp.kits3.learntogether.admin.vo.Section;
import tp.kits3.learntogether.user.interfaces.IService;

@Repository
public class SectionAdminDao implements IService<Section> {

	@Autowired
	private SqlSession session;
	
	@Override
	public void add(Section t) {
		session.insert("mapperAdmin.sectionMapper.insert", t);
	}

	@Override
	public void update(Section t) {
		session.update("mapperAdmin.sectionMapper.update", t);
	}

	@Override
	public void delete(int id) {

	}

	@Override
	public List<Section> findAll() {
		List<Section> list = session.selectList("mapperAdmin.sectionMapper.selectAll");
		return list;
	}

	@Override
	public Section findOne(int id) {
		Section section = session.selectOne("mapperAdmin.sectionMapper.selectbyId", id);
		return section;
	}
	public List<Section> findByCourseId(int courseId) {
		List<Section> list = session.selectList("mapperAdmin.sectionMapper.selectbyCourseId", courseId);
		return list;
	}

}
