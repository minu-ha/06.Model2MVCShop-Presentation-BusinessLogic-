package com.model2.mvc.web.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;

@Controller
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
	
	
	@RequestMapping("/addProductView.do")
	public String addProductView() throws Exception {

		System.out.println("/addUserView.do");
		
		return "redirect:/product/addProductView.jsp";
	}
	
	@RequestMapping("/addProduct.do")
	public String addProduct( @ModelAttribute("product") Product product ) throws Exception {

		System.out.println("/addPrdouct.do");
		//Business Logic
		productService.addProduct(product);
		
		return "redirect:/product/getProduct.jsp";
	}
	
	@RequestMapping("/getProduct.do")
	public String getProduct( @RequestParam("prdoNo") int prdoNo, Model model )  throws Exception {

		System.out.println("/getPrdouct.do");
		
		//Business Logic
		Product product = productService.getProduct(prdoNo);
		//connect product
		model.addAttribute("product", product);
		
		return "forward:/product/getProduct.jsp";
	}
	
	@RequestMapping("/updateProductView.do")
	public String updateProductView( @RequestParam("prdoNo") int prdoNo, Model model ) throws Exception{

		System.out.println("/updateProductView.do");
		//Business Logic
		Product product = productService.getProduct(prdoNo);
		//connect product
		model.addAttribute("product", product);
		
		return "forward:/product/updateProduct.jsp";
	}
	
	@RequestMapping("/updateProduct.do")
	public String updateProduct(  @ModelAttribute("product") Product product,
			                      HttpSession session,
								  Model model ) throws Exception{

		System.out.println("/updateProductView.do");
		//Business Logic
		productService.updateProduct(product);
		
		Integer sessionId=((Product)session.getAttribute("product")).getProdNo();
		if(sessionId.equals(product.getProdNo())){
			session.setAttribute("product", product);
		}
		
		return "redirect:/product/getProduct.do?prodNo="+product.getProdNo();
	}
	
	@RequestMapping("/listProduct.do")
	public String listProduct(@ModelAttribute("search") Search search,
							   HttpServletRequest request,
							   Model model) throws Exception{
		
		System.out.println("/listProduct.do");
		
		String menu = "search";	
		if(request.getParameter("menu") != null) {
			menu = request.getParameter("menu");
		}
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);
				
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		return "forward:/product/listProduct.jsp;";
		
	}
	
	
	
	
}
