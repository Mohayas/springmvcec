package springmvcec.services;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import springmvcec.beans.User;
import springmvcec.dao.UserJPARepository;

@Service
@Transactional
public class UserService {

	private final UserJPARepository userJPARepository;

	public UserService(UserJPARepository jpaRepository) {

		this.userJPARepository = jpaRepository;
	}

	public User findUser(int id) {

		return userJPARepository.findOne(id);
	}

	public User findUserByUsernameAndPassword(String username, String password) {

		return userJPARepository.findByUsernameAndPassword(username, password);
	}

}
