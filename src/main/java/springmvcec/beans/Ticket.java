/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package springmvcec.beans;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author mohayas
 */
@Entity
@Table(name = "ticket")
@XmlRootElement
@NamedQueries({ @NamedQuery(name = "Ticket.findAll", query = "SELECT t FROM Ticket t"),
		@NamedQuery(name = "Ticket.findById", query = "SELECT t FROM Ticket t WHERE t.id = :id"),
		@NamedQuery(name = "Ticket.findBySubject", query = "SELECT t FROM Ticket t WHERE t.subject = :subject"),
		@NamedQuery(name = "Ticket.findByBody", query = "SELECT t FROM Ticket t WHERE t.body = :body"),
		@NamedQuery(name = "Ticket.findByStatus", query = "SELECT t FROM Ticket t WHERE t.status = :status"),
		@NamedQuery(name = "Ticket.findByCreatedAt", query = "SELECT t FROM Ticket t WHERE t.createdAt = :createdAt") })
public class Ticket implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id")
	private Integer id;
	@Basic(optional = false)
	@Column(name = "subject")
	private String subject;
	@Basic(optional = false)
	@Column(name = "body")
	private String body;
	@Basic(optional = false)
	@Column(name = "status")
	private String status;
	@Basic(optional = false)
	@Column(name = "created_at")
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdAt;
	@Basic(optional = false)
	@Column(name = "is_closed")
	private boolean closed;
	@Basic(optional = false)
	@Column(name = "is_resolved")
	private boolean resolved;
	@JoinColumn(name = "owner", referencedColumnName = "id")
	@ManyToOne(optional = false)
	private User owner;
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "ticket")
	private List<Message> messageList;
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "ticket")
	private List<Action> actionList;

	public Ticket() {
	}

	public Ticket(Integer id) {
		this.id = id;
	}

	public Ticket(Integer id, String subject, String body, String status, Date createdAt) {
		this.id = id;
		this.subject = subject;
		this.body = body;
		this.status = status;
		this.createdAt = createdAt;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

	public boolean isClosed() {
		return closed;
	}

	public void setClosed(boolean closed) {
		this.closed = closed;
	}

	public boolean isResolved() {
		return resolved;
	}

	public void setResolved(boolean resolved) {
		this.resolved = resolved;
	}

	@XmlTransient
	public List<Message> getMessageList() {
		return messageList;
	}

	public void setMessageList(List<Message> messageList) {
		this.messageList = messageList;
	}

	@XmlTransient
	public List<Action> getActionList() {
		return actionList;
	}

	public void setActionList(List<Action> actionList) {
		this.actionList = actionList;
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
		if (!(object instanceof Ticket)) {
			return false;
		}
		Ticket other = (Ticket) object;
		if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "beans.Ticket[ id=" + id + " ]";
	}

}
