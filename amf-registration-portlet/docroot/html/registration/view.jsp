<%@ page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<liferay-theme:defineObjects />

<portlet:defineObjects />




<c:choose>
	<c:when test="<%= !themeDisplay.isSignedIn() %>">

	<%@include file="/html/registration/register_user.jsp" %>
	</c:when>
	<c:otherwise>
	<liferay-ui:success key="user-registered" message="user-registered-successfully" />
	You are logged in.
	</c:otherwise>
</c:choose>
