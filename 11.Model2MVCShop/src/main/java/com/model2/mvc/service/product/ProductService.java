package com.model2.mvc.service.product;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;


//==> ȸ���������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface ProductService {
	
	public Product addProduct(Product product) throws Exception;
	
	public Product getProduct(int prodNo) throws Exception;
	
	public Map<String, Object> getProductList(Search search) throws Exception;
	
	public Product updateProduct(Product prod) throws Exception;
	
	public List<Product> getList(String searchCondition,String searchKeyword) throws Exception;
	
}