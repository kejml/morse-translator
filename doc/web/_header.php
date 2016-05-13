<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">	   
  <head>		     
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />		     
    <meta name="description" content="" />		     
    <meta name="keywords" content="meeneyx" />		     
    <title>Morse Translator     
    </title>		     
    <link href="//fonts.googleapis.com/css?family=Antic" rel="stylesheet" type="text/css" />		     
    <link href="//fonts.googleapis.com/css?family=Shanti" rel="stylesheet" type="text/css" />          
<script src="js/jquery-1.7.2.min.js"></script>       
<script src="js/lightbox.js"></script>       		     
    <link rel="stylesheet" type="text/css" href="css/style.css" />         
    <link href="css/lightbox.css" rel="stylesheet" />          
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-167100-5']);
  //_gaq.push(['_setDomainName', '.kejml.eu']);
  _gaq.push(['_trackPageview']);
  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();  
</script>  	   
  </head>	   
  <body>		     
    <div id="outer">			       
      <div id="header">				         
        <div id="logo">					<h1>            
            <a href="index.php">Morse <span>Translator</span></a></h1>				         
        </div>				         
        <div id="nav">					           
          <ul>						             
            <li class="first<?php if($stranka=="oAplikaci") echo " active"?>">							               
              <a href="index.php">About</a>						             
            </li>						             
            <li class="<?php if($stranka=="screenshoty") echo "active"?>">							               
              <a href="screenshoty.php">Screenshots</a>						             
            </li>						             
            <li class="last<?php if($stranka=="autor") echo " active"?>">							               
              <a href="autor.php">Author</a>						             
            </li>					           
          </ul>					<br class="clear" />				         
        </div>			       
      </div>			       
      <div id="main">				         
        <div id="sidebar">					<h3>News</h3>					           
          <ul class="linkedList">
          <li class="first">                             
              <span class="date">07/09/2012               
              </span> - Version 1.0.0 sent to QA at Nokia                          
            </li>                                 
          </ul>                     <h3>Support Development</h3>					             
          <form action="https://www.paypal.com/cgi-bin/webscr" method="post" style="text-align: center;">              
            <input type="hidden" name="cmd" value="_s-xclick">              
            <input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7----- ">              
            <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">              
            <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">            
          </form>                        
          <p>If you like this app, you may donate using PayPal             
          </p>					           					<h3>Download</h3>					           
          <ul class="contactinfo">						             
            <li>Current version: 1.0.0             
            </li>                         
            <li>Download: <i>Comming soon</i>              
            <!--<a href="http://store.ovi.com/content/276932">Nokia Store</a>-->            
            </li>                         
            <!--<li>            
            <img src="http://qrcode.kaywa.com/img.php?s=5&d=http%3A%2F%2Fstore.ovi.com%2Fcontent%2F276932" alt="http://store.ovi.com/content/276932" />            
            </li>-->					           
          </ul>				         
        </div>				         
        <div id="content">					           
          <div id="box1">						             
            <div class="blogpost">							               
              <!--<img class="left" src="images/header4.jpg" width="800" height="200" alt="MeeNyx na Nokii N9" />-->