package com.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bookclub.models.Book;
import com.bookclub.models.User;
import com.bookclub.repositories.UserRepository;
import com.bookclub.services.UserService;

import com.bookclub.repositories.BookRepository;
import com.bookclub.services.BookService;

@Controller
public class BookController {
	
	@Autowired 
	private BookService service;
	
	@Autowired
	private BookRepository repository;
	
	@Autowired
	private UserService userService;
	
	@Autowired 
	private UserRepository userRepo;
	
	@RequestMapping("/books")
	public String dashboard(Model model, HttpSession session) {
		
		User user = this.userService.findCurrentUser(session);
		if (user == null)
			return "redirect:/login";
		
		model.addAttribute("allBooks", this.repository.findAll());
		return "dashboard.jsp";
	}
	
	@RequestMapping("/books/new")
	public String newBook(Model model, HttpSession session) {
		User user = this.userService.findCurrentUser(session);
		if (user == null)
			return "redirect:/login";
		model.addAttribute("currentUser", user);
		model.addAttribute("newBook", new Book());
		return "newBook.jsp";
	}
	
	@PostMapping("/add")
	public String add(@Valid @ModelAttribute("newBook") Book book, BindingResult result) {
		if (result.hasErrors()) {
			return "newBook.jsp";
		}
		this.service.create(book.getOwner().getId(), book);
		return "redirect:/books";
	}
	
	@RequestMapping("/books/{id}")
	public String viewBook(Model model, @PathVariable("id") Long id, HttpSession session) {
		
		User user = this.userService.findCurrentUser(session);
		if (user == null)
			return "redirect:/login";
		
		model.addAttribute("book", this.service.find(id));
		return "viewBook.jsp";
	}
	
	@RequestMapping("/books/{id}/edit")
	public String editBook(Model model, @PathVariable Long id, HttpSession session) {
		User user = this.userService.findCurrentUser(session);
		if (user == null)
			return "redirect:/login";
		model.addAttribute("updateBook", this.service.find(id));
		return "editBook.jsp";
	}
	
	@PostMapping("/update")
	public String update(@Valid @ModelAttribute("updateBook") Book book, BindingResult result ) {
		if (result.hasErrors()) {
			return "updateExpense.jsp";
		}
		this.service.save(book);
		return "redirect:/books";
	}
	
	
	
}
