package com.trippify.trippify.jwt;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.trippify.trippify.common.dao.IUserDao;
import com.trippify.trippify.common.view.UserView;

@Service
public class JwtInMemoryUserDetailsService implements UserDetailsService {

	@Autowired
	private IUserDao userDao;

	private final String NO = "N";

	static List<JwtUserDetails> inMemoryUserList = new ArrayList<>();

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//    Optional<JwtUserDetails> findFirst = inMemoryUserList.stream()
//        .filter(user -> user.getUsername().equals(username)).findFirst();
		Optional<UserView> findFirst = userDao.findByUsernameAndDelIndOrderByIdAsc(username, NO);

		if (!findFirst.isPresent()) {
			throw new UsernameNotFoundException(String.format("USER_NOT_FOUND '%s'.", username));
		}

		return findFirst.map(JwtUserDetails::new).get();

		// return findFirst.get();
	}

}
