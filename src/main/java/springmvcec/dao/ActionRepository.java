package springmvcec.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import springmvcec.beans.Action;

public interface ActionRepository extends JpaRepository<Action, Integer> {

}
