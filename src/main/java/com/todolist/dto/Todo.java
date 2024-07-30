package com.todolist.dto;

// Database (MySQL)
// Static list of todos -> Database (H2, MySQL)

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Size;

import java.time.LocalDate;
@Entity // if you want change this name at the database you could use @Entity(name="something")
public class Todo {

    public Todo(){}

    public Todo(int id, String username, String description, LocalDate targetDate, boolean done) {
        this.id = id;
        this.username = username;
        this.description = description;
        this.targetDate = targetDate;
        this.done = done;
    }

    @Id
    @GeneratedValue
    private int id;

    // @Column(name="name")
    private String username;
    @Size(min=10, message ="Enter at least 10 characters")
    private String description;
    private LocalDate targetDate;
    private boolean done;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDate getTargetDate() {
        return targetDate;
    }

    public void setTargetDate(LocalDate targetDate) {
        this.targetDate = targetDate;
    }

    public boolean isDone() {
        return done;
    }

    public void setDone(boolean done) {
        this.done = done;
    }

    @Override
    public String toString() {
        return "ToDo{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", description='" + description + '\'' +
                ", targetDate=" + targetDate +
                ", done=" + done +
                '}';
    }
}
