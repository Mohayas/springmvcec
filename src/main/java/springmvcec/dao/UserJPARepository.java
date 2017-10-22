package springmvcec.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import springmvcec.beans.User;

public interface UserJPARepository extends JpaRepository<User, Integer> {

}
