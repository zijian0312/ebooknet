package com.lianshuwang.controller;

import com.lianshuwang.helper.RankingBook;
import com.lianshuwang.service.BookService;
import com.lianshuwang.util.PropertyConfigurer;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class MainController {

    private static final Log logger = LogFactory.getLog(MainController.class);

    @Autowired
    private BookService bookService;

    @RequestMapping(value = "/index")
    public String index(Model model) {
        logger.info("Welcome to gatheringbook.cn!");
        String name = (String)PropertyConfigurer.getProperty("book_path");
        System.out.println("hello, " + name);
        int sumOfBooks = bookService.queryNumberOfBooks();
        model.addAttribute("sumOfBooks", sumOfBooks);
        List<Integer> everyTypeBooks;
        everyTypeBooks = bookService.queryNumberOfSomeTypeBooks();
        model.addAttribute("sumOfTypeBooks",everyTypeBooks);
        String maxUploadDate = bookService.getMaxUploadDate();
        model.addAttribute("maxUploadDate", maxUploadDate);
        List<RankingBook> rankingBooks;
        rankingBooks = bookService.queryByUploadedDate();
        model.addAttribute("rankingBooks",rankingBooks);
        List<RankingBook> rankingBooks1;
        rankingBooks1 = bookService.queryByDownloadTimes();
        model.addAttribute("rankingBooks1",rankingBooks1);
        return "main";
    }
}
