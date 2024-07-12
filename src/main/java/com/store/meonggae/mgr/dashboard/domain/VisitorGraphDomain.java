package com.store.meonggae.mgr.dashboard.domain;

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
public class VisitorGraphDomain {
	private String col;
	private int allCnt, memCnt, nonMemCnt;
}
