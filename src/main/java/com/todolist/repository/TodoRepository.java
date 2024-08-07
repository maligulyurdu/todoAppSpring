package com.todolist.repository;

import com.todolist.dto.Todo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface TodoRepository extends JpaRepository<Todo, Integer> {
    public List<Todo> findByUsername(String username);
    @Modifying
    @Query("UPDATE Todo t SET t.done = true WHERE t.id = :id")
    void markAsCompleted(@Param("id") int id);

}
