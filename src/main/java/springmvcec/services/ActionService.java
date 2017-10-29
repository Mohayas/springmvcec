package springmvcec.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import springmvcec.beans.Action;
import springmvcec.beans.Ticket;
import springmvcec.dao.ActionRepository;

@Service
@Transactional
public class ActionService {

	private ActionRepository actionRepository;

	public ActionService(ActionRepository actionRepository) {
		this.actionRepository = actionRepository;
	}

	public void saveAction(Action action) {

		actionRepository.save(action);

	}

	public List<Action> findActionsByTicketId(Ticket ticket) {

		return actionRepository.findActionsByTicketId(ticket);
	}
}
