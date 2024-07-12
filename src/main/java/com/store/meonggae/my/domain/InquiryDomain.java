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
public class InquiryDomain {
	
	private String inquiryNum, title, answerFlag;
	private Date inputDate;
    
}
