package boss.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boss.common.PagePgm;
import boss.common.Search;
import boss.model.Member;
import boss.model.QnaBoard;
import boss.service.MasterMemberService;

@Controller
public class MasterMemberController {

	@Autowired
	private MasterMemberService ms;

	// 관리자 메인 이동
	@RequestMapping("masterMain.do")
	public String masterMain() {
		System.out.println("masterMain");
		return "./master/member/masterMain";
	}

	// 관리자 회원리스트 이동
	@RequestMapping("masterMemberList.do")
	public String masterMemberList(PagePgm pp, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, String search) throws Exception {
		System.out.println("masterMemberList");

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
		return "./master/member/masterMemberList";
	}

	// 관리자 회원 개인정보
	@RequestMapping("masterMemberSelect.do")
	public String masterMemberSelect(String id, Model model) {
		System.out.println("masterMemberSelect");
		System.out.println(id);
		Member member = ms.selectOne(id);
		System.out.println("id : " + member.getmEmail());
		model.addAttribute("member", member);

		return "./master/member/masterMemberSelect";
	}

	// 관리자 회원정보 수정 폼(입력값 받음)
	@RequestMapping("masterMemberUpdateForm.do")
	public String masterMemberUpdateForm(String id, Model model) {
		System.out.println("masterMemberUpdateForm");
		Member db = ms.selectOne(id);
		model.addAttribute("member", db);
		return "./master/member/masterMemberUpdateForm";
	}

	// 관리자 회원 수정 (입력값 적용)
	@RequestMapping("masterMemberUpdate.do")
	public String masterMemberUpdate(Member member, Model model) {
		System.out.println("masterMemberUpdate");
		System.out.println(member.getmEmail());
		System.out.println(member.getmReg());
		int result = ms.update(member);
		System.out.println("쿼리문 성공");
		String dbid = member.getmEmail();
		System.out.println("dbid" + dbid);

		if (result == 1) { // 업데이트 성공시
			System.out.println("여기여기");
			model.addAttribute("result", result);
			model.addAttribute("mEmail", dbid);
			model.addAttribute("member", member);
			model.addAttribute("msg", "회원수정 성공.");
			System.out.println("업데이트 성공");
		} else { // 업데이트 실패시
			System.out.println("업데이트 실패");
			model.addAttribute("msg", "회원수정 실패.");
		}
		return "./master/member/masterMemberUpdate";
	}

	// 관리자 회원 삭제
	@RequestMapping("masterMemberDelete.do")
	public String masterMemberDelete(String id, Model model, HttpServletRequest request) {
		System.out.println("masterMemberDelete");

		// Service에서 메소드를 1번만 호출하기 위해 리스트로 양식을 통일했음.
		List<String> idList = new ArrayList<String>();
		String[] ids = request.getParameterValues("chkId");

		int result = 0;
		String msg = "";
		// id값이 1개라도 넘어온다면 (복수허용)

		if ((id != null) || (request.getParameterValues("chkId") != null)) { // 요청받는 방식을 나누는 조건문. 체크박스 / 버튼
			if (id != null) { // id가 버튼으로 넘어온 경우. (단일, 다중 동일메서드 처리를 위해 List로 양식을 통일했음.)
				System.out.println("id가 버튼으로 1개만 넘어옴.");
				idList.add(0, id);
				result = ms.deleteMember(idList);
				model.addAttribute("result", result);
				model.addAttribute("msg", +result + "개 수정 완료");
				System.out.println("1개만 삭제완료. : " + result);

			} else if (id == null && ids != null) { // id가 체크박스를 통해 넘어온경우.
				System.out.println("id가 체크박스로 1개 or 여러개 넘어옴.");
				System.out.println("체크박스로 넘어온 ID의 갯수 : " + ids.length);
				idList = Arrays.asList(ids);
				result = ms.deleteMember(idList);
				model.addAttribute("result", result);
				model.addAttribute("msg", +result + "개 수정 완료");
				System.out.println("여러명 삭제 완료 : " + result);
			}
		} else { // 모든값이 Null이라면.
			model.addAttribute("result", result);
			model.addAttribute("msg", "수정할 회원을 선택하세요.");
			System.out.println("체크박스가 선택되지않음. " + result);

		}
		return "./master/member/masterMemberDelete";
	}
	
	// 회원 옵션별 검색
	@RequestMapping("masterMemberSearch.do")
	public String masterMemberSearch(Search search, Model model) {
		
		System.out.println(search.getKeyword());
		System.out.println(search.getSearchtype());
		
		if(search.getKeyword() != "" && search.getSearchtype() != "") {
			List<Member> list = ms.searchMember(search);
			System.out.println(list);
			model.addAttribute("list", list);
			//return "./master/product/masterProductList";
		}
		if(search.getKeyword() == "" && search.getSearchtype() != "") {
			model.addAttribute("type", "notKey");
			model.addAttribute("msg", "검색어를 입력해 주세요.");
			return "./master/product/masterMoveProductList";
		}
		if(search.getKeyword() != "" && search.getSearchtype() == "") {
			model.addAttribute("type", "notType");
			model.addAttribute("msg", "검색타입을 선택해 주세요.");
			return "./master/product/masterMoveProductList";
		}
		if(search.getKeyword() == "" && search.getSearchtype() == "") {
			model.addAttribute("type", "notKeynotType");
			model.addAttribute("msg", "검색타입 & 검색어를 입력해 주세요.");
			return "./master/product/masterMoveProductList";
		}
		
		return "./master/member/masterMemberList";
	}

}































