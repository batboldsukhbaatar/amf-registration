package com.liferay.training;

import com.liferay.portal.AddressCityException;
import com.liferay.portal.AddressStreetException;
import com.liferay.portal.AddressZipException;
import com.liferay.portal.CompanyMaxUsersException;
import com.liferay.portal.ContactBirthdayException;
import com.liferay.portal.ContactFirstNameException;
import com.liferay.portal.ContactFullNameException;
import com.liferay.portal.ContactLastNameException;
import com.liferay.portal.DuplicateOpenIdException;
import com.liferay.portal.DuplicateUserEmailAddressException;
import com.liferay.portal.EmailAddressException;
import com.liferay.portal.GroupFriendlyURLException;
import com.liferay.portal.NoSuchCountryException;
import com.liferay.portal.NoSuchListTypeException;
import com.liferay.portal.NoSuchOrganizationException;
import com.liferay.portal.NoSuchRegionException;
import com.liferay.portal.OrganizationParentException;
import com.liferay.portal.PhoneNumberException;
import com.liferay.portal.RequiredFieldException;
import com.liferay.portal.RequiredUserException;
import com.liferay.portal.TermsOfUseException;
import com.liferay.portal.UserEmailAddressException;
import com.liferay.portal.UserIdException;
import com.liferay.portal.UserPasswordException;
import com.liferay.portal.UserScreenNameException;
import com.liferay.portal.UserSmsException;
import com.liferay.portal.WebsiteURLException;
import com.liferay.portal.kernel.captcha.CaptchaMaxChallengesException;
import com.liferay.portal.kernel.captcha.CaptchaTextException;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.Address;
import com.liferay.portal.model.Company;
import com.liferay.portal.model.ListTypeConstants;
import com.liferay.portal.model.User;
import com.liferay.portal.service.AddressLocalServiceUtil;
import com.liferay.portal.service.ListTypeServiceUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portlet.expando.model.ExpandoColumn;
import com.liferay.portlet.expando.model.ExpandoColumnConstants;
import com.liferay.portlet.expando.model.ExpandoValue;
import com.liferay.portlet.expando.service.ExpandoColumnLocalServiceUtil;
import com.liferay.portlet.expando.service.ExpandoValueLocalServiceUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

/**
 * Portlet implementation class AmfRegistrationPortlet
 */
public class AmfRegistrationPortlet extends MVCPortlet {

	
	@Override
	public void doView(
			RenderRequest renderRequest, RenderResponse renderResponse)
		throws IOException, PortletException {
		
		renderResponse.addProperty("mvcPath",
				"/html/registration/register_user.jsp");
		SessionMessages.add(renderRequest, "user-registered");
		include(viewTemplate, renderRequest, renderResponse);
	}
	/**
	 * Adds the User to the database incrementing the primary key
	 *
	 */
	public void registerUser(ActionRequest request, ActionResponse response)
			throws Exception {

		ThemeDisplay themeDisplay = (ThemeDisplay) request
				.getAttribute(WebKeys.THEME_DISPLAY);


		boolean autoPassword = true;
		String password1 = null;
		String password2 = null;
		boolean autoScreenName = true;
		String screenName = null;		
		long facebookId = 0;
		String openId = StringPool.BLANK;
		
		String emailAddress = ParamUtil.getString(request, "emailAddress");
		String firstName = ParamUtil.getString(request, "firstName");
		String lastName = ParamUtil.getString(request, "lastName");
		password1 = ParamUtil.getString(request, "password1");
		password2 = ParamUtil.getString(request, "password2");
		String gender = ParamUtil.getString(request, "gender");
		String homePhone = ParamUtil.getString(request, "homePhone");
		String mobilePhone = ParamUtil.getString(request, "mobilePhone");
		String street1 = ParamUtil.getString(request, "addressStreet1");
		String street2 = ParamUtil.getString(request, "addressStreet2");
		String region = ParamUtil.getString(request, "addressRegionId");
		String postalCode = ParamUtil.getString(request, "addressZip");
		String city = ParamUtil.getString(request, "addressCity");
		String securityQuestion = ParamUtil.getString(request, "securityQuestion");
		String securityAnswer = ParamUtil.getString(request, "securityAnswer");
		boolean termsOfUseAccepted = ParamUtil.getBoolean(request, "termOfUse");
		int birthdayMonth = ParamUtil.getInteger(request, "birthdayMonth");
		int birthdayDay = ParamUtil.getInteger(request, "birthdayDay");
		int birthdayYear = ParamUtil.getInteger(request, "birthdayYear");
		boolean male = false;
		if(gender.equalsIgnoreCase("1"))
			male = true;
		
		
		int prefixId = 12;
		int suffixId = 12;
		
		
		String jobTitle = null;
		long[] groupIds = null;
		long[] organizationIds = null;
		long[] roleIds = null;
		long[] userGroupIds = null;
		boolean sendEmail = false;

		long regionId= new Long("0");
		ServiceContext serviceContext = ServiceContextFactory.getInstance(
				User.class.getName(), request);
		
	   long creatorid = 10199L;
	   
	   try{
		   
		User user = UserLocalServiceUtil.addUser(
				creatorid, themeDisplay.getCompanyId(), autoPassword, password1, password2,
				autoScreenName, screenName, emailAddress, facebookId, openId,
				themeDisplay.getLocale(), firstName, "", lastName, prefixId,
				suffixId, male, birthdayMonth, birthdayDay, birthdayYear, jobTitle,
				groupIds, organizationIds, roleIds, userGroupIds, sendEmail,
				serviceContext);
	
		
		Address address =  AddressLocalServiceUtil.addAddress(user.getUserId(),
				user.getModelClassName(), user.getUserId(), street1, 
				street2, "", city, postalCode, 19002L, 19L, 
				ListTypeServiceUtil.getListTypes(ListTypeConstants.ACCOUNT_ADDRESS).get(0).getListTypeId(), false, true, serviceContext);
		
		
		SessionMessages.add(request, "user-registered");
		sendRedirect(request, response);
		
	   }catch(Exception e){

			if (e instanceof AddressCityException ||
				e instanceof AddressStreetException ||
				e instanceof AddressZipException ||
				e instanceof CaptchaMaxChallengesException ||
				e instanceof CaptchaTextException ||
				e instanceof CompanyMaxUsersException ||
				e instanceof ContactBirthdayException ||
				e instanceof ContactFirstNameException ||
				e instanceof ContactFullNameException ||
				e instanceof ContactLastNameException ||
				e instanceof DuplicateOpenIdException ||
				e instanceof EmailAddressException ||
				e instanceof GroupFriendlyURLException ||
				e instanceof NoSuchCountryException ||
				e instanceof NoSuchListTypeException ||
				e instanceof NoSuchOrganizationException ||
				e instanceof NoSuchRegionException ||
				e instanceof OrganizationParentException ||
				e instanceof PhoneNumberException ||
				e instanceof RequiredFieldException ||
				e instanceof RequiredUserException ||
				e instanceof TermsOfUseException ||
				e instanceof UserEmailAddressException ||
				e instanceof UserIdException ||
				e instanceof UserPasswordException ||
				e instanceof UserScreenNameException ||
				e instanceof UserSmsException ||
				e instanceof WebsiteURLException ||
				e instanceof UserEmailAddressException ||
				e instanceof DuplicateUserEmailAddressException) {

				SessionErrors.add(request, e.getClass(), e);
				response.setRenderParameter("mvcPath",
						"/html/registration/register_user.jsp");
			}
			
		
		
		   
	   }
	   
	   

	}
	/**
	 * Adds the User to the database incrementing the primary key
	 *
	 */
	public void addExpando(User user, Company company)
			throws Exception {
		
		ExpandoColumn column = ExpandoColumnLocalServiceUtil.addColumn(1111L,
				"Test Column", ExpandoColumnConstants.STRING_ARRAY);

		ExpandoValue value = ExpandoValueLocalServiceUtil.addValue(
				company.getCompanyId(), 111L, column.getColumnId(),
				user.getUserId(), "hi");

	String[] data = value.getStringArray();
		
	   

	}


}
