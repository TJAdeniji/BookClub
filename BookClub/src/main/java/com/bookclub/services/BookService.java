package com.bookclub.services;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bookclub.models.Book;
import com.bookclub.models.User;
import com.bookclub.repositories.BookRepository;

@Service
public class BookService {
	
	@Autowired
	private BookRepository repository;
	
	@Autowired
	private UserService userService;
	
	public BookService(BookRepository repository) {
		this.repository = repository;
	}
	
	public Book create(Long userID, Book b) {
		User user = this.userService.find(userID);
		if (user == null)
			return null;
		b.setOwner(user);
		return this.repository.save(b);
	}
	
	public Book save(Book b) {
		return this.repository.save(b);
	}
	
	public Book find(Long id) {
		Optional<Book> optBook = this.repository.findById(id);
		
		if (optBook.isPresent())
			return optBook.get();	
		return null;
	}
	
	public void delete(Long id) {
		 this.repository.deleteById(id);
	}	
	
}
