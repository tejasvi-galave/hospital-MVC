package com.hospital.Dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PageResponse<T> {

	private List<T> content;
	private int currentPage;
	private int totalPages;
	private int pageSize;
	private long totalElements;
}
