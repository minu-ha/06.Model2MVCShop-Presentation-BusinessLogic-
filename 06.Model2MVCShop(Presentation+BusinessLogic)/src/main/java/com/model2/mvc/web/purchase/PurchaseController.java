package com.model2.mvc.web.purchase;

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
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.product.impl.ProductServiceImpl;
import com.model2.mvc.service.purchase.PurchaseService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	
	//field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	
	
	public PurchaseController() {
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
	
	

	
	@GetMapping("/addPurchase")
	public String addPurchase( @RequestParam int prodNo, 
								Model model) throws Exception {

		System.out.println("/addPurchase post");

		//Business Logic
		System.out.println("prodNo : " + prodNo);
		
		Product product = productService.getProduct(prodNo);
		model.addAttribute(product);
		return "forward:/purchase/addPurchaseView.jsp";
	}
	
	@PostMapping("/addPurchase")
	public String addPurchase(@ModelAttribute Product product
			,@ModelAttribute Purchase purchase, 
			HttpSession session,Model model) throws Exception {
		
		purchase.setBuyer((User)session.getAttribute("user"));
		
		purchase.setPurchaseProd(product);
		purchaseService.addPurchase(purchase);
		
		model.addAttribute(purchase);
		
		return "forward:/purchase/getPurchase.jsp";
	}
	

	
	@GetMapping("/updatePurchase")
	public String updatePurchase( @RequestParam int tranNo, 
							     Model model ) throws Exception{

		System.out.println("/updatePurchase get");
		//Business Logic
		Purchase purchase = purchaseService.getPurchase(tranNo);
		//connect product
		model.addAttribute("purchase", purchase);
		
		System.out.println(purchase.getOrderDate());
		
		return "forward:/purchase/updatePurchaseView.jsp";
	}
	
	
	@PostMapping("/updatePurchase")
	public String updatePurchase(  @ModelAttribute Purchase purchase,
								  Model model ) throws Exception{

		System.out.println("/updatePurchase post");
		//Business Logic
		purchaseService.updatePurchase(purchase);

		System.out.println("9");
		
		
		
		System.out.println("11");
		
		return "redirect:/purchase/getPurchase?tranNo="+purchase.getTranNo();
	}
	
	@RequestMapping("/listPurchase")
	public String listPurchase(@ModelAttribute Search search,
							   HttpServletRequest request,
							   Model model) throws Exception{
		
		System.out.println("/listPurchase post");
		
	
		String menu = "";	
		if(request.getParameter("menu") != null) {
			menu = request.getParameter("menu");
		}
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		
		// Business logic 수행
		Map<String , Object> map=purchaseService.getPurchaseList(search);
				
				
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
		
		
		
		return "forward:/product/listPurchase.jsp;";
		
	}
	
}
