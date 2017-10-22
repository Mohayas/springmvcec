package springmvcec.controllers;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springmvcec.beans.Ticket;
import springmvcec.services.TicketService;
import springmvcec.services.UserService;

@Controller
public class MainController {

	@Autowired
	TicketService ticketService;
	@Autowired
	UserService userService;

	@RequestMapping(value = "/hello")
	public String Hi() {

		return "index";
	}

	@RequestMapping(value = "/tickets")
	public String getAllTickets(HttpServletRequest request) {

		request.setAttribute("tickets", ticketService.getAllTickets());

		return "index";
	}

	@RequestMapping("/ticket/{id}")
	public String getTicket(@PathVariable int id, HttpServletRequest request) {

		request.setAttribute("ticket", ticketService.findTicketById(id));
		return "ticket";
	}

	@RequestMapping("/ticket/new")
	public String goToNewTicket() {
		return "NewTicket";

	}

	@RequestMapping(value = "/ticket/add")
	public void addNewTiket(@RequestParam String subject, @RequestParam String body, @RequestParam int userId,
			HttpServletResponse response) {

		Ticket ticket = new Ticket();
		ticket.setOwner(userService.findUser(userId));
		ticket.setSubject(subject);
		ticket.setBody(body);
		ticket.setStatus("unseen");
		ticket.setCreatedAt(new Date());

		ticketService.saveTicket(ticket);
		try {
			response.sendRedirect("/tickets");
		} catch (IOException e) {
			e.printStackTrace();
		}

		// return "index";
	}

}
