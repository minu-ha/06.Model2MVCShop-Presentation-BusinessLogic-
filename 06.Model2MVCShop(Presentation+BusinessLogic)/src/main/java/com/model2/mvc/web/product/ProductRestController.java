package com.model2.mvc.web.product;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/json")
public class ProductRestController {

	
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;


	public ProductRestController() {
		System.out.println(this.getClass());
	}
	
	
	@GetMapping("/getProduct/{prodNo}/{menu}")
	public Map getProduct(@PathVariable int prodNo,
			@PathVariable String menu) throws Exception{
		
		System.out.println("json getproduct start");
		
		
		Map map = new HashMap();
		
		Product product = productService.getProduct(prodNo);
		
		map.put("product", product);
		map.put("menu", menu);
		
		
		return map;
	}
}
