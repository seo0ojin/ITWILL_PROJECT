package com.itwill.shop.product;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class Spec {
	private int specNo;
	private String specNetwork;
	private String specBrand;
	private Date specRelease;
	private String specColor;
	private String specDisplay;
	private String specSize;
	private String specWeight;
	private String specRam;
	private String specBattery;
	private String specOs;
	private String specCam;
}
