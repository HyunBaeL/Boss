package boss.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import boss.common.PagePgm;
import boss.common.Search;
import boss.dao.MasterReportDao;
import boss.model.Report;
import boss.model.Review;

@Service
public class MasterReportService {
	@Autowired
	private MasterReportDao dao;

	public Report selectOne(String reportId) {
		return dao.selectOne(reportId);
	}

	public int total() {
		return dao.total();
	}

	public List<Report> list(PagePgm pp) {
		return dao.list(pp);
	}

//	public int update(Report review) {
//		return dao.update(review);
//	}
//
//
//	public int deleteReview(List<String> idList) {
//		return dao.deleteReview(idList);
//	}
//	
//
//	// 리뷰 유형별 검색
//	public List<Report> searchReviewList(Search search) {
//		return dao.searchReviewList(search);
//	}
}
