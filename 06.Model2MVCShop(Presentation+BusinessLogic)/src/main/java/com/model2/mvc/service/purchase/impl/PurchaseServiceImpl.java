package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDao;
import com.model2.mvc.service.purchase.PurchaseService;

@Service("purchaseDaoImpl")
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	@Qualifier("purcahseDaoImpl")
	private PurchaseDao purchaseDao;
	
	/**
	 * @param purchaseDao
	 */
	
	/**
	 * @param purchaseDao
	 */
	public PurchaseServiceImpl(PurchaseDao purchaseDao) {
		super();
		this.purchaseDao = purchaseDao;
	}


	@Override
	public void addPurchase(Purchase purchase) throws Exception {
		// TODO Auto-generated method stub
		purchaseDao.addPurchase(purchase);
		
	}


	@Override
	public Purchase getPurchase(int tranNO) throws Exception {
		// TODO Auto-generated method stub
		return purchaseDao.getPurchase(tranNO);
	}

	@Override
	public Map<String, Object> getPurchaseList(Search search) throws Exception {
		// TODO Auto-generated method stub
		List<Purchase> list = purchaseDao.getPurchseList(search);
		int totalCount =  purchaseDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void updatePurchase(Purchase purchase) throws Exception {
		// TODO Auto-generated method stub
		purchaseDao.updatePurchase(purchase);
		
	}

	@Override
	public void updateTranCode(Purchase purchase) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
