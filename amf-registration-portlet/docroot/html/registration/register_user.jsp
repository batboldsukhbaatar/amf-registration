<%@include file="/html/init.jsp" %>
<%
	boolean male = ParamUtil.getBoolean(request, "male", true);

	Calendar birthdayCalendar = CalendarFactoryUtil.getCalendar();

	birthdayCalendar.set(Calendar.MONTH, Calendar.JANUARY);
	birthdayCalendar.set(Calendar.DATE, 1);
	birthdayCalendar.set(Calendar.YEAR, 1970);
%>
<%
	String redirect = PortalUtil.getCurrentURL(renderRequest);
%>
<portlet:actionURL name="registerUser" var="createAccountURL"
	windowState="normal" />


<aui:form action="<%=createAccountURL%>" method="post" name="fm">
	<liferay-ui:error exception="<%= ContactBirthdayException.class %>"
	 message="please-enter-a-valid-birthday" />
	
	<liferay-ui:error exception="<%= ContactFirstNameException.class %>"
	 message="please-enter-a-valid-first-name" />
	
	<liferay-ui:error exception="<%= ContactFullNameException.class %>"
	 message="please-enter-a-valid-first-middle-and-last-name" />
	
	<liferay-ui:error exception="<%= ContactLastNameException.class %>" 
	message="please-enter-a-valid-last-name" />
	
	<liferay-ui:error exception="<%= DuplicateUserEmailAddressException.class %>"
	 message="the-email-address-you-requested-is-already-taken" />
	
	<liferay-ui:error exception="<%= EmailAddressException.class %>" 
	message="please-enter-a-valid-email-address" />
	
	<liferay-ui:error exception="<%= NoSuchCountryException.class %>"
	message="please-select-a-country" />
	
	<liferay-ui:error exception="<%= NoSuchListTypeException.class %>"
	 message="please-select-a-type" />
	
	<liferay-ui:error exception="<%= NoSuchRegionException.class %>"
	 message="please-select-a-region" />
	
	<liferay-ui:error exception="<%= PhoneNumberException.class %>"
	 message="please-enter-a-valid-phone-number" />
	
	<liferay-ui:error exception="<%= RequiredFieldException.class %>" 
	message="please-fill-out-all-required-fields" />
	
	<liferay-ui:error exception="<%= TermsOfUseException.class %>" 
	message="you-must-agree-to-the-terms-of-use" />
	
	<liferay-ui:error exception="<%= UserEmailAddressException.class %>"
	 message="the-email-address-you-requested-is-already-taken" />
	
	<liferay-ui:error exception="<%= UserPasswordException.class %>"
	 message="that-password-is-invalid-please-enter-a-different-password" />
	
	<liferay-ui:error exception="<%= UserScreenNameException.class %>"
	 message="please-enter-a-valid-alphanumeric-screen-name"/>


	


	<aui:input name="redirect" type="hidden" value="<%=redirect%>" />
	<aui:model-context model="<%=Contact.class%>" />


     <legend><span>Basic Info</span></legend>
	<aui:fieldset column="<%=true%>">
	
		<aui:col width="<%=50%>">

			<aui:input name="emailAddress">
				<aui:validator name="required" />
			</aui:input>

			<aui:input autoFocus="<%=true%>" model="<%=User.class%>"
				name="firstName" />
			<aui:input autoFocus="<%=true%>" model="<%=User.class%>"
				name="lastName" />
			<%
				User selUser = null;
				Contact selContact = null;
				Locale userLocale = null;
				Address address;
				String languageId = request.getParameter("languageId");
				
				if (Validator.isNotNull(languageId)) {
						userLocale = LocaleUtil.fromLanguageId(languageId);
				}
				
			%>

		</aui:col>

		<aui:col width="<%=50%>">
			<aui:input label="password" name="password1" size="30"
				type="password" value="" />

			<aui:input label="enter-again" name="password2" size="30"
				type="password" value="">
				<aui:validator name="equalTo">
						'#<portlet:namespace />password1'
					</aui:validator>
			</aui:input>



			<aui:input name="birthday" value="<%=birthdayCalendar%>" />



			<aui:select label="gender" name="male">
				<aui:option label="male" value="1" />
				<aui:option label="female" selected="<%=!male%>" value="0" />
			</aui:select>



		</aui:col>
	</aui:fieldset>
	
	<legend><span>Phone</span></legend>     
   	<aui:fieldset>		
		<aui:input   id='homePhone' name="homePhone" type="text"  />		
		<aui:input  id='mobilePhone' name="mobilePhone" type="text"  />	
	</aui:fieldset>
   
    <% Address address = null; %>
    <legend><span>Billing Address (US-Only)</span></legend>
    <aui:fieldset column="<%=true%>">
		<aui:model-context bean="<%= address %>" model="<%=Address.class%>" />
		<aui:col width="<%= 50 %>">
			<aui:input  fieldParam='addressStreet1' id='addressStreet1' name="street1"  />
			<aui:input fieldParam='addressStreet2' id='addressStreet2' name="street2" />
			<aui:select   label="region" name='addressRegionId' />
			<%-- <aui:script >
		 Liferay.Address.getRegions();
		</aui:script> --%>
		</aui:col>
		
		<aui:col width="<%= 50 %>">
			<aui:input   fieldParam='addressZip' id='addressZip' label="postal-code" name="zip" />
			<aui:input  fieldParam='addressCity' id='addressCity' name="city" />
		</aui:col>		
	</aui:fieldset>
	
	<legend><span>Misc.</span></legend>
    <aui:fieldset >
			<aui:select label="securityQuestion" name='securityQuestion' >
			<aui:option value="1">Must choose one of the following</aui:option>
			<aui:option value="2">What is you mother's maiden name?</aui:option>
			</aui:select>
			<aui:input  id='securityAnswer' label="securityAnswer" name="securityAnswer" type="text" />
			<aui:input  id='termOfUse' label="I have read, understand, 
			       and agree with the Terms of Use governing my access 
			       to and use of the Acme Movie Fanatics  web site." 
			       name="termOfUse" type="checkbox"/>
				
	</aui:fieldset>
	
	
	<aui:button-row>
		<aui:button type="submit" />
	</aui:button-row>
</aui:form>
