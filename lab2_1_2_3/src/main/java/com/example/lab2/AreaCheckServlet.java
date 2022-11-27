package com.example.lab2;

import custom.MiniMath;
import custom.TableData;
import enums.DataErrorTexts;
import enums.DataFields;
import exceptions.DataException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.*;


@WebServlet(name = "AreaCheckServlet", value = "/AreaCheckServlet")
public class  AreaCheckServlet extends HttpServlet {

    private final List<Double> X_VALUES = Arrays.asList(-5.0, -4.0, -3.0, -2.0, -1.0, 0.0, 1.0, 2.0, 3.0);
    private final List<Double> Y_RANGE = Arrays.asList(-3.0, 3.0);
    private final List<Double> R_RANGE = Arrays.asList(1.0, 1.5, 2.0, 2.5, 3.0);



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Date startTime = new Date();

        request.setAttribute("error", null);
        try {
            double x, y, r;
            String xRaw = request.getParameter("x_coordinate");
            String yRaw = request.getParameter("y_coordinate");
            String rRaw = request.getParameter("r_coordinate");

            List<DataFields> notNumericFields = new ArrayList<>(Collections.emptyList());
            if (MiniMath.isNotNumeric(xRaw)) {
                notNumericFields.add(DataFields.X);
            }
            if (MiniMath.isNotNumeric(yRaw)) {
                notNumericFields.add(DataFields.Y);
            }
            if (MiniMath.isNotNumeric(rRaw)) {
                notNumericFields.add(DataFields.R);
            }

            if (!notNumericFields.isEmpty()) {
                throw new DataException(DataErrorTexts.INCORRECT_FORMAT, notNumericFields);
            } else {
                x = Double.parseDouble(xRaw);
                y = Double.parseDouble(yRaw);
                r = Double.parseDouble(rRaw);
            }

            boolean answer = true;
            if (x > 0 && y < 0) {
                answer = false;
            } else if (x >= 0 && y >= 0) {
                answer = x <= r && y <= r / 2;
            } else if (x < 0 && y < 0) {
                answer = y >= -x - r;
            } else if (x <= 0 && y >= 0) {
                answer = (y <= Math.sqrt(r * r  - x * x));
            }

            Date finishTime = new Date();
            long executionTime = finishTime.getTime() - startTime.getTime();

            @SuppressWarnings("unchecked")
            ArrayList<TableData> sessionData = (ArrayList<TableData>) session.getAttribute("tableData");
            if (sessionData == null) {
                sessionData = new ArrayList<>();
            }
            sessionData.add(new TableData(x, y, r, answer, startTime, executionTime));
            session.setAttribute("tableData", sessionData);
            request.getRequestDispatcher("/table.jsp").forward(request, response);
            request.getRequestDispatcher("/index.jsp").forward(request, response);

        } catch (DataException exception) {
            request.setAttribute("error", exception.getMessage());
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
