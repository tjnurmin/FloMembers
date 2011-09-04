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
}
