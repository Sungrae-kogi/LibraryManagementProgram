<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar navbar-dark bg-dark p-1 fixed-top">
  <div class="container-fluid">
    <a class="navbar-brand"><%=request.getSession().getAttribute("ROLE") %></a>
    <form class="d-flex">
      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
      <button type="submit" class="btn btn-secondary">Search</button>
    </form>
  </div>
</nav>