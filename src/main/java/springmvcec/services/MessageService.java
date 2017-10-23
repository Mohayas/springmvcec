package springmvcec.services;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import springmvcec.beans.Message;
import springmvcec.dao.MessageRepository;

@Service
@Transactional
public class MessageService {

	private MessageRepository messageRepository;

	public MessageService(MessageRepository messageRepository) {
		this.messageRepository = messageRepository;
	}

	public void saveMessage(Message message) {
		messageRepository.save(message);

	}

}
