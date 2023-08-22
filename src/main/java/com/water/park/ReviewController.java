package com.water.park;

import java.sql.SQLException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.water.park.service.BookService;
import com.water.park.service.ReviewService;
import com.water.park.vo.ReviewVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ReviewController {

   @Resource(name = "reviewService")
   private ReviewService reviewService;

   @RequestMapping(value = "/review.do") // 쟾泥대낫湲
   public String reviewAll(Model model) throws Exception {

      ArrayList<ReviewVO> revlist = reviewService.getAllReview();

      Collections.sort(revlist, new Comparator<ReviewVO>() {
         public int compare(ReviewVO r1, ReviewVO r2) {
            return r1.getRev_date().compareTo(r2.getRev_date());
         }
      });

      model.addAttribute("revlist", revlist);

      return "mypage/myreview";

   }

   @RequestMapping(value = "/getrevinfo.do")
   public String GetRevinfo(@ModelAttribute("reviewVO") ReviewVO reviewVO, Model model) {
      // reviewService瑜 씠 슜 븯 뿬 reviewVO 뿉 由щ럭 젙蹂대 꽕 젙
      reviewVO = reviewService.getRevinfo(reviewVO);

      // model 뿉 reviewVO 媛앹껜瑜 異붽 븯 뿬 view濡 쟾 떖
      model.addAttribute("reviewVO", reviewVO);

      return "mypage/GetRevinfo";
   }

   // 마이페이지
   @RequestMapping(value = "/updaterevinfo.do")
   public String updateRevinfo(ReviewVO reviewVO, Model model) throws ClassNotFoundException, SQLException {

      reviewService.updateRevinfo(reviewVO);

      return "redirect:review.do";
   }

   @RequestMapping(value = "/deleteRevinfo.do")
   public String deleteRevinfo(ReviewVO reviewVO, Model model) throws ClassNotFoundException, SQLException {

      reviewService.deleteRevinfo(reviewVO);

      return "redirect:review.do";
   }

   @RequestMapping(value = "/re_resortinsertForm.do") // 기본 get 방식
   public String revInsertFrom(@ModelAttribute("ReviewVO") ReviewVO reviewVO, Model model) throws Exception {

      return "review/re_resortInsertForm";

   }

   @RequestMapping(value = "/rev_insertR.do", method = RequestMethod.POST)
   public String revInsert_R(@ModelAttribute("ReviewVO") ReviewVO reviewVO, Model model) {

      reviewService.insert_review_R(reviewVO);

      return "redirect:/review.do";

   }
   
   @RequestMapping(value = "/rev_insertW.do", method = RequestMethod.POST)
   public String revInsert_W(@ModelAttribute("ReviewVO") ReviewVO reviewVO, Model model) {

      reviewService.insert_review_W(reviewVO);

      return "redirect:/review.do";

   }

   
    // 워터파크
    
      
       @RequestMapping(value = "/water_review.do") // 쟾泥대낫湲 public String
       public String WaterreviewAll(Model model) throws Exception {
       
       ArrayList<ReviewVO> revlist = reviewService.getAllReviewWater();
       
       model.addAttribute("revlist", revlist);
       
       Collections.sort(revlist, new Comparator<ReviewVO>() { public int
       compare(ReviewVO r1, ReviewVO r2) { return
       r1.getRev_date().compareTo(r2.getRev_date()); } });
       model.addAttribute("revlist", revlist);
       
       return "review/water_review";
       
       }
       
   

   // 객실
   @RequestMapping(value = "/resort_review.do") // 쟾泥대낫湲
   public String ResortreviewAll(Model model) throws Exception {

      ArrayList<ReviewVO> revlist = reviewService.getAllReviewResort();

      model.addAttribute("revlist", revlist);

      Collections.sort(revlist, new Comparator<ReviewVO>() {
         public int compare(ReviewVO r1, ReviewVO r2) {
            return r1.getRev_date().compareTo(r2.getRev_date());
         }
      });
      model.addAttribute("revlist", revlist);

      return "review/resort_review";

   }

   @RequestMapping(value = "/pakage_review.do") // 쟾泥대낫湲
   public String PakagereviewAll(Model model) throws Exception {

      ArrayList<ReviewVO> revlist = reviewService.getAllReviewPakage();

      model.addAttribute("revlist", revlist);

      Collections.sort(revlist, new Comparator<ReviewVO>() {
         public int compare(ReviewVO r1, ReviewVO r2) {
            return r1.getRev_date().compareTo(r2.getRev_date());
         }
      });
      model.addAttribute("revlist", revlist);

      return "review/pakage_review";

   }

   //어드민
   @RequestMapping(value = "/adminreviewW.do") // 쟾泥대낫湲
   public String Waterreview(Model model) throws Exception {

      ArrayList<ReviewVO> revlist = reviewService.AllReviewWater();

      model.addAttribute("revlist", revlist);

      Collections.sort(revlist, new Comparator<ReviewVO>() {
         public int compare(ReviewVO r1, ReviewVO r2) {
            return r1.getRev_date().compareTo(r2.getRev_date());
         }
      });
      model.addAttribute("revlist", revlist);

      return "admin/adminReview/adminreviewW";

   }
   
   @RequestMapping(value = "/adminreviewR.do") // 쟾泥대낫湲
   public String resortreview(Model model) throws Exception {

      ArrayList<ReviewVO> revlist = reviewService.AllReviewResort();

      model.addAttribute("revlist", revlist);

      Collections.sort(revlist, new Comparator<ReviewVO>() {
         public int compare(ReviewVO r1, ReviewVO r2) {
            return r1.getRev_date().compareTo(r2.getRev_date());
         }
      });
      model.addAttribute("revlist", revlist);

      return "admin/adminReview/adminreviewR";

   }
   
   @RequestMapping(value = "/adminreviewP.do") // 쟾泥대낫湲
   public String pakagereview(Model model) throws Exception {

      ArrayList<ReviewVO> revlist = reviewService.AllReviewPakage();

      model.addAttribute("revlist", revlist);

      Collections.sort(revlist, new Comparator<ReviewVO>() {
         public int compare(ReviewVO r1, ReviewVO r2) {
            return r1.getRev_date().compareTo(r2.getRev_date());
         }
      });
      model.addAttribute("revlist", revlist);

      return "admin/adminReview/adminreviewP";

   }
   
   @RequestMapping(value = "/admingetrevinfoW.do")
   public String adminGetRevinfoW(@ModelAttribute("reviewVO") ReviewVO reviewVO, Model model) {
      // reviewService瑜 씠 슜 븯 뿬 reviewVO 뿉 由щ럭 젙蹂대 꽕 젙
      reviewVO = reviewService.getadminRevinfoW(reviewVO);

      // model 뿉 reviewVO 媛앹껜瑜 異붽 븯 뿬 view濡 쟾 떖
      model.addAttribute("reviewVO", reviewVO);

      return "admin/adminReview/adminGetRevinfoW";
   }
   
   @RequestMapping(value = "/admingetrevinfoR.do")
   public String adminGetRevinfoR(@ModelAttribute("reviewVO") ReviewVO reviewVO, Model model) {
      // reviewService瑜 씠 슜 븯 뿬 reviewVO 뿉 由щ럭 젙蹂대 꽕 젙
      reviewVO = reviewService.getadminRevinfoR(reviewVO);

      // model 뿉 reviewVO 媛앹껜瑜 異붽 븯 뿬 view濡 쟾 떖
      model.addAttribute("reviewVO", reviewVO);

      return "admin/adminReview/adminGetRevinfoR";
   }
   
   @RequestMapping(value = "/admingetrevinfoP.do")
   public String adminGetRevinfoP(@ModelAttribute("reviewVO") ReviewVO reviewVO, Model model) {
      // reviewService瑜 씠 슜 븯 뿬 reviewVO 뿉 由щ럭 젙蹂대 꽕 젙
      reviewVO = reviewService.getadminRevinfoP(reviewVO);

      // model 뿉 reviewVO 媛앹껜瑜 異붽 븯 뿬 view濡 쟾 떖
      model.addAttribute("reviewVO", reviewVO);

      return "admin/adminReview/adminGetRevinfoP";
   }
   
   /*
    * @RequestMapping(value = "/deleteadminRevinfo.do") public String
    * deleteadminRevinfo(ReviewVO reviewVO, Model model) throws
    * ClassNotFoundException, SQLException {
    * 
    * reviewService.deleteRevinfo(reviewVO);
    * 
    * return "redirect:admin.do"; }
    */
   
   @RequestMapping(value = "/deleteadminRevinfoW.do")
   public String deleteadminRevinfoW(ReviewVO reviewVO, Model model) throws ClassNotFoundException, SQLException {

      reviewService.deleteRevinfoW(reviewVO);

      //return "redirect:admingetrevinfoW.do";
      return "redirect:adminreviewW.do";
   }
   @RequestMapping(value = "/deleteadminRevinfoR.do")
   public String deleteadminRevinfoR(ReviewVO reviewVO, Model model) throws ClassNotFoundException, SQLException {

      reviewService.deleteRevinfoR(reviewVO);

      //return "redirect:admingetrevinfoW.do";
      return "redirect:adminreviewR.do";
   }
   
   @RequestMapping(value = "/deleteadminRevinfoP.do")
   public String deleteadminRevinfoP(ReviewVO reviewVO, Model model) throws ClassNotFoundException, SQLException {

      reviewService.deleteRevinfoP(reviewVO);

      //return "redirect:admingetrevinfoW.do";
      return "redirect:adminreviewP.do";
   }
   
   

}