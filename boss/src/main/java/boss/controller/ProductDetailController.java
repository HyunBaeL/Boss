package boss.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import boss.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boss.common.PagePgm;
import boss.model.Product;
import boss.model.Review;
import boss.service.ProductDetailService;

@Controller
public class ProductDetailController {

	@Autowired
	ProductDetailService service;

	@RequestMapping("productDetail.do")
	public String productDetail(String memail, String pid, Model model, Product product, Review review, PagePgm pp,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, String search) throws Exception {
		System.out.println("productDetail");
		System.out.println("pid : " + pid);
		

		int rid = 61;
		product = service.selectProduct(pid);
		System.out.println("pid 구해옴");
		review = service.selectReviewOne(rid);
		System.out.println("rid 구해옴");

		System.out.println("review : " + review.getMemail() + review.getRcontent());
		if (product != null) { // 상품을 잘 구해왔다면.
			model.addAttribute("product", product);

		// 페이징 처리
		System.out.println("productReviewList 들어가");

		int total = service.total();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		pp = new PagePgm(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("pp", pp);
		model.addAttribute("reviewList", service.list(pp));

		return "./product/productDetail";
	}

	// 리뷰 작성 페이지 이동 및 작성
	@RequestMapping("productReviewInsertForm.do")
	public String productReviewInsertForm(int pid, Model model, Review review) {
		System.out.println("productReviewInsertForm");

		String memail = "wooas0105";
		List<Review> reviewList = new ArrayList<Review>();
		reviewList = service.selectMemberReview(memail);
		System.out.println("list size : " + reviewList.size());

		if (review != null) {
			System.out.println("productReviewInsertForm : "+"리뷰 작성하러 옴");
			review = reviewList.get(0);
			model.addAttribute("review", review);
			model.addAttribute("pid", pid);
 
		} else {
			System.out.println("productReviewInsertForm : "+"리뷰가 없는 페이지");
		}
		
		
	
		return "./product/review/productReviewInsertForm";
	}

	@RequestMapping("productReviewcheck.do")
	public String prInsert(Model model, Review review) {
		System.out.println("productReviewcheck:"+"등록 확인중");
		
		System.out.println("review 1 : " + review.getMemail());
		System.out.println("review 2 : " + review.getOid());
		System.out.println("review 3 : " + review.getPid());
		System.out.println("review 4 : " + review.getRcontent());
		System.out.println("review 5 : " + review.getRdrop());
		System.out.println("review 6 : " + review.getRimage());
		System.out.println("review 7 : " + review.getRreadcount());
		System.out.println("review 8 : " + review.getRtitle());
		System.out.println("review 9 : " + review.getRwriter());
		System.out.println("review 10 : " + review.getRreg());
		
		
		int result = service.reviewInsert("review",review);
		
		System.out.println("리뷰작성결과:"+ result);
		if(result == 1) {
			System.out.println("리뷰 작성 성공");
		}else{
			System.out.println("리뷰 적성 안됐음");
		}
		
		
		
		return "./product/review/productReviewcheck";
	}

	// 리뷰 상세 불러오기
	@RequestMapping("productReviewSelect.do")
	public String productReviewSelect(int pid, Model model, int rid, Review review) {
		System.out.println("productReviewSelect");

		review = service.prselect(rid);

		model.addAttribute("review", review);
		model.addAttribute("pid", pid);

		System.out.println("상세페이지 불러옴");

		return "./product/review/productReviewSelect";
	}

}
