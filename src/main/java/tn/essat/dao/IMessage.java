package tn.essat.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import tn.essat.model.Message;
import tn.essat.model.Utilisateur;
@Repository
public interface IMessage extends JpaRepository<Message, Integer>{
	@Query("select m from Message m where m.userreceive.id=:x")
	public List<Message> getAllMessageReceive(@Param("x") int id);
	
	public List<Utilisateur> findByUserreceive(Utilisateur u);
	
	@Query("select m from Message m where m.usersend.id=:x")
	public List<Message> getAllMessageSend(@Param("x") int id);
	
	@Query("select m from Message m where m.userreceive.id=:x and m.readfromreceive=false")
	public List<Message> getAllMessageNonLus(@Param("x") int id);

	

}
