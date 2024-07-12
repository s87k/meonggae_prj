package com.store.meonggae.my.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class InquiryDetailDomain {
	
	private int writerNum;
	private String inquiryNum, title, category, contents, 
					answerFlag, answerContents, deleteFlag;
	private Date inputDate, answerDate;
	
}
