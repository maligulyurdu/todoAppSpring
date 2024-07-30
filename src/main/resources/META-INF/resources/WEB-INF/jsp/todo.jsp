<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
    <head>
        <link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
        <link href="webjars\bootstrap-datepicker\1.9.0\css\bootstrap-datepicker.min.css" rel="stylesheet">
        <title>Enter Todo Page</title>
    </head>
    <body>
        <%@ include file="common/navigation.jspf" %>
            <h1>Add Todo Details</h1>
            <form:form method="post" modelAttribute="todo">

                <fieldset class="mb-3">
                    <form:label path="description">Description</form:label>
                    Description:  <form:input type="text" path="description" required="required"/>
                    <form:errors path="description"/>
                </fieldset>

                <fieldset class="mb-3">
                    <form:label path="targetDate">Target Date</form:label>
                    Description:  <form:input type="text" path="targetDate" required="required"/>
                    <form:errors path="targetDate"/>
                </fieldset>
                <form:input type="hidden" path="id"/>
                <form:input type="hidden" path="done"/>
                <input type="submit" class="btn btn-success"/>

            </form:form>

        <script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
        <script src="webjars/jquery/3.6.0/jquery.min.js"></script>
        <script src="webjars\bootstrap-datepicker\1.9.0\js\bootstrap-datepicker.min.js"></script>
        <script src="webjars/jquery/3.6.0/jquery.min.js"></script>

        <script type="text/javascript">
        $('#targetDate').datepicker({
            format: 'dd/mm/yyyy',
        });
        </script>
    </body>
</html>