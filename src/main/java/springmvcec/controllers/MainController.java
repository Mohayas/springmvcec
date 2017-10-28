package springmvcec.controllers;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import springmvcec.beans.Action;
import springmvcec.beans.Message;
import springmvcec.beans.Ticket;
import springmvcec.beans.User;
import springmvcec.services.ActionService;
import springmvcec.services.MessageService;
import springmvcec.services.TicketService;
import springmvcec.services.UserService;

@Controller
public class MainController {

	@Autowired
	TicketService ticketService;
	@Autowired
	UserService userService;
	@Autowired
	MessageService messageService;
	@Autowired
	ActionService actionService;

	@RequestMapping(value = "/")
	public String signin() {

		return "signin";
	}

	@RequestMapping(value = "/doSignin", method = RequestMethod.POST)
	public void diSignin(@RequestParam String username, @RequestParam String password, HttpServletRequest request,
			HttpServletResponse response) {

		HttpSession session = request.getSession(true);
		User user = userService.findUserByUsernameAndPassword(username, password);
		System.out.println(user);
		if (user != null) {
			session.setAttribute("user", user);
			try {
				response.sendRedirect("/tickets");
				return;
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		request.setAttribute("signinError", "Try again");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/tickets")
	public String getAllTickets(HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		if (session.getAttribute("user") == null) {
			User user = userService.findUser(1);
			session.setAttribute("user", user);
		}

		request.setAttribute("tickets", ticketService.getAllTickets());

		return "index";
	}

	@RequestMapping("/ticket/{id}")
	public String getTicket(@PathVariable int id, HttpServletRequest request) {

		Ticket ticket = ticketService.findTicketById(id);

		Action action = new Action();
		action.setTicket(ticket);
		action.setUser(ticket.getOwner());
		action.setDoneAt(new Date());
		action.setType("Seen");
		actionService.saveAction(action);

		request.setAttribute("ticket", ticket);

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
		ticket.setStatus("Open");
		ticket.setClosed(false);
		ticket.setResolved(false);
		ticket.setCreatedAt(new Date());

		ticketService.saveOrUpadteTicket(ticket);
		try {
			response.sendRedirect("/tickets");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/ticket/reply", method = RequestMethod.POST)
	public void replyToTicket(@RequestParam String reply, @RequestParam int ticketId, HttpServletResponse response,
			HttpServletRequest request) {

		HttpSession session = request.getSession(true);

		Ticket ticket = ticketService.findTicketById(ticketId);
		User user = (User) session.getAttribute("user");
		Message message = new Message();
		message.setBody(reply);
		message.setCreatedAt(new Date());
		message.setTicketId(ticket);
		message.setUser(user);
		messageService.saveMessage(message);
		System.out.println("IN  /ticket/reply");
		try {
			response.sendRedirect("/ticket/" + ticketId);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "/ticket/close/{id}", method = RequestMethod.GET)
	public String closeTicket(@PathVariable int id, HttpServletRequest request) {

		Ticket ticket = ticketService.findTicketById(id);

		if (!ticket.isClosed()) {

			ticket.setStatus("Closed");
			ticket.setClosed(true);
			ticketService.saveOrUpadteTicket(ticket);

			Action action = new Action();
			action.setTicket(ticket);
			action.setUser(ticket.getOwner());
			action.setDoneAt(new Date());
			action.setType("Closed");
			actionService.saveAction(action);

			request.setAttribute("tickets", ticketService.getAllTickets());
		}
		return "index";
	}

	@RequestMapping(value = "/ticket/resolved/{id}", method = RequestMethod.GET)
	public void setResolvedTicket(@PathVariable int id, HttpServletResponse response) {

		Ticket ticket = ticketService.findTicketById(id);
		if (!ticket.isResolved()) {

			ticket.setStatus("Resolved");
			ticket.setResolved(true);
			ticketService.saveOrUpadteTicket(ticket);

			Action action = new Action();
			action.setTicket(ticket);
			action.setUser(ticket.getOwner());
			action.setDoneAt(new Date());
			action.setType("Resolved");
			actionService.saveAction(action);
		}
		try {
			response.sendRedirect("/tickets");
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
