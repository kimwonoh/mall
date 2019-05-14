package cafe.jjdev.mall.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cafe.jjdev.mall.service.ProductCommonService;
import cafe.jjdev.mall.vo.ProductCommon;

@Controller
public class ProductCommonController {
	
	@Autowired
	private ProductCommonService productCommonService;
	
	
	//  리스트 페이징작업
	@GetMapping(value="/product/getProductListByCategory")
	public String getProductCommonList(Model model
												,@RequestParam(value="categoryNo") int categoryNo
												,@RequestParam(value="currentPage", defaultValue = "1") int currentPage
												,@RequestParam(value="searchWord", defaultValue = "") String searchWord) {
		System.out.println("프로덕트커먼컨트롤러 카테고리넘버"+categoryNo);
		Map<String, Object> map = productCommonService.getProductCommonListByCategoryNo(categoryNo, currentPage, searchWord);
		System.out.println("프로덕트커먼컨트롤러2 카테고리넘버2"+categoryNo);
		System.out.println("프로덕트커먼컨트롤러 커런트페이지"+currentPage);
		System.out.println("프로덕트커먼컨트롤러 서치워드"+searchWord);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("productCommonCount", map.get("productCommonCount"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("categoryNo", categoryNo);
		model.addAttribute("searchWord", searchWord);

		return "/product/getProductListByCategory";
	}
	
	//상세보기
	@GetMapping(value = "/product/getProductListOneByCategory")
	public String getProductCommon(Model model, @RequestParam(value="categoryNo") int categoryNo, @RequestParam(value = "productCommonNo") int productCommonNo){
		System.out.println("프로덕트커먼컨트롤러 상세보기 카테고리넘버"+categoryNo);
		System.out.println("프로덕트커먼컨트롤러 상세보기 프로덕트커먼넘버"+productCommonNo);
		ProductCommon productCommon = productCommonService.getProductCommon(categoryNo, productCommonNo);
		System.out.println("프로덕트커먼컨트롤러 상세보기 카테고리넘버2"+categoryNo);
		System.out.println("프로덕트커먼컨트롤러 상세보기 프로덕트커먼넘버2"+productCommonNo);
		//댓글 출력, 파일보여주기
		model.addAttribute("categoryNo",categoryNo);
		model.addAttribute("productCommon",productCommon);
		
		return "/product/getProductListOneByCategory";
		}
	
}
