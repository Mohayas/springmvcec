package springmvcec.beans;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author mohayas
 */
@Entity
@Table(name = "action")
@XmlRootElement
@NamedQueries({ @NamedQuery(name = "Action.findAll", query = "SELECT a FROM Action a"),
		@NamedQuery(name = "Action.findById", query = "SELECT a FROM Action a WHERE a.id = :id"),
		@NamedQuery(name = "Action.findByType", query = "SELECT a FROM Action a WHERE a.type = :type"),
		@NamedQuery(name = "Action.findByDoneAt", query = "SELECT a FROM Action a WHERE a.doneAt = :doneAt") })
public class Action implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id")
	private Integer id;
	@Basic(optional = false)
	@Column(name = "type")
	private String type;
	@Basic(optional = false)
	@Column(name = "done_at")
	@Temporal(TemporalType.TIMESTAMP)
	private Date doneAt;
	@JoinColumn(name = "user_id", referencedColumnName = "id")
	@ManyToOne(optional = false)
	private User user;
	@JoinColumn(name = "ticket_id", referencedColumnName = "id")
	@ManyToOne(optional = false)
	private Ticket ticket;

	public Action() {
	}

	public Action(Integer id) {
		this.id = id;
	}

	public Action(Integer id, String type, Date doneAt) {
		this.id = id;
		this.type = type;
		this.doneAt = doneAt;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getDoneAt() {
		return doneAt;
	}

	public void setDoneAt(Date doneAt) {
		this.doneAt = doneAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Ticket getTicket() {
		return ticket;
	}

	public void setTicket(Ticket ticket) {
		this.ticket = ticket;
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
		if (!(object instanceof Action)) {
			return false;
		}
		Action other = (Action) object;
		if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "beans.Action[ id=" + id + " ]";
	}

}
