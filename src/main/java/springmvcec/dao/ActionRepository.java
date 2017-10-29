package springmvcec.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import springmvcec.beans.Action;
import springmvcec.beans.Ticket;

public interface ActionRepository extends JpaRepository<Action, Integer> {

	@Query("SELECT a FROM Action a WHERE a.ticket = :ticket")
	List<Action> findActionsByTicketId(@Param("ticket") Ticket ticket);
}
