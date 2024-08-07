<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="UTF-8">
        <link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
        <title>List Todos Page</title>
    </head>
    <body>
        <%@ include file="common/navigation.jspf" %>

        <div class="container">
            <h1>Your Todos</h1>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Description</th>
                        <th>Target Date</th>
                        <th>Done</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${todos}" var="todo">
                    <tr>
                        <td><c:out value="${todo.description}" /></td>
                        <td>${todo.targetDate}</td>
                        <td>${todo.done}</td>
                        <td>
                            <a href="update-todo?id=${todo.id}" class="btn btn-warning">Update</a>
                            <a href="mark-todo?id=${todo.id}" class="btn btn-success" title="Mark as completed">
                                <i class="bi bi-check"></i>
                            </a>
                            <a href="delete-todo?id=${todo.id}" class="btn btn-danger">
                                <i class="bi bi-trash"></i>
                            </a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>

            <a href="add-todo" class="btn btn-success">Add Todo</a>
        </div>

        <script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
        <script src="webjars/jquery/3.6.0/jquery.min.js"></script>
    </body>
</html>