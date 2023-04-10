<%@page language="java" pageEncoding="ISO-8859-1"
	contentType="text/html; ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List,com.stackroute.keepnotes.model.News" isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
<head>
	<title>Newz Application</title>
	<meta charset="utf-8">
	<style>
	/* Position and style the main container */
.div-style {
  position: relative;
  width: 80%;
  max-width: 1000px;
  margin: 0 auto;
  padding: 5px;
  border-radius: 10px;
  box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.3);
  background-color: #F6F6F6;
  text-align: center;
}

/* Style the form input fields */
.input-field  {
  width: 100%;
  padding: 20px;
  margin: 10px 50px;
  border-radius: 25px;
  border: none;
  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
  font-size: 16px;
  font-weight: 300;
  color: #555;
    text-align: center;
  
}

/* Style the submit button */
.submit-button , .button {
  display: inline-block;
  padding: 10px 20px;
  margin: 10px;
  background-color: #2F80ED;
  color: #fff;
  border: none;
  border-radius: 5px;
  box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
  font-size: 16px;
  font-weight: 500;
  cursor: pointer;
  transition: background-color 0.3s ease-in-out;
}

/* Change the button color on hover */
.submit-button:hover {
  background-color: #1E63CC;
}

/* Style the table */
.table {
  margin-top: 50px;
  width: 100%;
  border-collapse: collapse;
}

.table th {
  padding: 10px;
  font-size: 18px;
  font-weight: 600;
  text-align: left;
  color: #fff;
  background-color: #4C4646;
    border-collapse: collapse;
  
}

/* Style the table cells */
.table td {
  padding: 10px;
  font-size: 16px;
  font-weight: 300;
  text-align: left;
  color: #555;
  border-bottom: 1px solid #ccc;
    border-collapse: collapse;
  
}

	</style>
</head>

<body>
<!-- Create a form which will have text boxes for News Name, News Author, description, content along with a Add 
		 button. Handle errors like empty fields. -->
		 
	<div class="div-style"><h1>Newz Application Assignment</h1></div>
	<div class="input-field">
	<c:choose>
		<c:when test="${empty NewsById}">
			<div class="form-center">
			<form action="add" method="post">
			<label>Name</label><br/>
			<input type="text" name="name" required/><br/>
			<label>Author</label><br/>
			<input type="text" name="author" required/><br/>
			<label>Description</label><br/>
			<input type="text" name="description"required/><br/>
			<label>Content</label><br/>
			<input type="text" name="content"required/><br/>
			<input class="submit_button button" type="submit" value="ADD NEWS"/><br/>
			</form></div>
		</c:when>
		<c:otherwise>
			<div class="form-center">
			<form action="add" method="post">
			<label>Name</label><br/>
			<input type="text" name="name" value=<c:out value="${NewsById.name}"/> /><br/>
			<label>Author</label><br/>
			<input type="text" name="author" value=<c:out value="${NewsById.author}"/> /><br/>
			<label>Description</label><br/>
			<input type="text" name="description" value=<c:out value="${NewsById.description}"/> /><br/>
			<label>Content</label><br/>
			<input type="text" name="content" value=<c:out value="${NewsById.content}"/> /><br/>
			<input class="submit-button button" type="submit" value="UPDATE NEWS"/><br/>
			</form></div>
		</c:otherwise>
	</c:choose></div>
	
	
	<!-- display all existing news in a tabular structure with News Name, News Author, 
	description, content, Publish Date and Action -->
	
	<c:if test="${! empty AllNews}">
	
	<Table class="table" border="1">
		<tr>
			<th class="th" width="10%">News ID</th>
			<th class="th" width="10%">Name</th>
			<th class="th" width="10%">Author</th>
			<th class="th" width="15%">Description</th>
			<th class="th" width="20%">Content</th>
			<th class="th" width="10%">Published At</th>
			<th class="th" colspan="2">Action </th>
		</tr>
		
		<c:forEach items="${AllNews}" var="news">
		<tr>
			<td class="th_td" >${news.newsId}</td>
			<td class="th_td" >${news.name}</td>
			<td class="th_td" >${news.author}</td>
			<td class="th_td" >${news.description}</td>
			<td class="th_td" >${news.content}</td>
			<td class="th_td" >${news.publishedAt}</td>
			<td width="5%"><button ><a href="<c:url  value="update"   ><c:param name="newsId" value="${news.newsId}"/></c:url>">Update</a></button></td>
			<td width="5%"><button ><a href="<c:url  value="delete" ><c:param name="newsId" value="${news.newsId}"/></c:url>">Delete</a></button></td>
		</tr>
		</c:forEach>
	</Table>
	</c:if>
	
</body>
</html>



