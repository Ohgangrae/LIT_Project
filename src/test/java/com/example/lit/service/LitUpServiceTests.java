package com.example.lit.service;

import com.example.lit.domain.vo.ListDTO;
import com.example.lit.domain.vo.SearchDTO;
import com.example.lit.domain.vo.review.ReviewDTO;
import com.example.lit.domain.vo.review.ReviewFileVO;
import com.example.lit.service.review.LitUpService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
public class LitUpServiceTests {
    @Autowired
    private LitUpService litUpService;

    @Test
    public void searchReview(){
        SearchDTO searchDTO = new SearchDTO();

        searchDTO.setCategory("hobby");
        searchDTO.setKeyword("");
        searchDTO.setType("review_number");

        litUpService.searchReview(searchDTO).stream().map(ReviewDTO::toString).forEach(log::info);
    }

    @Test
    public void getList2Test(){
        ListDTO listDTO = new ListDTO();
        listDTO.setOrder("new");
        litUpService.getList2(listDTO).stream().map(ReviewDTO::toString).forEach(log::info);
    }

    @Test
    public void getImgsTest(){
        litUpService.getImgs(67L).stream().map(ReviewFileVO::toString).forEach(log::info);
    }
}