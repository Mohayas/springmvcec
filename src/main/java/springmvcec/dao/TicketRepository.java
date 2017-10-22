package springmvcec.dao;

import org.springframework.data.repository.CrudRepository;

import springmvcec.beans.Ticket;

public interface TicketRepository extends CrudRepository<Ticket, Integer> {

}
