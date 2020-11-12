package tp.kits3.learntogether.user.interfaces;

import tp.kits3.learntogether.user.vo.Rating;

public interface IRatingDAO <T extends Rating> extends IService<T>{

	void addRating (Rating rating);
	void updateRating(Rating rating);
	
}
