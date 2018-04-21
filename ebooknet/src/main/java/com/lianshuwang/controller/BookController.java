package com.lianshuwang.controller;

import com.lianshuwang.domin.Book;
import com.lianshuwang.domin.BookType;
import com.lianshuwang.domin.Upload;
import com.lianshuwang.domin.User;
import com.lianshuwang.helper.PageHelper;
import com.lianshuwang.service.BookService;
import com.lianshuwang.service.UserService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by ZhangZijian on 2017/4/15.
 */
@Controller
public class BookController {

    @Autowired
    private BookService bookService;
    @Autowired
    private UserService userService;

    private static final Log logger = LogFactory.getLog(BookController.class);

    @RequestMapping(value = "/bookList")
    public String getBookList(String bookType, String smallType, @RequestParam(value = "pageId",defaultValue = "1") int pageId, Model model) {
        logger.info("you are visiting the books list page!");
        List<BookType> smallTypes;
        smallTypes = bookService.getSmallTypesOfBook(bookType);
        model.addAttribute("smallTypesOfBook", smallTypes);
        model.addAttribute("bookType",bookType);
        PageHelper page = new PageHelper();
        page.setCurrentPage(pageId);
        if (null == smallType) {
            int sumOfBooks = bookService.getTotalOfLTBooks(smallTypes);
            page.setTotalRows(sumOfBooks);
            List<Book> books = bookService.getLargeTypeBooks(smallTypes,page);
            model.addAttribute("currentPage",pageId);
            model.addAttribute("totalPage",page.getTotalPage());
            model.addAttribute("books",books);
        } else {
            int type_id = 0;
            for (BookType sBookType : smallTypes) {
                if (sBookType.getSmall_type_name().equals(smallType)) {
                    type_id = sBookType.getId();
                    break;
                }
            }
            int sumOfBooks = bookService.getTotalOfSTBooks(type_id);
            page.setTotalRows(sumOfBooks);
            List<Book> books = bookService.getSmallTypeBooks(type_id,page);
            model.addAttribute("currentPage",pageId);
            model.addAttribute("totalPage",page.getTotalPage());
            model.addAttribute("books",books);
            model.addAttribute("smallType",smallType);
        }
        return "bookList";
    }

    @RequestMapping(value = "/bookDetail")
    public String bookDetail(long bookID, Model model) {
        Book book;
        book = bookService.getBookDetail(bookID);
        Upload upload;
        upload = bookService.getUploadInfo(bookID);
        Date uploadedDate = upload.getUploadedDate();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String uploadDate = dateFormat.format(uploadedDate);
        User user;
        user = userService.queryById(upload.getUploader());
        model.addAttribute("book",book);
        model.addAttribute("uploadedDate",uploadDate);
        model.addAttribute("uploader",user.getUserName());
        model.addAttribute("format",book.getBook_format().toUpperCase());
        logger.info("you are looking up the book:" + book.getBook_title());
        return "bookDetail";
    }

    @RequestMapping(value = "/getBookCover")
    public void getBookCover(String coverPath, HttpServletResponse response) {
        InputStream in = null;
        BufferedInputStream bis = null;
        OutputStream out = null;
        BufferedOutputStream bos = null;
        File file = new File(coverPath);
        if (!file.exists() || file.isDirectory()) {
            return;
        }
        try {
            in = new FileInputStream(coverPath);
            bis = new BufferedInputStream(in);
            byte[] data = new byte[1024];
            int bytes = 0;
            out = response.getOutputStream();
            bos = new BufferedOutputStream(out);
            while ((bytes = bis.read(data, 0, data.length)) != -1) {
                bos.write(data, 0, bytes);
            }
            bos.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (bos != null) {
                    bos.close();
                }
                if (out != null) {
                    out.close();
                }
                if (bis != null) {
                    bis.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @RequestMapping(value = "/book_download")
    public void getBookDownload(long bookID, String filePath, HttpServletResponse response) {
        response.setContentType("text/html;charset=utf-8");
        String fileName = filePath.substring(filePath.lastIndexOf("/") + 1);
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
            long fileLength = new File(filePath).length();
            response.setContentType("application/x-msdownload");
            response.setHeader("Content-disposition", "attachment; filename="
                    + new String(fileName.getBytes("utf-8"), "ISO8859-1"));
            response.setHeader("Content-Length", String.valueOf(fileLength));
            bis =new BufferedInputStream(new FileInputStream(filePath));
            bos = new BufferedOutputStream(response.getOutputStream());
            byte[] buff = new byte[2018];
            int bytesRead;
            while (-1  != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (bis != null) {
                    bis.close();
                }
                if (bos != null) {
                    bos.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            bookService.addDownloadTimes(bookID);
            logger.info("you are downloading the book, the book file is " + fileName);
        }
    }

    @RequestMapping(value = "/bookSearch")
    public String bookSearch(String searchBy, String searchTxt, Model model) throws ParseException {
        logger.info("you are searching book!");
        logger.info("The search context is " + searchTxt);
        List<Book> books = bookService.searchBook(searchBy, searchTxt);
        model.addAttribute("books", books);
        model.addAttribute("searchTxt",searchTxt);
        return "searchResult";
    }

}
