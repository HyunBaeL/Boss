package boss.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boss.common.PagePgm;
import boss.model.OrderDetail;
import boss.model.Orders;
import boss.service.MasterOrdersService;

@Controller
public class MasterOrdersController {

	@Autowired
	MasterOrdersService ms;

	// 관리자 리뷰리스트
	@RequestMapping("masterOrdersList.do")
	public String masterOrdersList(PagePgm pp, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, String search) throws Exception {
		System.out.println("masterOrdersList");

		int total = ms.total();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		pp = new PagePgm(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("pp", pp);
		model.addAttribute("list", ms.list(pp));
		return "master/orders/masterOrdersList";
	}

	// 관리자 주문 상세정보
	@RequestMapping("masterOrdersSelect.do")
	public String masterOrdersSelect(String oid, Model model) throws Exception {
		System.out.println("masterOrdersSelect");
		System.out.println("oid : " + oid);
		List<HashMap<String, Object>> ordersList = new ArrayList<>();
		if (oid != null) { // 주문정보가 있다면. (없으면 처음부터 select도 못들어옴. else처리 안함)
			System.out.println("oid 널통과");
			ordersList = ms.listProduct(Integer.parseInt(oid));
			if (ordersList != null && ordersList.size() > 0) { // 리스트 구해옴
				System.out.println("list 통과 : ");
				model.addAttribute("ordersList", ordersList);
				// 단일정보 (뷰에서 쓰기쉽게 foreach안돌려도됨)
				model.addAttribute("orders", ordersList.get(0));
				System.out.println("dorders" + ordersList.get(0));
			} else { // oid는 있으나 list를 못구해옴
				System.out.println("oid는 있으나 list는 못구해옴 ");
			}
			// 모든정보의 List

		}
		return "master/orders/masterOrdersSelect";
	}

	// 관리자 주문 상세 - 배송상태 변경
	@RequestMapping("masterOrdersStatus.do")
	public String masterOrdersStatus(String odid, String odstatus, Model model) throws Exception {
		System.out.println("masterOrdersStatus");
		int oid = ms.selectOrderDetail(odid).getOid();
		System.out.println("oid : " + oid);
		System.out.println("odid : " + odid);
		System.out.println("odstatus : " + odstatus);
		if (odstatus != null) {
			int result = ms.updateStatus(odid, odstatus);
			if (result == 1) { // 수정 완료시
				System.out.println("수정성공");
				model.addAttribute("oid", oid);
			} else { // 수정 실패시
				System.out.println("수정실패");
			}
		}
		return "redirect:/masterOrdersSelect.do";
	}

	// 관리자 주문 삭제
	@RequestMapping("masterOrdersDelete.do")
	public String masterReviewDelete(String oid, Model model, HttpServletRequest request) {
		System.out.println("masterMemberDelete");
		System.out.println("rid : " + oid);
		// Service에서 메소드를 1번만 호출하기 위해 리스트로 양식을 통일했음.
		List<String> idList = new ArrayList<String>();
		String[] ids = request.getParameterValues("chkId");

		int result = 0;
		String msg = "";
		// id값이 1개라도 넘어온다면 (복수허용)

		if ((oid != null) || (request.getParameterValues("chkId") != null)) { // 요청받는 방식을 나누는 조건문. 체크박스 / 버튼
			if (oid != null) { // id가 버튼으로 넘어온 경우. (단일, 다중 동일메서드 처리를 위해 List로 양식을 통일했음.)
				System.out.println("id가 버튼으로 1개만 넘어옴.");
				idList.add(0, oid);
				result = ms.deleteOrders(idList);
				model.addAttribute("result", result);
				model.addAttribute("msg", +result + "개 수정 완료");
				System.out.println("1개만 삭제완료. : " + result);

			} else if (oid == null && ids != null) { // id가 체크박스를 통해 넘어온경우.
				System.out.println("id가 체크박스로 1개 or 여러개 넘어옴.");
				System.out.println("체크박스로 넘어온 ID의 갯수 : " + ids.length);
				idList = Arrays.asList(ids);
				result = ms.deleteOrders(idList);
				model.addAttribute("result", result);
				model.addAttribute("msg", +result + "개 수정 완료");
				System.out.println("여러명 삭제 완료 : " + result);
			}
		} else { // 모든값이 Null이라면.
			model.addAttribute("result", result);
			model.addAttribute("msg", "수정할 글을 선택하세요.");
			System.out.println("체크박스가 선택되지않음. " + result);

		}
		return "./master/review/masterReviewDelete";
	}
}
