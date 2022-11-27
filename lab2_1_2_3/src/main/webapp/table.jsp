<%@ page import="custom.TableData" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    @SuppressWarnings("unchecked")
    List<TableData> objects = (List<TableData>) request.getSession().getAttribute("tableData");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Лаба 2</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
</head>
<body>

    <div id="root">
        <div class="but">
            <a href="./index.jsp">Назад</a>
            <form action="./ControllerServlet" class=but>
                <input type="hidden" name="clear" value="1">
                <button id="clearR">Очистить таблицу</button>
            </form>
        </div>
    </div>
        <table id="result-table">
            <thead>
            <div class="columns">
                <th>
                    <div>
                        <blockquote class="text">
                            <p>X</p>
                        </blockquote>
                    </div>
                </th>
                <th>
                    <div>
                        <blockquote class="text">
                            <p>Y</p>
                        </blockquote>
                    </div>
                </th>
                <th>
                    <div>
                        <blockquote class="text">
                            <p>R</p>
                        </blockquote>
                    </div>
                </th>
                <th>
                    <div>
                        <blockquote class="text">
                            <p>Попадание</p>
                        </blockquote>
                    </div>
                </th>
                <th>
                    <div>
                        <blockquote class="text">
                            <p>Текущее время</p>
                        </blockquote>
                    </div>
                </th>
                <th>
                    <div>
                        <blockquote class="text">
                            <p>Время работы</p>
                        </blockquote>
                    </div>
                </th>
            </div>
            </thead>
            <tbody>

            <% if (objects != null) { %>
            <% for (TableData object : objects) { %>
            <tr>

                <td data-param="x">
                    <%= object.getX() %>
                </td>
                <td data-param="y">
                    <%= object.getY() %>
                </td>
                <td data-param="r">
                    <%= object.getRadius() %>
                </td>
                <td data-param="answer">
                    <%= object.isAnswer() ? "попал" : "не попал" %>
                </td>
                <td data-param="startTime">
                    <%= new SimpleDateFormat("dd.MM.yyyy HH:mm:ss").format(object.getStartTime()) %>
                </td>
                <td data-param="execTime">
                    <%= object.getExecutionTime() %> мс
                </td>
            </tr>
            <% } %>
            <% } %>

            </tbody>
        </table>
    <script src="assets/js/main.js"></script>
</body>
</html>