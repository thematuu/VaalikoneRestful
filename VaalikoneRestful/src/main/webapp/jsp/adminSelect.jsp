<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
  <head>
    <meta http-equiv="content-type" content="application/xhtml+xml; charset=UTF-8" />
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <title>Election compass</title>
  </head>
<%
if(session.getAttribute("currentSessionUser")==null)
{
response.sendRedirect("/admin.html");
}
else{
}
%>

  <body>
 <div class="header">
        <a href="/index.html" class="logo">Election compass</a>
        <div class="header-right">
          <a href="/Logout">Logout</a>
        </div>
      </div>
<div class="grid-container-index">
<div class="grid-item-index">
<a href='/questionsAdmin'>Edit questions</a>
</div>
<div class="grid-item-index">
<a href='/jsp/candidateAdmin.jsp'>Edit candidates</a>
</div>
</div>


  </body>
</html>
