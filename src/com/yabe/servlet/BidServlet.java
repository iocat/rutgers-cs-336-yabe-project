package com.yabe.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yabe.model.Account;
import com.yabe.model.AutoBid;
import com.yabe.model.Bid;
import com.yabe.model.Item;
import com.yabe.model.User;

/**
 * Servlet implementation class BidServlet
 */
@WebServlet("/bid")
public class BidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BidServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Account account = (Account) request.getAttribute("account");
		String itemId = request.getParameter("item-id");
		String bidAmount = request.getParameter("bid-amount");
		boolean autoBid = Boolean.parseBoolean(request.getParameter("set-auto"));
		if (account instanceof User){
			if(!autoBid){
				Bid bid = new Bid(itemId);
				bid.setBidder((User)account);
				bid.setAmount(Float.parseFloat(bidAmount));
				bid.setTime(new Timestamp(new java.util.Date().getTime()));
				bid.update();
				new Item(bid.getItemId()).autoBid();
				response.sendRedirect("auction.jsp?id="+itemId+"#bid-history");
			}else{
				// AUTO BID SET
				Timestamp time = new Timestamp(new Date().getTime());
				Item item = new Item(itemId);
				item.retrieve();
				AutoBid bid = new AutoBid(item,Float.parseFloat(bidAmount),(User) account, time);
				bid.update();
				response.sendRedirect("auction.jsp?id="+itemId+"#bid-history");
			}
		}else{
			response.sendRedirect("login.jsp");
		}
	}

}
