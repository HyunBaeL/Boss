package boss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.dao.MypageDao;
import boss.model.OrderDetail;
import boss.model.Orders;
import boss.model.QnaBoard;
import boss.model.Review;

@Service
public class MypageService {

	@Autowired
	private MypageDao dao;

	public Orders myoders(String mEmail) {
		return dao.myoders(mEmail);
	}

	public String statusMsg(int odstatus) {
		switch (odstatus) {
		case 0:
			return "배송 대기";
		case 1:
			return "배송 완료";
		case 2:
			return "환불 처리중";
		case 3:
			return "환불 완료";
		default:
			return "관리자에게 문의";
		}
	}

	public List<Review> myreviews(String mEmail) {
		return dao.myreviews(mEmail);
	}

	public List<QnaBoard> myqnas(String mEmail) {
		return dao.myqnas(mEmail);
	}

	public int mypageDeleteReview(String rid) {
		return dao.mypageDeleteReview(rid);
	}

	public int refund(String odid) {
		return dao.refund(odid);
	}

	public OrderDetail myorderDetail(String odid) {
		return dao.myorderDetail(odid);
	}
}
