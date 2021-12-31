package com.today.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.today.DAO.boardDAO;
import com.today.DTO.boardDTO;

@WebServlet("/WriteService")
public class WriteService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();

		String uri = request.getRequestURI();
		String path = request.getContextPath();
        String m_article_imgpath = "C:/Users/smhrd/git/TodayIs/WebContent/UploadWrite";    
        int maxSize = 15*1024*1024; // 15MB
        String encoding = "UTF-8";
        MultipartRequest mr = new MultipartRequest(request, m_article_imgpath, maxSize, encoding, new DefaultFileRenamePolicy());	
        
		String m_article_subject = mr.getParameter("m_article_subject");
		String m_article_content = mr.getParameter("m_article_content");
		String mb_id = mr.getParameter("mb_id");
		String m_article_region = mr.getParameter("m_article_region");	
		String m_board_type = mr.getParameter("inputArticle-Sort");
		String m_article_img = mr.getParameter("m_article_img");
		String m_article_img_name ="UploadWrite/" + mr.getParameter("m_article_img_name");
		int m_article_seq =0;
		boardDAO dao = new boardDAO();
		
		// 값이 제대로 뽑히는지 테스트
		System.out.println(m_article_subject);
		System.out.println(m_article_content);
		System.out.println(mb_id);
		System.out.println(m_article_region);
		System.out.println(m_article_img_name);
	    System.out.println(m_board_type);
	    System.out.println(uri);
	    System.out.println(path);
	    
	    int cnt = 0;
	    if(m_board_type.equals("메인 게시판")) {
	    	cnt =dao.Tboard_insert(m_article_seq, m_article_subject, m_article_content, m_article_img_name, mb_id, m_article_region);
	    } else if (m_board_type.equals("미션 게시판")) {
	    	cnt =dao.Mboard_insert(m_article_subject, m_article_content, m_article_img_name, mb_id, m_article_region);
	    }	
	    	
	    	
		if (cnt > 0) {
			boardDTO board_dto = new boardDTO(cnt ,m_article_subject, m_article_content, m_article_img_name, mb_id, m_article_region, m_board_type);
			session.setAttribute("board_dto", board_dto); 
			response.sendRedirect("t_community_board.jsp");
			
			
		} else {
			response.sendRedirect("t_write.jsp");
			System.out.println("연결확인");
		}
	}

}
