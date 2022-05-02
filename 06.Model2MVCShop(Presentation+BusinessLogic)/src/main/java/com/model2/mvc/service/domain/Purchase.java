package com.model2.mvc.service.domain;

import java.sql.Date;

public class Purchase {

	private User buyer;
	private String dlvyAddr;
	private String divyDate;
	private String divyRequest;
	private Date orderData;
	private String paymentOption;
	private Product purchaseProd;
	private String receiverName;
	private String receiverPhone;
	private String tranCode;
	private int tranNo;
	
	
	


	public User getBuyer() {
		return buyer;
	}





	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}





	public String getDlvyAddr() {
		return dlvyAddr;
	}





	public void setDlvyAddr(String dlvyAddr) {
		this.dlvyAddr = dlvyAddr;
	}





	public String getDivyDate() {
		return divyDate;
	}





	public void setDivyDate(String divyDate) {
		this.divyDate = divyDate;
	}





	public String getDivyRequest() {
		return divyRequest;
	}





	public void setDivyRequest(String divyRequest) {
		this.divyRequest = divyRequest;
	}





	public Date getOrderData() {
		return orderData;
	}





	public void setOrderData(Date orderData) {
		this.orderData = orderData;
	}





	public String getPaymentOption() {
		return paymentOption;
	}





	public void setPaymentOption(String paymentOption) {
		this.paymentOption = paymentOption;
	}





	public Product getPurchaseProd() {
		return purchaseProd;
	}





	public void setPurchaseProd(Product purchaseProd) {
		this.purchaseProd = purchaseProd;
	}





	public String getReceiverName() {
		return receiverName;
	}





	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}





	public String getReceiverPhone() {
		return receiverPhone;
	}





	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}





	public String getTranCode() {
		return tranCode;
	}





	public void setTranCode(String tranCode) {
		this.tranCode = tranCode;
	}





	public int getTranNo() {
		return tranNo;
	}





	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}





	@Override
	public String toString() {
		return "Purchase [buyer=" + buyer + ", dlvyAddr=" + dlvyAddr + ", divyDate=" + divyDate + ", divyRequest="
				+ divyRequest + ", orderDate=" + orderData + ", paymentOption=" + paymentOption + ", purchaseProd="
				+ purchaseProd + ", receiverName=" + receiverName + ", receiverPhone=" + receiverPhone + ", tranCode="
				+ tranCode + ", tranNo=" + tranNo + "]";
	}
	
	
	
}
