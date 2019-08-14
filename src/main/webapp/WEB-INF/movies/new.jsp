<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<div class="container">
<h1>Add a New Movie</h1>
<form:form action="/movies" method="post" modelAttribute="newMovieObject">
    <p>
        <form:label path="title">Title</form:label>
        <form:errors path="title"/>
        <form:input class="form-control col-3" path="title"/>
    </p>
    <p>
        <form:label path="description">Description</form:label>
        <form:errors path="description"/>
        <form:textarea class="form-control col-3" path="description"/>
    </p>
    <p>
        <form:label path="language">Language</form:label>
        <form:errors path="language"/>
        <form:input class="form-control col-3" path="language"/>
    </p>
    <p>
        <form:label path="numberOfMins">Minutes</form:label>
        <form:errors path="numberOfMins"/>     
        <form:input class="form-control col-3" type="number" path="numberOfMins"/>
    </p>    
    <input type="submit" value="Submit"/>
</form:form>
</div>