package springmvcec.services;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import springmvcec.beans.Action;
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

}
