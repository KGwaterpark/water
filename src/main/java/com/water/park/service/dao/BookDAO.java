package com.water.park.service.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.water.park.vo.BookVO;
import com.water.park.vo.Ocean_bookVO;
import com.water.park.vo.Package_bookVO;
@Mapper
public interface BookDAO {

	ArrayList<BookVO> getAllBook();
	ArrayList<BookVO> getBooked( @Param("outdate") String outdate,@Param("indate") String indate) throws SQLException;
	void insertresort_book(BookVO bookVO);
	void insertpackage_book(Package_bookVO package_bookVO);
	void insertw_package_book(Package_bookVO package_bookVO);
	void insertocean_book(Ocean_bookVO ocean_bookVO);



}
