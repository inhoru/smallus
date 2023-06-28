package com.smallus.classes.model.vo;

import java.util.Date;

import com.smallus.host.model.vo.Host;
import com.smallus.member.model.vo.Wishlist;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Classes {
	private String classId;
	private String hostId;
	private String categoryId;
	private String classTitle;

	private int classPersonnel;
	private int classPrice;

	private String classAddress;
	private String classOffer;
	private String classSupplies;
	private String classNotice;
	private String classDetail;
	private String classStatus;
	private Date classUpLoadDate;
	private Date classPassDate;
	private String classPassId;
	private String classThumbnail;
	private String categoryTitle;
	
	private String hostNickname;
	
	
	private Wishlist wishlist;
	private Category Category;
	
	@Override
	public String toString() {
		return classId+","+categoryTitle+","+classTitle+","+classUpLoadDate+","+classPassDate+","+classPassId+","+classThumbnail+","+classStatus;
	}
	
	
	
}
