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
        <h1 class="text-center">Add Todo Details</h1>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <form:form method="post" modelAttribute="todo">
                        <fieldset class="mb-3">
                            <form:label path="description">Description</form:label>
                            <form:textarea path="description" required="required" class="form-control" rows="5" htmlEscape="true"/>
                            <form:errors path="description" cssClass="text-danger" htmlEscape="true"/>
                        </fieldset>

                        <fieldset class="mb-3">
                            <form:label path="targetDate">Target Date</form:label>
                            <form:input type="text" path="targetDate" required="required" class="form-control datepicker" htmlEscape="true"/>
                            <form:errors path="targetDate" cssClass="text-danger" htmlEscape="true"/>
                        </fieldset>
                        <form:input type="hidden" path="id" htmlEscape="true"/>
                        <form:input type="hidden" path="done" htmlEscape="true"/>
                        <input type="submit" class="btn btn-success btn-block"/>

                    </form:form>
                </div>
            </div>
        </div>

        <script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
        <script src="webjars/jquery/3.6.0/jquery.min.js"></script>
        <script src="webjars\bootstrap-datepicker\1.9.0\js\bootstrap-datepicker.min.js"></script>

        <script type="text/javascript">
            $('.datepicker').datepicker({
                format: 'dd/mm/yyyy',
            });
        </script>
    </body>
</html>