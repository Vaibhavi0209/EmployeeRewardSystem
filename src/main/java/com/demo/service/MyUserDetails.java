//package com.demo.service;
//
//import java.util.ArrayList;
//import java.util.Collection;
//import java.util.HashSet;
//import java.util.List;
//import java.util.Set;
//
//import com.demo.entity.Login;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//
//import com.demo.entity.Role;
//
//
//
//public class MyUserDetails implements UserDetails {
//
//	 private Login user;
//
//	    public MyUserDetails(Login user) {
//	        this.user = user;
//	    }
//
//	public Collection<? extends GrantedAuthority> getAuthorities() {
//		// TODO Auto-generated method stub
//		 Set<Role> roles = user.getRoles();
//	        List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
//
//	        for (Role role : roles) {
//	            authorities.add(new SimpleGrantedAuthority(role.getName()));
//	        }
//
//	        return authorities;
//	}
//
//	public String getPassword() {
//		// TODO Auto-generated method stub
//		return user.getPassword();
//	}
//
//	public String getUsername() {
//		// TODO Auto-generated method stub
//		 return user.getUsername();
//	}
//
//	public boolean isAccountNonExpired() {
//		// TODO Auto-generated method stub
//		return true;
//	}
//
//	public boolean isAccountNonLocked() {
//		// TODO Auto-generated method stub
//		return true;
//	}
//
//	public boolean isCredentialsNonExpired() {
//		// TODO Auto-generated method stub
//		return true;
//	}
//
//	public boolean isEnabled() {
//		// TODO Auto-generated method stub
//		return user.isEnabled();
//	}
//
//	/**
//	 *
//	 */
//
//
//}
