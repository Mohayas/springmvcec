package springmvcec.services;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import springmvcec.beans.Ticket;
import springmvcec.dao.TicketRepository;

@Service
@Transactional
public class TicketService {

	private final TicketRepository ticketRepository;

	public TicketService(TicketRepository ticketRepository) {
		this.ticketRepository = ticketRepository;
	}

	public List<Ticket> getAllTickets() {
		List<Ticket> tickets = new ArrayList<Ticket>();
		ticketRepository.findAll().forEach(tickets::add);
		return tickets;

	}

	public Ticket findTicketById(int id) {

		Ticket ticket = ticketRepository.findOne(id);
		return ticket;
	}

	public void saveTicket(Ticket ticket) {
		ticketRepository.save(ticket);

	}
}
