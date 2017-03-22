<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Customer Page</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="/js/customer.js"></script>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>
<h1>
	Add a Customer
</h1>

<c:url var="addAction" value="/customer/add" ></c:url>

<form:form action="${addAction}" commandName="customer">
<table>
	<c:if test="${!empty customer.name}">
	<tr>
		<td>
			<form:label path="id">
				<spring:message text="ID"/>
			</form:label>
		</td>
		<td>
			<form:input path="id" readonly="true" size="8"  disabled="true" />
			<form:hidden path="id" />
		</td> 
	</tr>
	</c:if>
	<tr>
		<td>
			<form:label path="name">
				<spring:message text="Name"/>
			</form:label>
		</td>
		<td>
			<form:input path="name" />
		</td> 
	</tr>	
	<tr>
		<td>
			<form:label path="subscriptionPlan">
				<spring:message text="subscription Plan"/>
			</form:label>
		</td>
		<td>			
			<form:select path="subscriptionPlan">
                      <form:option value="smart3mbps" label="smart 3MBPS plan" />
                      <form:option value="smart6mbps" label="smart 6MBPS plan" />
                      <form:option value="smart10mbps" label="smart 10MBPS plan" />
                      <form:option value="Unlimitedplan" label="Unlimited plan" />                      
                       </form:select>
			
		</td>
	</tr>
	<tr>
	<td>
			<form:label path="planCost">
				<spring:message text="Plan cost"/>
			</form:label>
		</td>
		<td>
			<form:select path="planCost">
                      <form:option value="450" label="450 rupees" />
                      <form:option value="650" label="650 rupees" />
                      <form:option value="750" label="750 rupees" />
                      <form:option value="1200" label="1200 rupees" />                      
                       </form:select>
		</td>		
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty customer.name}">
				<input type="submit"
					value="<spring:message text="Edit Customer"/>" />
			</c:if>
			<c:if test="${empty customer.name}">
				<input type="submit"
					value="<spring:message text="Add Customer"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
<br>
<h3>Customers List</h3>
<c:if test="${!empty listCustomers}">
	<table class="tg">
	<tr>
		<th width="80">Customer ID</th>
		<th width="120">Customer Name</th>		
		<th width="120">Subscription plan</th>
		<th width="120">plan cost</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listCustomers}" var="customer">
		<tr>
			<td>${customer.id}</td>
			<td>${customer.name}</td>			
			<td>${customer.subscriptionPlan}</td>
			<td>${customer.planCost}</td>
			<td><a href="<c:url value='/edit/${customer.id}' />" >Edit</a></td>
			<td><a href="<c:url value='/remove/${customer.id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>
</body>
</html>