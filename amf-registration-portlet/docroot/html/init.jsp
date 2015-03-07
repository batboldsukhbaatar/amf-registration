<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>
<%@ page import="com.liferay.portal.AddressCityException"%><%@
page import="com.liferay.portal.AddressStreetException"%><%@
page import="com.liferay.portal.AddressZipException"%><%@
page import="com.liferay.portal.CompanyMaxUsersException"%><%@
page import="com.liferay.portal.ContactBirthdayException"%><%@
page import="com.liferay.portal.ContactFirstNameException"%><%@
page import="com.liferay.portal.ContactFullNameException"%><%@
page import="com.liferay.portal.ContactLastNameException"%><%@
page import="com.liferay.portal.CookieNotSupportedException"%><%@
page import="com.liferay.portal.DuplicateOpenIdException"%><%@
page import="com.liferay.portal.EmailAddressException"%><%@
page import="com.liferay.portal.GroupFriendlyURLException"%><%@
page import="com.liferay.portal.NoSuchCountryException"%><%@
page import="com.liferay.portal.NoSuchListTypeException"%><%@
page import="com.liferay.portal.NoSuchRegionException"%><%@
page import="com.liferay.portal.PasswordExpiredException"%><%@
page import="com.liferay.portal.PhoneNumberException"%><%@
page import="com.liferay.portal.RequiredFieldException"%><%@
page import="com.liferay.portal.RequiredReminderQueryException"%><%@
page import="com.liferay.portal.SendPasswordException"%><%@
page import="com.liferay.portal.TermsOfUseException"%><%@
page import="com.liferay.portal.UserActiveException"%><%@
page import="com.liferay.portal.UserEmailAddressException"%><%@
page import="com.liferay.portal.UserIdException"%><%@
page import="com.liferay.portal.UserLockoutException"%><%@
page import="com.liferay.portal.UserPasswordException"%><%@
page import="com.liferay.portal.UserReminderQueryException"%><%@
page import="com.liferay.portal.UserScreenNameException"%><%@
page import="com.liferay.portal.WebsiteURLException"%><%@
page import="com.liferay.portal.security.auth.AuthException"%><%@
page import="com.liferay.portal.DuplicateUserEmailAddressException"%>


<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>

<%@ page import="com.liferay.portal.kernel.util.Constants"%>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@ page import="com.liferay.portal.security.permission.ActionKeys"%>
<%@ page import="com.liferay.portal.theme.ThemeDisplay"%>
<%@ page import="com.liferay.portal.util.PortalUtil"%><%@
page import="com.liferay.portal.model.*"%><%@
page import="com.liferay.portal.model.impl.*"%><%@
page import="com.liferay.portal.kernel.util.CalendarFactoryUtil"%><%@
page import="java.util.Calendar"%><%@
page import="com.liferay.portal.kernel.util.LocaleUtil"%><%@
page import="java.util.Locale"%><%@
page import="com.liferay.portal.kernel.util.Validator"%><%@
page import="java.util.Collections" %><%@
page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%@
page import="com.liferay.portal.kernel.util.StringUtil" %>
<%@ page import="com.liferay.portal.service.AddressLocalServiceUtil" %>



<liferay-theme:defineObjects />

<portlet:defineObjects />