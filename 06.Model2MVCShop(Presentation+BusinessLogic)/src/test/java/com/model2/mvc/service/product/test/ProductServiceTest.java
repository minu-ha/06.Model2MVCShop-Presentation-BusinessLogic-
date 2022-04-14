package com.model2.mvc.service.product.test;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations =  {"classpath:config/commonservice.xml"})
public class ProductServiceTest {
	
	//==>@RunWith,@ContextConfiguration 이용 Wiring, Test 할 instance DI
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	@Test
	public void testAddProduct() throws Exception {
		
		Product product = new Product();
		product.setProdName("test");
		product.setProdDetail("hello");
		product.setManuDate("20211230");
		product.setPrice(4542);
		product.setFileName("AHlbAAAAtBqyWAAA.jpg");
		
		productService.addProduct(product);

		//==> console 확인
		System.out.println(product);
		
	}
	
	@Test
	public void testGetProduct() throws Exception{
	
		Product product = new Product();
		
		product = productService.getProduct(35);
	}
	
	
	@Test
	public void testupdateProduct() throws Exception{
		
		Product product = productService.getProduct(35);
		
		product.setProdName("test");
		product.setProdDetail("hello");
		product.setManuDate("20211230");
		product.setPrice(4542);
		product.setFileName("AHlbAAAAtBqyWAAA.jpg");
		
		productService.updateProduct(product);
		
	}
	

}
