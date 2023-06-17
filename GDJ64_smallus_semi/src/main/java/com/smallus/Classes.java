package com.smallus;

import java.util.Date;

import com.smallus.host.model.vo.Host;

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
	private Host hostId;
	private String classTitle;
	private String classPersonnel;
	private String classPrice;
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

	@Override
	public String toString() {
		return classId+","+classTitle+","+classPersonnel;
	}
}
