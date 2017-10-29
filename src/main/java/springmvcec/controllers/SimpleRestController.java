package springmvcec.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import springmvcec.services.TicketService;

@RestController
public class SimpleRestController {

	@Autowired
	TicketService ticketService;

	@RequestMapping(value = "/hi")
	public String hello() {

		return ticketService.getAllTickets().toString();
	}

	@RequestMapping("/camps")
	public String allCamps() {

		return "campaigns hkjhkjhkjhkj";
		// return campService.getAllCamps().toString();

	}

}
