package com.model2.mvc.web.purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;

@RestController
@RequestMapping("/purchase/json")
public class PurchaseRestController {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;


	public PurchaseRestController() {
		System.out.println(this.getClass());
	}
	
	
	@PostMapping("/addPurchase")
	public Purchase addPurchase(@RequestBody Purchase purchase) throws Exception {
		
		System.out.println("json addPurchase start");
		
		purchaseService.addPurchase(purchase);
		
		return purchase;
	}
	
	
	
}
