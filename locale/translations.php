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

$GLOBALS['arrVatOptions'] = array(
    0   => 0,
    8   => 8,
    9   => 9,
    12  => 12,
    13  => 13,
    17  => 17,
    22  => 22,
    23  => 23
);

$GLOBALS['contactMethods'] = array(
    1 => "Tapaaminen",
    2 => "Email",
    3 => "Puhelin",
    4 => "WWW"
);

$GLOBALS['languages'] = array(
    'eng' => 'English',
    'fin' => 'suomi',
    'sve' => 'svenska'
);

$GLOBALS['postalAreas'] = array(
    array('Helsinki',0,10),
    array('Oulu',90,93),
    array('Hämeenlinna',11,14),
    array('Lahti',15,19),
    array('Turku',20,27),
    array('Pori',28,29),
    array('Forssa',30,32),
    array('Tampere',33,39),
    array('Jyväskylä',40,44),
    array('Kouvola',45,47),
    array('Kotka',48,49),
    array('Mikkeli',50,52),
    array('Lappeenranta',53,56),
    array('Lappeenranta',59,59),
    array('Savonlinna',57,58),
    array('Seinäjoki',60,64),
 	array('Vaasa',65,66),
 	array('Kokkola',67,69),
 	array('Kuopio',70,75),
 	array('Pieksämäki',76,79),
 	array('Joensuu',80,83),
 	array('Ylivieska',84,86),
 	array('Kajaani',87,89),
 	array('Oulu',90,93),
 	array('Kemi',94,95),
 	array('Rovaniemi',96,99)
);

$GLOBALS['region_in_province'] = array(
    1 => 6,
    2 => 1,
    3 => 2,
    4 => 3,
    5 => 1,
    6 => 4,
    7 => 1,
    8 => 2,
    9 => 2,
    10 => 1,
    11 => 5,
    12 => 2,
    13 => 2,
    14 => 3,
    15 => 4,
    16 => 3,
    17 => 1,
    18 => 2,
    19 => 1,
    20 => 2
);

$GLOBALS['rssFeeds'] = array(
    'http://hbl.fi/rss.xml'									=> 'Hbl.fi nyheter',
	'http://www.hs.fi/uutiset/rss/'							=> 'HS.fi Uusimmat',
	'http://www.taloussanomat.fi/rss'						=> 'Taloussanomat',
	'http://yle.fi/uutiset/rss/kotimaa.rss'             	=> 'YLE Kotimaa',
    'http://yle.fi/uutiset/rss/luonto_ja_ymparisto.rss' 	=> 'YLE Luonto ja ympäristö',
	'http://yle.fi/uutiset/rss/news.rss'					=> 'YLE News in English',
	'http://yle.fi/uutiset/rss/talous_ja_politiikka.rss'	=> 'YLE Talous ja politiikka',
	'http://yle.fi/uutiset/rss/tiede_ja_tekniikka.rss'		=> 'YLE Tiede ja tekniikka',
	'http://yle.fi/uutiset/rss/ulkomaat.rss'				=> 'YLE Ulkomaat',
	
	'http://yle.fi/alueet/rss/etela-karjala.rss'			=> 'YLE Etelä-Karjala',
	'http://yle.fi/alueet/rss/etela-savo.rss' 				=> 'YLE Etelä-Savo',
	'http://yle.fi/alueet/rss/hame.rss' 					=> 'YLE Häme',
	'http://yle.fi/alueet/rss/kainuu.rss' 					=> 'YLE Kainuu',
	'http://yle.fi/alueet/rss/keski-pohjanmaa.rss'          => 'YLE Keski-Pohjanmaa',
	'http://yle.fi/alueet/rss/keski-suomi.rss' 			    => 'YLE Keski-Suomi',
	'http://yle.fi/alueet/rss/kymenlaakso.rss' 			    => 'YLE Kymenlaakso',
	'http://yle.fi/alueet/rss/lappi.rss' 					=> 'YLE Lappi',
	'http://yle.fi/alueet/rss/meri-lappi.rss' 				=> 'YLE Meri-Lappi',
	'http://yle.fi/alueet/rss/pirkanmaa.rss' 				=> 'YLE Pirkanmaa',
	'http://yle.fi/alueet/rss/pohjanmaa.rss'				=> 'YLE Pohjanmaa',
	'http://yle.fi/alueet/rss/pohjois-karjala.rss'     	    => 'YLE Pohjois-Karjala',
	'http://yle.fi/alueet/rss/pohjois-pohjanmaa.rss' 		=> 'YLE Pohjois-Pohjanmaa',
	'http://yle.fi/alueet/rss/pohjois-savo.rss' 			=> 'YLE Pohjois-Savo',
	'http://yle.fi/alueet/rss/paijat-hame.rss' 			    => 'YLE Päijät-Häme',
	'http://yle.fi/alueet/rss/paakaupunkiseutu.rss'    	    => 'YLE Pääkaupunkiseutu',
	'http://yle.fi/alueet/rss/satakunta.rss' 				=> 'YLE Satakunta',
	'http://yle.fi/alueet/rss/uusimaa.rss' 				    => 'YLE Uusimaa',
	'http://yle.fi/alueet/rss/varsinais-suomi.rss' 		    => 'YLE Varsinais-Suomi'   
);


// shared (do not edit)
define("_COPYRIGHT", "(c) Flo Apps Ltd 2007-".date('y'));
define("_EMAIL_SIGNATURE_LINE_BREAKS", "\n<br />\n<br />--<br />\n");
define('_EURO', chr(128)); // for fpdf
define("_NEW_PASSWORD_EMAIL_MESSAGE", "Uusi salasananne on %1\$s \n\nErt nya lösenord är %1\$s \n\nYour new password is %1\$s \n\n");
define("_POSTAL_CODE_LEGEND", "[ http://www.itella.fi/palvelutjatuotteet/osoitepalvelut/postinumerotuotteet/postinumeroalueet.html ]");
define("_SUPPORTEMAIL", "info@floapps.com");
define("_URL", "URL (Internet)");

// obsolete (found in local sites; do not edit)
define('_ERROR', 'Virhe / Error');
define('_PAGENOTFOUND', 'Sivua ei löytynyt. / The page was not found.');

// outside Shared Code - if updated, must be updated in source files, too!
$outsideTranslations = array(
    _('Categories'),
    _('Questions'),
    _('Service provided by <a href="http://www.floapps.com">Flo Apps Ltd</a>. Data will be saved in a <a href="http://www.flomembers.fi/">FloMembers</a> registry.'),
    _('(to prevent an automated submission)'),
    _('Topic'),
    _('Topics'),
    _('Write here')
);


if ($lang_chosen == "fin")
{
    
    setlocale(LC_MESSAGES,'fi_FI');

    // arrays
    $GLOBALS['linkInfo'] = array(
        1 => "Sähköpostitse",
        2 => "Sekä paperilla että sähköpostilla",
        3 => "Ei halua",
        4 => "Paperilla"
    );
    $GLOBALS['provinces'] = array(
        1 => "Etelä-Suomen lääni",
        2 => "Länsi-Suomen lääni",
        3 => "Itä-Suomen lääni",
        4 => "Oulun lääni",
        5 => "Lapin lääni",
        6 => "Ahvenanmaan lääni"
    );
    $GLOBALS['_regions'] = array(
        1 => 'Ahvenanmaa',
        2 => 'Etelä-Karjala',
        3 => 'Etelä-Pohjanmaa',
        4 => 'Etelä-Savo',
        5 => 'Itä-Uusimaa',
        6 => 'Kainuu',
        7 => 'Kanta-Häme',
        8 => 'Keski-Pohjanmaa',
        9 => 'Keski-Suomi',
        10 => 'Kymenlaakso',
        11 => 'Lappi',
        12 => 'Pirkanmaa',
        13 => 'Pohjanmaa',
        14 => 'Pohjois-Karjala',
        15 => 'Pohjois-Pohjanmaa',
        16 => 'Pohjois-Savo',
        17 => 'Päijät-Häme',
        18 => 'Satakunta',
        19 => 'Uusimaa',
        20 => 'Varsinais-Suomi'
    );
    $GLOBALS['sexes'] = array(
        1 => "mies",
        2 => "nainen"
    );
  
    // locale
    define("_JS_CORRECT_VERIFY_WORD", "Sy&ouml;t&auml; oikea sana, ole hyv&auml;!");
    define("_JS_DATE_LOCALE_FILE", '<script type="text/javascript" src="/shared_files/js/date_fi.js"></script>');
    define("_JS_DATE_TRANSLATIONS",
    "$.dpText = {TEXT_PREV_YEAR:'Edellinen vuosi',
    TEXT_PREV_MONTH:'Edellinen kuukausi',
    TEXT_NEXT_YEAR:'Seuraava vuosi',
    TEXT_NEXT_MONTH:'Seuraava kuukausi',
    TEXT_CLOSE:'Sulje',
    TEXT_CHOOSE_DATE:'Valitse p&auml;iv&auml;'}");
    define("_JS_UNSAVED_CHANGES_WILL_BE_LOST", '"Tallentamattomat muutokset katoavat.\nHaluatko jatkaa?"');
    define("_JS_VALIDATOR_TRANSLATIONS",
'
	required: "T&auml;m&auml; kentt&auml; on pakollinen.",
	maxlength: jQuery.validator.format("Voit sy&ouml;tt&auml;&auml; enint&auml;&auml;n {0} merkki&auml;."),
	minlength: jQuery.validator.format("V&auml;hint&auml;&auml;n {0} merkki&auml;."),
	rangelength: jQuery.validator.format("Sy&ouml;t&auml; v&auml;hint&auml;&auml;n {0} ja enint&auml;&auml;n {1} merkki&auml;."),
	email: "Sy&ouml;t&auml; oikea s&auml;hk&ouml;postiosoite.",
	url: "Sy&ouml;t&auml; oikea URL osoite.",
	date: "Sy&ouml;t&auml; oikea p&auml;iv&auml;m&auml;&auml;r&auml;.",
	dateISO: "Sy&ouml;t&auml; oikea p&auml;iv&auml;m&auml;&auml;r&auml; (VVVV-MM-DD).",
	number: "Sy&ouml;t&auml; numero.",
	digits: "Sy&ouml;t&auml; pelk&auml;st&auml;&auml;n numeroita.",
	equalTo: "Sy&ouml;t&auml; sama arvo uudestaan.",
	range: jQuery.validator.format("Sy&ouml;t&auml; arvo {0} ja {1} v&auml;lilt&auml;."),
	max: jQuery.validator.format("Sy&ouml;t&auml; arvo joka on yht&auml; suuri tai suurempi kuin {0}."),
	min: jQuery.validator.format("Sy&ouml;t&auml; arvo joka on pienempi tai yht&auml; suuri kuin {0}."),
	creditcard: "Sy&ouml;t&auml; voimassa oleva luottokorttinumero."
');

    define("_SERVICE_PROVIDED_BY", "Palvelun tarjoaa <a href=\"http://www.floapps.com\">www.floapps.com</a>");
    define("_SEARCHINFO",
    'Voit antaa hakutermiksi yhden tai useampia sanoja. Hakutermin tulee olla vähintään kolme merkkiä pitkä. Voit käyttää seuraavia erikoismerkkejä:</p>
    <table width="65%" style="padding: 0 0 10px 25px;">
    <tr valign="top">
        <td><em>+hakusana</em></td>
        <td>Plus-merkki: sanan on esiinnyttävä hakutuloksessa.</td>
    </tr>
    <tr valign="top">
        <td><em>-hakusana</em></td>
        <td>Miinus-merkki: sana ei saa esiintyä hakutuloksessa.</td>
    </tr>
    <tr valign="top">
        <td><em>hakusan*</em></td>
        <td>Asteriski: voit katkaista hakusanan.</td>
    </tr>
    <tr valign="top">
        <td><em>&quot;useampi hakusana&quot;</em></td>
        <td>Lainausmerkit: voit hakea tietyllä fraasilla.</td>
    </tr>
    </table>'
    );
}
elseif ($lang_chosen == "sve")
{
    
    setlocale(LC_MESSAGES,'sv_SE');

    // arrays
    $GLOBALS['linkInfo'] = array(
        1 => "Via epost",
        2 => "På papper och via epost",
        3 => "Inget",
        4 => "På papper"
    );
    $GLOBALS['provinces'] = array(
        1 => "Södra Finlands län",
        2 => "Västra Finlands län",
        3 => "Östra Finlands län",
        4 => "Uleåborgs län",
        5 => "Lapplands län",
        6 => "Ålands län"
    );
    $GLOBALS['_regions'] = array(
        1 => 'Åland',
        2 => 'Södra Karelen',
        3 => 'Södra Österbotten',
        4 => 'Södra Savolax',
        5 => 'Östra Nyland',
        6 => 'Kajanaland',
        7 => 'Egentliga Tavastland',
        8 => 'Mellersta Österbotten',
        9 => 'Mellersta Finland',
        10 => 'Kymmenedalen',
        11 => 'Lappland',
        12 => 'Birkaland',
        13 => 'Österbotten',
        14 => 'Norra Karelen',
        15 => 'Norra Österbotten',
        16 => 'Norra Savolax',
        17 => 'Päijänne Tavastland',
        18 => 'Satakunda',
        19 => 'Nyland',
        20 => 'Egentliga Finland'
    );
    $GLOBALS['sexes'] = array(
        1 => "man",
        2 => "kvinna"
    );

    // locale
    define("_JS_CORRECT_VERIFY_WORD", "Ange det r&auml;tta ordet, var s&aring; god!");
    define("_JS_DATE_LOCALE_FILE", '<script type="text/javascript" src="/shared_files/js/date_se.js"></script>');
    define("_JS_DATE_TRANSLATIONS",
    "$.dpText = {TEXT_PREV_YEAR:'F&ouml;reg&aring;ende &aring;r',
    TEXT_PREV_MONTH:'F&ouml;reg&aring;ende m&aring;nad',
    TEXT_NEXT_YEAR:'N&auml;sta &aring;r',
    TEXT_NEXT_MONTH:'N&auml;sta m&aring;nad',
    TEXT_CLOSE:'St&auml;ng',
    TEXT_CHOOSE_DATE:'V&auml;lj datum'}");
    define("_JS_UNSAVED_CHANGES_WILL_BE_LOST", '"Osparade &auml;ndringar kommer att f&ouml;rsvinna.\nVill du forts&auml;tta?"');
    define("_JS_VALIDATOR_TRANSLATIONS",
    '
	required: "Detta f&auml;lt &auml;r obligatoriskt.",
	maxlength: jQuery.validator.format("Du f&aring;r ange h&ouml;gst {0} tecken."),
	minlength: jQuery.validator.format("Du m&aring;ste ange minst {0} tecken."),
	rangelength: jQuery.validator.format("Ange minst {0} och max {1} tecken."),
	email: "Ange en korrekt e-postadress.",
	url: "Ange en korrekt URL.",
	date: "Ange ett korrekt datum.",
	dateISO: "Ange ett korrekt datum (&ARING;&ARING;&ARING;&ARING;-MM-DD).",
	number: "Ange ett korrekt nummer.",
	digits: "Ange endast siffror.",
	equalTo: "Ange samma v&auml;rde igen.",
	range: jQuery.validator.format("Ange ett v&auml;rde mellan {0} och {1}."),
	max: jQuery.validator.format("Ange ett v&auml;rde som &auml;r st&ouml;rre eller lika med {0}."),
	min: jQuery.validator.format("Ange ett v&auml;rde som &auml;r mindre eller lika med {0}."),
	creditcard: "Ange ett korrekt kreditkortsnummer."
');

    define("_SERVICE_PROVIDED_BY", "Tjänsten produceras av <a href=\"http://www.floapps.com\">www.floapps.com</a>");
    define("_SEARCHINFO",
    'Du kan söka med en eller flera sökord. Sökordet måste vara minst tre tecken långt. Du kan använda följande specialtecken:</p>
    <table width="65%" style="padding: 0 0 10px 25px;">
      <tr valign="top">
        <td><em>+sökord</em></td>
        <td>Plustecken: ordet måste ingå i sökresultatet.</td>
      </tr>
      <tr valign="top">
        <td><em>-sökord</em></td>
        <td>Minustecken: ordet får inte ingå i sökresultatet.</td>
      </tr>
      <tr valign="top">
        <td><em>sökor*</em></td>
        <td>Asterisk: du kan bryta sökordet.</td>
      </tr>
      <tr valign="top">
        <td><em>&quot;flera sökord&quot;</em></td>
        <td>Sitationstecken: du kan söka med en fras.</td>
      </tr>
    </table>'
    ); // OBS
}
else
{
    setlocale(LC_MESSAGES,'en_GB');

    // arrays
    $GLOBALS['linkInfo'] = array(
        1 => "By email",
        2 => "Via snailmail and email",
        3 => "None",
        4 => "Via snailmail"
    );
    $GLOBALS['provinces'] = array(
        1 => "Etelä-Suomi",
        2 => "Länsi-Suomi",
        3 => "Itä-Suomi",
        4 => "Oulun lääni",
        5 => "Lapin lääni",
        6 => "Ahvenanmaan lääni"
    );
    $GLOBALS['_regions'] = array(
        1 => 'Ahvenanmaa',
        2 => 'Etelä-Karjala',
        3 => 'Etelä-Pohjanmaa',
        4 => 'Etelä-Savo',
        5 => 'Itä-Uusimaa',
        6 => 'Kainuu',
        7 => 'Kanta-Häme',
        8 => 'Keski-Pohjanmaa',
        9 => 'Keski-Suomi',
        10 => 'Kymenlaakso',
        11 => 'Lappi',
        12 => 'Pirkanmaa',
        13 => 'Pohjanmaa',
        14 => 'Pohjois-Karjala',
        15 => 'Pohjois-Pohjanmaa',
        16 => 'Pohjois-Savo',
        17 => 'Päijät-Häme',
        18 => 'Satakunta',
        19 => 'Uusimaa',
        20 => 'Varsinais-Suomi'
    );
    $GLOBALS['sexes'] = array(
        1 => "man",
        2 => "woman"
    );

    // locale
    define("_JS_CORRECT_VERIFY_WORD", "Please enter the correct word!");
    define("_JS_DATE_LOCALE_FILE", ""); // englanninkieliset puuttuvat
    define("_JS_DATE_TRANSLATIONS", "");
    define("_JS_UNSAVED_CHANGES_WILL_BE_LOST", '"Unsaved changes will be lost.\nReally continue?"');
    define("_JS_VALIDATOR_TRANSLATIONS", "");

    define("_SERVICE_PROVIDED_BY", "Service provided by <a href=\"http://www.floapps.com\">www.floapps.com</a>");
    define("_SEARCHINFO",
    'A search string can consist of one or more words and must include at least 3 characters. You can use following special characters:</p>
    <table width="65%" style="padding: 0 0 10px 25px;">
      <tr valign="top">
        <td><em>+searchword</em></td>
        <td>Plus-sign: word must be present in every search result.</td>
      </tr>
      <tr valign="top">
        <td><em>-searchword</em></td>
        <td>Minus-sign: word is not allowed in search results.</td>
      </tr>
      <tr valign="top">
        <td><em>searchw*</em></td>
        <td>Asterisk: truncation operator (jokersign).</td>
      </tr>
      <tr valign="top">
        <td><em>&quot;several searchwords&quot;</em></td>
        <td>Doublequotes: matches rows that contain this phrase literally.</td>
      </tr>
    </table>'
    );
}


// concatenations
define("_EMAILSIGNATURE_HTML", _EMAIL_SIGNATURE_LINE_BREAKS . _SERVICE_PROVIDED_BY);

// sorting order
asort($GLOBALS['_regions']);
foreach ($GLOBALS['_regions'] as $key => $val)
{
    $GLOBALS['regions'][$key] = $val;
}

$domain = "flo"; //What you named your .po files
bindtextdomain($domain,"/home/webadmin/shared_code/locale"); //Where you put the locale dir.
bind_textdomain_codeset ($domain, 'UTF-8'); //otherwise gettext converts the charset
textdomain($domain);

//So, mo's go onto ./locale/$lang/LC_MESSAGES/appname.mo

//translate arrays made in coreConfig, since text domain was not set there
if (isset($GLOBALS['CustomMemberFieldsArrayForLists']))
    Accessories::applyTranslationsToFirstArrayItems($GLOBALS['CustomMemberFieldsArrayForLists']);