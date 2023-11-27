package boss.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boss.common.PagePgm;
import boss.model.Product;
import boss.model.Review;

@Mapper
public interface ProductDetailDao {

	

	

	Product selectProduct(String pid);

	Review selectReview(String pid);

	Review selectReviewOne(String memail);

	Review prselect(int rid);

	int total();
	
//	페이징 처리
	List<Review> list(PagePgm pp);

//  리뷰 memail 뽑기	

	List<Review> selectMemberReview(String memail);

	// 리뷰 작성 
	int reviewInsert(String memail);


//	int insert(int rid);

}
