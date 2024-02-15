<%@ page import="java.util.List" %>
<%@ page import="tasks.entity.TaskEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="bootstrap/bootstrap.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>

<div>
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#createTask">
        + Добавить задание
    </button>
</div>

<div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Наименование</th>
            <th scope="col">Крайний срок</th>
            <th scope="col">Выполнено</th>
            <th scope="col">Детали</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<TaskEntity> taskList = (List<TaskEntity>) request.getAttribute("taskList");
            for (TaskEntity task : taskList) {
        %>
        <tr>
            <th scope="row"><%=task.getId()%></th>
            <td><%=task.getName()%></td>
            <td><%=task.getDeadlineDate()%></td>
            <td><%=task.isDone() ? "Да" : "Нет"%></td>
            <td><a class="btn btn-primary" href="/details?id=<%=task.getId()%>">Детали</a></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<form action="/" method="post">
    <div class="modal fade" id="createTask" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">Новое задание</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Наименование:</label>
                        <input class="form-control" placeholder="Наименование..." name="name">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Описание:</label>
                        <textarea class="form-control" rows="3" placeholder="Описание..." name="description"></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Крайний срок:</label>
                        <input type="date" class="form-control" name="deadlineDate">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button class="btn btn-primary">Добавить</button>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>