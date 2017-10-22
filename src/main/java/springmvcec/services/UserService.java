package springmvcec.services;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import springmvcec.beans.User;
import springmvcec.dao.UserJPARepository;

@Service
@Transactional
public class UserService {

	private final UserJPARepository jpaRepository;

	public UserService(UserJPARepository jpaRepository) {

		this.jpaRepository = jpaRepository;
	}

	public User findUser(int id) {

		return jpaRepository.findOne(id);
	}

}
