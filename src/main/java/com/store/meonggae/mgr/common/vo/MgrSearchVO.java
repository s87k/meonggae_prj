package com.store.meonggae.mgr.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

import lombok.AllArgsConstructor;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MgrSearchVO {
	private int startNum,endNum;
	private String field, keyword, currentPage;
}
