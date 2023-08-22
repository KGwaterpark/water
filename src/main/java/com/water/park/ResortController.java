package com.water.park;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.water.park.service.BookService;
import com.water.park.service.ResortService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ResortController {
	
	@Resource(name = "resortService") 
	   private ResortService resortService; 
	
	
}
