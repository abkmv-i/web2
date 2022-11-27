<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700;900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="assets/css/style.css">

</head>
<body>
<div class="hat">
    <h6>Абакумова Ирина Андреевна<br> Группа P32121 <br>Вариант 11225</h6>
</div>
<br><br><br>
<form action="./ControllerServlet" id="forms" method="get" name="Date">
    <table>
        <td align="center">
            <div>
                <blockquote class="text">
                    <p>Выберите X: </p>
                </blockquote>
                <div>
                    <input type="checkbox" name="x_coordinate" class="x" id="x_value_-5" value="-5">-5
                    <input type="checkbox" name="x_coordinate" class="x" id="x_value_-4" value="-4">-4
                    <input type="checkbox" name="x_coordinate" class="x" id="x_value_-3" value="-3">-3
                    <input type="checkbox" name="x_coordinate" class="x" id="x_value_-2" value="-2">-2
                    <input type="checkbox" name="x_coordinate" class="x" id="x_value_-1" value="-1">-1
                    <input type="checkbox" name="x_coordinate" class="x" id="x_value_0" value="0">0
                    <input type="checkbox" name="x_coordinate" class="x" id="x_value_1" value="1">1
                    <input type="checkbox" name="x_coordinate" class="x" id="x_value_2" value="2">2
                    <input type="checkbox" name="x_coordinate" class="x" id="x_value_3" value="3">3

                </div>
                <p id="errorX"></p>
            </div>
        </td>

        <td align="center">
            <div class="txt">
                <blockquote class="text">
                    <p>Введите Y: </p>
                </blockquote>
                <input height="30px" name="y_coordinate" class="y" placeholder="От -3 до 3." maxlength="4">
                <p id="errorY"></p>
            </div>

        </td>
        <td align="center">
            <div>
                <blockquote class="text">
                    <p>Выберите R: </p>
                </blockquote>
                <div>
                    <select name="r_coordinate" class="r">
                        <option id="r_value_1" value="1">1</option>
                        <option id="r_value_1.5" value="1.5">1.5</option>
                        <option id="r_value_2" value="2">2</option>
                        <option id="r_value_2.5" value="2.5">2.5</option>
                        <option id="r_value_3" value="3">3</option>
                    </select>

                </div>
            </div>

            </div>
        </td>
        <td>

            <svg class = "svg" width="300" height="300">
                <!--Координатные оси-->
                <line x1="0" x2="300" y1="150" y2="150" stroke="white"></line>
                <line x1="150" x2="150" y1="0" y2="300" stroke="white"></line>
                <!--Стрелочки-->
                <polygon points="150,0 145,15 155,15" stroke="white"></polygon>
                <polygon points="300,150 285,145 285,155" stroke="white"></polygon>
                <!--Треугольник в первой четверти-->
                <polygon points="150,150 50,150 150,250" class="triangle" stroke="white" fill=#DAA520></polygon>
                <!--Четверть круга во второй четверти-->
                <path d="M50,150 A100,100 90 0,1 150,50 L 150,150 Z" class="circle" stroke="white" fill=#DAA520></path>
                <!--Квадрат в четвертой четверти-->
                <polygon points="150,150 250,150 250,100 150,100" class="square" stroke="white" fill=#DAA520></polygon>
                <g class="circles"></g>

                <!-- Подписи к осям -->
                <text x="285" y="135" stroke="white">X</text>
                <text x="160" y="15" stroke="white">Y</text>
                <!-- Метки для значений R на оси X -->
                <line x1="50" x2="50" y1="140" y2="160" stroke="white" ></line>
                <line x1="100" x2="100" y1="140" y2="160" stroke="white"></line>
                <line x1="200" x2="200" y1="140" y2="160" stroke="white"></line>
                <line x1="250" x2="250" y1="140" y2="160" stroke="white"></line>
                <!-- Метки для значений R на оси Y -->
                <line x1="140" x2="160" y1="50" y2="50" stroke="white"></line>
                <line x1="140" x2="160" y1="100" y2="100" stroke="white"></line>
                <line x1="140" x2="160" y1="200" y2="200" stroke="white"></line>
                <line x1="140" x2="160" y1="250" y2="250" stroke="white"></line>
                <!-- Значения R на оси X -->
                <text x="50" y="130" text-anchor="middle" id="-r" stroke="white">-R</text>
                <text x="98" y="130" text-anchor="middle" id="-r2" stroke="white">-R/2</text>
                <text x="200" y="130" text-anchor="middle" id="r2" stroke="white">R/2</text>
                <text x="250" y="130" text-anchor="middle" id="r" stroke="white">R</text>
                <!-- Значения R на оси Y -->
                <text x="170" y="52.5" id="r" stroke="white">R</text>
                <text x="170" y="102.5" id="r2" stroke="white">R/2</text>
                <text x="170" y="202.5" id="-r2" stroke="white">-R/2</text>
                <text x="170" y="252.5" id="-r" stroke="white">-R</text>
                <!--<circle class="circle" r="0" cx="150" cy="150" fill="white"></circle>-->
            </svg>

        </td>
        <tr>
            <td colspan="4" align="center">
                <div class="txt">
                    <img src="assets/icons/mini1.gif">

                    <button class="validate_button" type="submit"> Расчитать</button>
                    <img src="assets/icons/mini2.gif">

                </div>

            </td>
        </tr>

    </table>
</form>

<script src="assets/js/interactive.js"></script>

</body>
</html>