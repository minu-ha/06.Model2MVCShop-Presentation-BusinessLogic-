package com.model2.mvc.web.product;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	//field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	
	public ProductController() {
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml 참조 할것
	//==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	@GetMapping("/addProduct")
	public String addProduct(@RequestParam String menu,Model model) throws Exception {

		System.out.println("/addUser get");
		model.addAttribute("menu", menu);
		
		return "/product/addProductView.jsp";
	}
	
	@PostMapping("/addProduct")
	public String addProduct( @ModelAttribute Product product ) throws Exception {

		System.out.println("/addProduct post");
		//Business Logic
		productService.addProduct(product);
		
		return "forward:/product/getProduct.jsp";
	}
	
	@GetMapping("/getProduct")
	public String getProduct( @RequestParam int prodNo,
							  @RequestParam String menu,
							  Model model)  throws Exception {

		System.out.println("/getProduct get");
		System.out.println(prodNo);
		//Business Logic
		Product product = productService.getProduct(prodNo);
		
		//connect product
		model.addAttribute("product", product);
		model.addAttribute("menu", menu);
		
		return "forward:/product/getProduct.jsp";
	}
	
	@GetMapping("/updateProduct")
	public String updateProduct( @RequestParam int prodNo, 
							     Model model ) throws Exception{

		System.out.println("/updateProduct get");
		//Business Logic
		Product product = productService.getProduct(prodNo);
		//connect product
		model.addAttribute("product", product);
		
		
		System.out.println(prodNo);
		
		return "forward:/product/updateProduct.jsp";
	}
	
	
	@PostMapping("/updateProduct")
	public String updateProduct(  @ModelAttribute Product product,
								  Model model ) throws Exception{

		System.out.println("/updateProduct post");
		//Business Logic
		productService.updateProduct(product);

		System.out.println("9");
		
		
		
		System.out.println("11");
		
		return "redirect:/product/getProduct?prodNo="+product.getProdNo()+"&menu=manage";
	}
	
	@RequestMapping("/listProduct")
	public String listProduct(@ModelAttribute Search search,
							   HttpServletRequest request,
							   Model model) throws Exception{
		
		System.out.println("/listProduct post");
		
	
		String menu = "";	
		if(request.getParameter("menu") != null) {
			menu = request.getParameter("menu");
		}
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		System.out.println(menu);

		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
				
				
		Page resultPage = new Page(   search.getCurrentPage()
									,((Integer)map.get("totalCount")).intValue()
									, pageUnit
									, pageSize);
		
		System.out.println(resultPage);
		
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		model.addAttribute("menu", menu);
		
		
		
		return "forward:/product/listProduct.jsp;";
		
	}
	
}
