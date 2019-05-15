package cafe.jjdev.mall.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.spi.DirStateFactory.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cafe.jjdev.mall.mapper.ProductCommonMapper;
import cafe.jjdev.mall.vo.Board;
import cafe.jjdev.mall.vo.ProductCommon;

@Service
@Transactional
public class ProductCommonService {
	@Autowired
	private ProductCommonMapper productCommonMapper;
	// 1. 서비스 페이징(카운터) 리스트
	public Map<String, Object> getProductCommonListByCategoryNo(int categoryNo, int currentPage, String searchWord){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNo", categoryNo);
		map.put("searchWord", "%"+searchWord+"%");
		final int ROW_PER_PAGE = 10;
		int StartRow = (currentPage-1)*ROW_PER_PAGE;
		map.put("startRow", StartRow);
		map.put("rowPerPage", ROW_PER_PAGE);
		
		List<ProductCommon> list = productCommonMapper.selectProductCommonList(map);				
		
		int productCommonCount = productCommonMapper.selectProductCommonCount(categoryNo);
		int lastPage = productCommonCount/ROW_PER_PAGE;
		if(productCommonCount%ROW_PER_PAGE != 0) {
			lastPage++;
		}
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("lastPage", lastPage);
		resultMap.put("productCommonCount", productCommonCount);
		return resultMap;
	}
	// 2. 서비스 상세보기 
	//public ProductCommon getProductCommon(int categoryNo, int productCommonNo) {
		//System.out.println("상세보기 서비스 카테고리넘버"+categoryNo);
		//System.out.println("상세보기 서비스 프로덕트커먼넘버"+productCommonNo);	
		//return productCommonMapper.selectProductCommonByOne(productCommonNo);
	//}
	public ProductCommon getProductCommon(int productCommonNo) {
		
		return productCommonMapper.selectProductCommonByCategory(productCommonNo);
		}
	
}
