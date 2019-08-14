<%@ page isErrorPage="true" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
 
 <div class ="container">
<h1>All Movies</h1> <a style="display:inline-block" href="/movies/new">Add a new movie</a> <br>
<table class="table">
    <thead>
        <tr>
            <th scope="col">Title</th>
            <th scope="col">Description</th>
            <th scope="col">Language</th>
            <th scope="col">Number of Minutes</th>
            <th scope="col">Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${movies}" var="movie">
        <tr>
            <td><c:out value="${movie.title}"/></td>
            <td><c:out value="${movie.description}"/></td>
            <td><c:out value="${movie.language}"/></td>
            <td><c:out value="${movie.numberOfMins}"/></td>
            <td> 
            <a class ="btn btn-success" href="/movies/${movie.id}/show"> Show </a>                     <!-- Show button -->
            <a class ="btn btn-primary" href="/movies/${movie.id}/edit"> Update </a>                   <!-- Update button -->
            
            <form style="display:inline-block" action="/movies/${movie.id}/delete" method="post">
            <input type="hidden" name="_method" value="delete" />
            <input class ="btn btn-warning" type="submit" value="delete" />   <!-- Delete button -->
            </form>
        </tr>
        </c:forEach>
    </tbody>
</table>

</div>  