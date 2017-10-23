/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package springmvcec.beans;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author mohayas
 */
@Entity
@Table(name = "user")
@XmlRootElement
@NamedQueries({ @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u"),
		@NamedQuery(name = "User.findById", query = "SELECT u FROM User u WHERE u.id = :id"),
		@NamedQuery(name = "User.findByFirstname", query = "SELECT u FROM User u WHERE u.firstname = :firstname"),
		@NamedQuery(name = "User.findByLastname", query = "SELECT u FROM User u WHERE u.lastname = :lastname"),
		@NamedQuery(name = "User.findByType", query = "SELECT u FROM User u WHERE u.type = :type") })
public class User implements Serializable {

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "user")
	private List<Message> messageList;

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id")
	private Integer id;
	@Basic(optional = false)
	@Column(name = "firstname")
	private String firstname;
	@Basic(optional = false)
	@Column(name = "lastname")
	private String lastname;
	@Basic(optional = false)
	@Column(name = "type")
	private int type;
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "owner")
	private List<Ticket> ticketList;

	public User() {
	}

	public User(Integer id) {
		this.id = id;
	}

	public User(Integer id, String firstname, String lastname, int type) {
		this.id = id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.type = type;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@XmlTransient
	public List<Ticket> getTicketList() {
		return ticketList;
	}

	public void setTicketList(List<Ticket> ticketList) {
		this.ticketList = ticketList;
	}

	@Override
	public int hashCode() {
		int hash = 0;
		hash += (id != null ? id.hashCode() : 0);
		return hash;
	}

	@Override
	public boolean equals(Object object) {
		// TODO: Warning - this method won't work in the case the id fields are not set
		if (!(object instanceof User)) {
			return false;
		}
		User other = (User) object;
		if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "beans.User[ id=" + id + " ]";
	}

	@XmlTransient
	public List<Message> getMessageList() {
		return messageList;
	}

	public void setMessageList(List<Message> messageList) {
		this.messageList = messageList;
	}

}
