package boss.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import boss.common.PagePgm;
import boss.common.Search;
import boss.model.Amount;
import boss.model.Product;
import boss.service.MasterProductService;

@Controller
public class MasterProductController {

	@Autowired
	MasterProductService service;

	/*
	 * 상품 1개 상세보기
	 */
	@RequestMapping("masterProductDetail.do")
	public String masterProductDetail(String id, Model model) {

		System.out.println("id : " + id);
		// 상품 상세정보 구하기
		Product product = service.selectOne(id);

		// 재고 구하기
		Amount amount = service.selectAmount(id);

		model.addAttribute("product", product);
		model.addAttribute("amount", amount);

		return "./master/product/masterProductDetail";
	}

	/*
	 * 상품리스트 페이지 이동 메소드 + 페이징 처리
	 */
	@RequestMapping("masterProductList.do")
	public String masterProductList(PagePgm page, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		// 총상품 갯수
		int totalCount = service.totalCount();
		System.out.println(totalCount + "개");

		// 재고 갯수
		// int amountCount = service.amountCount();

		page = new PagePgm(totalCount, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		// 페이징 처리된 리스트
		List<Product> list = service.selectList(page);
		System.out.println(list);
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		return "./master/product/masterProductList";
	}

	/*
	 * 상품 등록 폼 이동 메소드
	 */
	@RequestMapping("masterProductInsertForm.do")
	public String masterProductInsertForm() {
		System.out.println("masterProductInsertForm");
		return "./master/product/masterProductInsertForm";
	}

	/*
	 * 신규 상품 등록 메소드
	 */
	@RequestMapping(value = "masterProductInsert.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String productInsert(Product product, Model model, @RequestParam("acount") String acount,
			@RequestParam(value = "pimage1", required = false) MultipartFile mfile, HttpServletRequest request)
			throws Exception {
		System.out.println("acount : " + acount);

		int result = 0;
		int sizeCheck, extensionCheck;
		// 첨부 파일명
		String filename = mfile.getOriginalFilename();
		System.out.println("파일이름" + filename);
		// 첨부 파일 사이즈 (Byte)
		int size = (int) mfile.getSize();
		// 파일 저장될 경로

		String path = "C:\\bossRepository\\boss\\src\\main\\webapp\\images";

		System.out.println("oldpath : " + path);
		// String path = request.getRealPath("upload");
		System.out.println(path);

		// 확장자 잘라서 저장할 배열
		String[] file = new String[2];

		// 새로운 파일명 저장 번수
		String newfilename = "";

		if (filename != "") { // 첨부 파일이 전송된 경우
			// .뒤에 확장자만 자르기
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());

			UUID uuid = UUID.randomUUID();

			// 난수를 발생시켜 중복 문제 해결후 확장자 결합
			newfilename = uuid.toString() + extension;

			// 확장자를 구분해 조건을 주기 위해 잘라줌 file[1] 에 확장자가 저장됨.
			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken();
			file[1] = st.nextToken();

			if (size > 10000000) {
				// 사이즈가 설정된 범위 초과할 경우
				sizeCheck = -1;
				model.addAttribute("sizeCheck", sizeCheck);
				System.out.println("설정범위 초과");
				return "./master/product/masterMoveProductList";

				// 확장자가 jpg, png, jpeg, gif 가 아닐경우
			} else if (!file[1].equals("jpg") && !file[1].equals("png") && !file[1].equals("jpeg")
					&& !file[1].equals("gif")) {
				extensionCheck = -1;
				model.addAttribute("extensionCheck", extensionCheck);

				return "./master/product/masterMoveProductList";
			}

		}

		// 첨부파일이 전송된 경우
		if (size > 0) {
			mfile.transferTo(new File(path + "/" + newfilename));
			product.setPimage(newfilename);
			System.out.println("전송됐음!!");
		}

		System.out.println("여기는?");

		// 상품 등록
		result = service.productInsert(product);
		System.out.println("여기는22?");
		int amount = Integer.parseInt(acount);

		Map map = new HashMap();

		Product pro = service.changeList();
		System.out.println("pid : " + pro.getPid());
		System.out.println("pname : " + product.getPname());
		map.put("pname", product.getPname());
		map.put("amount", amount);
		map.put("pro", pro.getPid());

		// 상품 등록 시 재고 수량 등록
		int amCount = service.amountInsert(map);
		System.out.println("amCount : " + amCount);

		if (result == 1) {
			System.out.println("첨부파일 포함된 상품등록 성공");

		} else {
			System.out.println("첨부파일 포함된 상품등록 실패");
		}

		model.addAttribute("product", product);
		model.addAttribute("msg", "productInsertTrue");
		System.out.println("???????");

		return "./master/product/masterMoveProductList";
	}

	/*
	 * 상품 수정 페이지 이동 메소드
	 */
	@RequestMapping("masterProductUpdateForm.do")
	public String masterProductUpdateForm(String id, Model model) {

		// 상품 상세정보 구하기
		Product product = service.selectOne(id);
		Amount amount = service.selectAmount(id);
		model.addAttribute("msg", "updateTrue");
		model.addAttribute("product", product);
		model.addAttribute("amount", amount);
		return "./master/product/masterProductUpdateForm";
	}

	/*
	 * 상품 수정 메소드
	 */
	@RequestMapping("masterProductUpdate.do")
	public String masterProductUpdate(Product product, @RequestParam("acount") String acount, Model model) {

		String id = String.valueOf(product.getPid());

		Product pro = service.selectOne(id);
		System.out.println("id : " + id);

		Date date = pro.getPreg();

		int update = service.updateProduct(product);
		System.out.println(update);

		Map map = new HashMap();
		map.put("pid", id);
		map.put("acount", acount);

		// pid와 수정갯수를 넘겨서 업데이트
		int updateAmountCount = service.updateAmount(map);

		model.addAttribute("date", date);
		model.addAttribute("msg", "updateProductTrue");
		model.addAttribute("product", product);
		model.addAttribute("pid", id);
		model.addAttribute("id", id);

		return "redirect:/masterProductUpdateForm.do";
	}

	/*
	 * 상품 검색 메소드
	 */
	@RequestMapping("masterProductSearch.do")
	public String masterProductSearch(Search search, Model model) {

		System.out.println(search.getKeyword());
		System.out.println(search.getSearchtype());

		List<Product> list = service.searchList(search);
		System.out.println(list);
		model.addAttribute("list", list);
		return "./master/product/masterProductList";
	}

	/*
	 * 상품 전체 삭제 메소드
	 */
	@RequestMapping("masterProductDelete.do")
	public String masterMemberDelete(String id, Model model, HttpServletRequest request) {
		System.out.println("masterProductDelete");
		System.out.println("pid :" + id);

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
				result = service.deleteProduct(idList);
				model.addAttribute("resultDelete", result); // moveProduct.jsp에 동일한 result 변수명이 있어 임의로 변경함 (필요시 변경해서
															// 쓰시길)
				model.addAttribute("msg", +result + "개 수정 완료");
				System.out.println("1개만 삭제완료. : " + result);

			} else if (id == null && ids != null) { // id가 체크박스를 통해 넘어온경우.
				System.out.println("id가 체크박스로 1개 or 여러개 넘어옴.");
				System.out.println("체크박스로 넘어온 ID의 갯수 : " + ids.length);
				idList = Arrays.asList(ids);
				result = service.deleteProduct(idList);
				model.addAttribute("resultDelete", result);
				model.addAttribute("msg", +result + "개 수정 완료");
				System.out.println("여러명 삭제 완료 : " + result);

			}
		} else { // 모든값이 Null이라면.
			model.addAttribute("result", result);
			model.addAttribute("msg", "수정할 글을 선택하세요.");
			System.out.println("체크박스가 선택되지않음. " + result);

		}

		return "./master/product/masterMoveProductList";
	}

}
