package com.store.meonggae.product.domain;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class SellOtherPrdDomain {
	private String goodsNum, imgName, priceFm;
	private int memNumSell;
}
