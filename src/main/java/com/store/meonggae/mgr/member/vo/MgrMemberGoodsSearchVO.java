package com.store.meonggae.mgr.member.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

import com.store.meonggae.mgr.goods.vo.MgrGoodsSearchVO;

import lombok.AllArgsConstructor;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MgrMemberGoodsSearchVO extends MgrGoodsSearchVO {
	private int memNum;
	private String trade;
}
