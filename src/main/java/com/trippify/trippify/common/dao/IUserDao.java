package com.trippify.trippify.common.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.trippify.trippify.common.view.UserView;

@Repository
public interface IUserDao extends JpaRepository<UserView, Long> {

	Optional<UserView> findByUsernameAndDelIndOrderByIdAsc(String username, String status);

}