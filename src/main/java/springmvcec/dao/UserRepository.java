package springmvcec.dao;

import org.springframework.data.repository.CrudRepository;

import springmvcec.beans.User;

public interface UserRepository extends CrudRepository<User, Integer> {

}
