<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: mrchebik
  Date: 19.07.16
  Time: 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Your notes</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/ViewNotes.css"/>">
    <script type="text/javascript" src="<c:url value="/resources/js/ViewNotes.js"/>"></script>
</head>
<body>
<c:choose>
    <c:when test="${notes.size() == 0}" >
        <h3>You do not have any notes.</h3>
    </c:when>
    <c:otherwise>
        <h3>Your notes.</h3>
        <table>
            <tr>
                <th>Title</th>
                <th>Text</th>
            </tr>
            <c:forEach items="${notes}" var="note" >
                <tr>
                    <td>${note.title}</td>
                    <td>${note.text}</td>
                </tr>
            </c:forEach>
        </table>

        <c:choose>
            <c:when test="${pages > 1}">
                <form id="form1" action="<c:url value="/notes/view"/>" method="get">
                    <br>
                    <input id="007" type="hidden" name="hide">
                    <c:choose>
                        <c:when test="${page > 4}">
                            <span class="fake-link" id="${1}" onclick="checkPage(this.id)">${1}</span> ...
                        </c:when>
                    </c:choose>
                    <c:forEach begin="${page > 4 ? page - 2 : 1}" end="${page + 4 > pages ? pages : page + 2}" var="page">
                        <span class="fake-link" id="${page}" onclick="checkPage(this.id)">${page}</span>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${page + 4 <= pages}">
                             ... <span class="fake-link" id="${pages}" onclick="checkPage(this.id)">${pages}</span>
                        </c:when>
                    </c:choose>
                    <br>
                </form>
            </c:when>
        </c:choose>
    </c:otherwise>
</c:choose>
<a href="<c:url value="/notes"/>">Back</a>
</body>
</html>