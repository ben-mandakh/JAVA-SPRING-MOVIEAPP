<%@ page isErrorPage="true" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
 <div class="container">
   
	<h1>About the Movie</h1>
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
	        <tr>
	            <td><c:out value="${showMovieObject.title}"/></td>
	            <td><c:out value="${showMovieObject.description}"/></td>
	            <td><c:out value="${showMovieObject.language}"/></td>
	            <td><c:out value="${showMovieObject.numberOfMins}"/></td>
	            <td> <a href="/movies">Go back</a> </td>
	        </tr>
	    </tbody>
	</table>
</div>
