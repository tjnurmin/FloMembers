<?php
mb_internal_encoding('UTF-8');
header('Content-Type: text/html; charset=UTF-8');
require_once 'include/functions.inc.php';
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />

<script type="text/javascript">
/* <![CDATA[ */ 
$(document).ready(function() {  
    /* perform AJAX on selected forms
    target      = target element(s) to be updated with server response
    beforeCheck = pre-submit callback
    afterMath   = post-submit callback
    */
    var options = {
        target:       '#showAjaxResult',
        success:      afterMath
    };
    $('.ajaxForm').ajaxForm(options);
});

function afterMath() {
    self.parent.tb_remove();
    parent.document.location.reload();
}
/* ]]> */ 
</script>
<style type="text/css">
#css_form label {
    width: 80px;
}
</style>

</head>
<body>
