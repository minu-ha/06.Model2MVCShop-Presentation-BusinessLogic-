package com.model2.mvc.service.purchase;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

public interface PurchaseDao {

	
	//insert
	public void addPurchase(Purchase purchase) throws Exception;
	
	//select one
	public Purchase getPurchase(int tranNo) throws Exception;
	
	//select list
	public List<Purchase> getPurchseList(Search search) throws Exception;
	
	
	//update
	public void updatePurchase(Purchase purchase) throws Exception;
	
	// 게시판 Page 처리를 위한 전체 Row(totalCount)  return
	public int getTotalCount(Search search) throws Exception;
	
}
