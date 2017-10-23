package springmvcec.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import springmvcec.beans.Message;

public interface MessageRepository extends JpaRepository<Message, Integer> {

}
