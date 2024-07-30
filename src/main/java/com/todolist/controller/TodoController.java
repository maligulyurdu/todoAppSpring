package com.todolist.controller;

import com.todolist.dto.Todo;
import com.todolist.service.TodoService;
import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

//@Controller
@SessionAttributes("name")
public class TodoController {

    private TodoService todoService;

    public TodoController(TodoService todoService) {
        this.todoService = todoService;
    }

    private Logger logger = LoggerFactory.getLogger(getClass());
    @RequestMapping("list-todos")
    public String listAllTodos(ModelMap model) {
        String username = getLoggedInUsername(model);
        List<Todo> todos = todoService.findByUsername(username);
        logger.warn("expected list: {}",todos);
        model.addAttribute("todos", todos);
        return "listTodos";
    }

    @RequestMapping("add-todo")
    public String showNewTodoPage(ModelMap model){
        String username = getLoggedInUsername(model);
        Todo todo = new Todo(0,username,"Default Desc",LocalDate.now().plusYears(1),false);
        model.put("todo",todo);
        return "todo";
    }



    @PostMapping("add-todo")
    public String addNewTodo(ModelMap model, @Valid Todo todo, BindingResult result){
        logger.debug("DENEME DENEME add todo");
        if(result.hasErrors()){
            return "todo";
        }
        String username = getLoggedInUsername(model);
        todoService.addTodo(username,todo.getDescription(), // for security, we use t/odo.getDescription instead of description.
                LocalDate.now().plusYears(1),false);
        return "redirect:list-todos"; // instead of copy RequestMapping("list-todos") method
    }

    @RequestMapping("delete-todo")
    public String deleteTodo(@RequestParam int id){
        // Delete todo

        todoService.deleteById(id);
        return "redirect:list-todos";

    }

    @GetMapping("update-todo")
    public String showUpdateTodoPage(@RequestParam int id, ModelMap model){
        Todo todo = todoService.findById(id);

        // it must be matched with modelAttribute in todo.jsp file
        model.addAttribute("todo",todo);

        return "todo";

    }

    @PostMapping("update-todo")
    public String updateTodo(ModelMap model, @Valid Todo todo, BindingResult result){

        if(result.hasErrors()){
            return "todo";
        }
        String username = getLoggedInUsername(model);
        todoService.updateTodo(todo);
        return "redirect:list-todos"; // instead of copy RequestMapping("list-todos") method
    }

    private static String getLoggedInUsername(ModelMap model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication.getName();
    }

}



