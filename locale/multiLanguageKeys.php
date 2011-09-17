<?php
/*
	Flo 2.0 PHP Framework
    Copyright (C) 2011  Flo Apps Ltd (www.floapps.com)

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

*/

foreach ($config['arrayOfLangs'] as $lang)
{
    switch ($lang)
    {
        case "eng":
            setlocale(LC_MESSAGES,'en_GB');
            break;

        case "fin":
            setlocale(LC_MESSAGES,'fi_FI');
            break;
    
        case "sve":
            setlocale(LC_MESSAGES,'sv_SE');
            break;
    }

    $domain = "flo"; //What you named your .po files
    bindtextdomain($domain,"/home/webadmin/shared_code/locale"); //Where you put the locale dir.
    bind_textdomain_codeset ($domain, 'UTF-8'); //otherwise gettext converts the charset
    textdomain($domain);

	// PDF translations
    $GLOBALS['PdfTranslationDate'][$lang] = _("Date");
    $GLOBALS['PdfTranslationVat'][$lang] = _("VAT");
    $GLOBALS['PdfTranslationBusinessId'][$lang] = _("Business ID");
    $GLOBALS['PdfTranslationClientBusinessId'][$lang] = _("Client's Business ID");
    $GLOBALS['PdfTranslationDueDate'][$lang] = _("Due date");
    $GLOBALS['PdfTranslationExclVat'][$lang] = _("Excl. VAT");
    $GLOBALS['PdfTranslationInterest'][$lang] = _("Penalty interest");
    $GLOBALS['PdfTranslationImmediately'][$lang] = _("NOW");
    $GLOBALS['PdfTranslationInvoice'][$lang] = _("INVOICE");
    $GLOBALS['PdfTranslationInvoiceNumber'][$lang] = _("Invoice nr");
    $GLOBALS['PdfTranslationMarginalTaxNotice'][$lang] = _("Marginal rate tax. Price does not contain deductible value-added tax.");
    $GLOBALS['PdfTranslationMustBePaid'][$lang] = _("TO BE PAID");
    $GLOBALS['PdfTranslationOurReference'][$lang] = _('Our ref.');
    $GLOBALS['PdfTranslationPayerDiscount'][$lang] = _("Subscription agent discount");
    $GLOBALS['PdfTranslationPhone'][$lang] = _("Tel.");
    $GLOBALS['PdfTranslationPostage'][$lang] = _("Postage");
    $GLOBALS['PdfTranslationPrice'][$lang] = _("Price");
    $GLOBALS['PdfTranslationProduct'][$lang] = _("Product");
    $GLOBALS['PdfTranslationRecipient'][$lang] = _("Recipient");
    $GLOBALS['PdfTranslationReferenceNumber'][$lang] = _("Ref. nr");
    $GLOBALS['PdfTranslationReminder'][$lang] = _("REMINDER");
    $GLOBALS['PdfTranslationReminderNotice'][$lang] = _("If you do not pay this invoice, it will be transferred to collection services.");
    $GLOBALS['PdfTranslationSubTotal'][$lang] = _("SUBTOTAL");
    $GLOBALS['PdfTranslationUseReferenceNumber'][$lang] = _("Please use reference number when paying");
    $GLOBALS['PdfTranslationYourReference'][$lang] = _('Your ref.');

	// login translations
    $GLOBALS['_DEARCUSTOMER'][$lang] = _('Dear Customer,');
    $GLOBALS['_ERROR'][$lang] = _('Error');
	$GLOBALS['_LANGUAGE'][$lang] = _('Language');
    $GLOBALS['_LOGIN_FAILED'][$lang] = _('Login failed');
    $GLOBALS['_LOGIN_FAILED_INFO'][$lang] = _('Login failed. Please check your username and password.');
    $GLOBALS['_LOGIN_FORGOT_PASS'][$lang] = _('Have you forgotten the password?');
    $GLOBALS['_PASSWORD'][$lang] = _('Password');
    $GLOBALS['_REMEMBER_LOGIN'][$lang] = _('Remember me<br />(admin users only)');
    $GLOBALS['_DEMO_PASSWORD_CANNOT_BE_CHANGED'][$lang] = _("The demo password cannot be changed.");
	$GLOBALS['_EMAIL'][$lang] = _("<br />(Members: Email address)");
	$GLOBALS['_EMAIL_SECURITY_IS_WEAK'][$lang] = _("Please note that e-mail security is weak. You can also request a new password by SMS by leaving a support request.");
	$GLOBALS['_EMAIL_SIGNATURE'][$lang] = _("\n\n--\nService provided by www.floapps.com");
	$GLOBALS['_GIVE_USER_ID_OR_EMAIL_ADDRESS'][$lang] = _("User ID<br />(individual members: email address)");
	$GLOBALS['_LOGIN'][$lang] = _("Log in");
	$GLOBALS['_LOGIN_LOCKED'][$lang] = _("Login locked");
	$GLOBALS['_LOGIN_DISABLED'][$lang] = _("Your login failed five times. Login has been disabled for one hour.");
	$GLOBALS['_NEW_PASSWORD'][$lang] = _("New password");
	$GLOBALS['_NEW_PASSWORD_WAS_SENT_BY_EMAIL'][$lang] = _("The new password was sent by e-mail.");
	$GLOBALS['_NO_JAVASCRIPT_DETECTED'][$lang] = _("Some features require JavaScript. Please enable JavaScript in your browser settings before you continue.");
	$GLOBALS['_NO_SUCH_USERNAME_EXISTS'][$lang] = _("No such username exists or e-mail address is not functioning.");
	$GLOBALS['_ON_THIS_PAGE_YOU_CAN_REQUEST_NEW_PASSWORD'][$lang] = _("On this page you can request a temporary password. Your new password will be sent to you by e-mail.");
	$GLOBALS['_PSWDSUBMIT'][$lang] = _("Request a new password");
	$GLOBALS['_REREGISTER'][$lang] = _("Log in again");
	$GLOBALS['_RESETTING_PASSWORD'][$lang] = _("Reset password");
	$GLOBALS['_RETURN_TO_LOGIN'][$lang] = _("Return to the login page");
	$GLOBALS['_SUPPORT_REQUEST'][$lang] = _("Support request / Knowledgebase");
	$GLOBALS['_TO_HOME'][$lang] = _("Back to start");
	$GLOBALS['_UNREGISTEREDWELCOME'][$lang] = _("You have logged out of the system. Welcome again!");
	$GLOBALS['_USER_ID'][$lang] = _("User ID");
	$GLOBALS['_YOUR_BROWSER_IS_OBSOLETE'][$lang] = _("Your browser is obsolete (you are using Internet Explorer 7.0 or older). You can use the service, but we recommend you upgrade your browser to a newer version.");

}
