package cafe.jjdev.mall.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import cafe.jjdev.mall.vo.Board;
import cafe.jjdev.mall.vo.ProductCommon;


@Mapper
public interface ProductCommonMapper {
	
	//1
	public List<ProductCommon> selectProductCommonList(Map<String, Object> map);
	//2
	public ProductCommon selectProductCommonByCategory(int productCommonNo);
	//3 
	public int selectProductCommonCount(int categoryNo);
	//4
	public ProductCommon selectProductCommonByOne(int productCommonNo);
}
