package com.green.home.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.company.recruit.mapper.CompanyRecruitMapper;
import com.green.company.recruit.vo.CompanyRecruitVo;

@Controller
public class SearchController {

    @Autowired
    private CompanyRecruitMapper companyRecruitMapper;

    @RequestMapping("/Search")
    public ModelAndView search(@RequestParam(value = "keyword") String keyword) {
        ModelAndView mv = new ModelAndView();
        
        // 키워드를 사용하여 데이터베이스에서 검색 결과를 가져옵니다.
        List<CompanyRecruitVo> searchResults = companyRecruitMapper.searchByKeyword(keyword);
        
        // 검색 결과를 모델에 추가합니다.
        mv.addObject("searchResults", searchResults);
        mv.addObject("keyword", keyword); // 키워드도 모델에 추가하여 뷰에서 사용 가능하게 합니다.
        
        mv.setViewName("searchResults"); // 결과를 보여줄 뷰의 이름
        return mv;
    }
}


/*
2. 공고검색 연결
4. 메뉴바 연결
*/