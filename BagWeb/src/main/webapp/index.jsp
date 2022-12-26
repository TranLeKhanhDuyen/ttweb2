<%@page import="com.entity.User"%>
<%@page import="com.entity.BagDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BagDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Website selling backpacks</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">

.crd-ho:hover {
	background-color:hsl(209, 57%, 90%)   ;
}
#home {
    background-image: url("bags/background.jpg");
    width: 100%;
    height: 80vh;
    background-size: cover;
    background-position: top 1px center;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
}
</style>
</head>
<body style="background-color:rgb(227, 227, 227)">

	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-image"></div>
	 <section id="home">
      <div class="container">
      </div>
    </section> <br><br>

	<!-- Featured Bag -->
	<div class="container">
		<h3 class="text-center">Featured Book</h3>
		<div class="row">
			<%
			BagDAOImpl dao2 = new BagDAOImpl(DBConnect.getConn());
			List<BagDtls> list2 = dao2.getFeaturedBags();
			for (BagDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="cart-body">
						<image alt="" src="bags/<%=b.getPhotoName()%>"
							style="width:150px; height:150px" class="image-thumblin ml-5">
						<p class="text-center text-danger ml-1"><%=b.getBagName()%></p>
						<p class="text-center text-danger ml-1">

							<%
							if (b.getBagCategory().equals("Old")) {
							%>
							Categories:<%=b.getBagCategory()%></p>
						<div class="row">
							<a href="view_bags.jsp?bid=<%=b.getBagId()%>"
								class="btn btn-success btn-sm ml-5">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-dollar-sign"></i></a>
						</div>
						<%
						} else {
						%> Categories: <%=b.getBagCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-3">Add
								Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBagId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-3">Add Cart</a>
							<%
							}
							%>
							<a href="view_bags.jsp?bid=<%=b.getBagId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a>
								
								
								 <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-dollar-sign"></i></a>
						</div>
						<%
						}
						%>
						
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_featured_bag.jsp"
				class="btn btn-danger btn-sm text-white">View All</a>
		</div>

	</div>
	<!-- End Featured Bag -->

	<hr>

	<!-- Start New Bag -->
	<div class="container">
		<h3 class="text-center">New Bag</h3>
		<div class="row">

			<%
			BagDAOImpl dao = new BagDAOImpl(DBConnect.getConn());
			List<BagDtls> list = dao.getNewBag();
			for (BagDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="cart-body">
						<image alt="" src="bags/<%=b.getPhotoName()%>"
							style="width:150px; height:150px"
							class="image-thumblin btn-sm ml-5">
						<p class="text-center text-danger ml-1"><%=b.getBagName()%></p>
						<p class="text-center text-danger ml-1">
							Categories:
							<%=b.getBagCategory()%></p>
						<div class="row">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-3">Add
								Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBagId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-3">Add Cart</a>
							<%
							}
							%>

							<a href="view_bags.jsp?bid=<%=b.getBagId()%>"
								class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fa-solid fa-dollar-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-1">
			<a href="all_new_bag.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>

	</div>
	<!-- End New Bag -->

	<hr>

	<!-- Start Old Bag -->
	<div class="container">
		<h3 class="text-center">Old Bag</h3>
		<div class="row">
			<%
			BagDAOImpl dao3 = new BagDAOImpl(DBConnect.getConn());
			List<BagDtls> list3 = dao2.getOldBags();
			for (BagDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="cart-body">
						<image alt="" src="bags/<%=b.getPhotoName()%>"
							style="width:150px; height:150px" class="image-thumblin ml-5">
						<p class="text-center text-danger ml-1"><%=b.getBagName()%></p>
						<p class="text-center text-danger ml-1">
							<%=b.getBagCategory()%></p>
						<div class="row">
							<a href="view_bags.jsp?bid=<%=b.getBagId()%>"
								class="btn btn-success btn-sm ml-4">View Details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fa-solid fa-dollar-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

<br>
		</div>
		<div class="text-center mt-1">
			<a href="all_old_bag.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
		</div>

	</div>
	<!-- End Old Bag -->

	<hr>
<%@include file="all_component/footer.jsp" %>
</body>
</html>