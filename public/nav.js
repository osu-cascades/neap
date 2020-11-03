
var goToFormButton = document.getElementsByName("link-to-form");
if(goToFormButton.length > 0)
	goToFormButton[0].addEventListener("click", function(){open("form_fields.html", "_self")});

var goToSigButton = document.getElementsByName("link-to-landing");
if(goToSigButton.length > 0)
	goToSigButton[0].addEventListener("click", function(){open("landing.html", "_self")});

var goToSigButton = document.getElementsByName("link-to-signature");
if(goToSigButton.length > 0)
	goToSigButton[0].addEventListener("click", function(){open("signature.html", "_self")});

var goToThankYouButton = document.getElementsByName("link-to-thank-you");
if(goToThankYouButton.length > 0)
	goToThankYouButton[0].addEventListener("click", function(){open("thankyou.html", "_self")});

var goToHomeButton = document.getElementsByName("link-to-home");
if(goToHomeButton.length > 0)
	goToHomeButton[0].addEventListener("click", function(){open("index.html", "_self")});

var goToPicButton = document.getElementsByName("link-to-pic-screen");
if(goToPicButton.length > 0)
	goToPicButton[0].addEventListener("click", function(){open("choose_pic_source.html", "_self")});

var goToPicButton = document.getElementsByName("link-to-new-user");
if(goToPicButton.length > 0)
	goToPicButton[0].addEventListener("click", function(){open("new_user.html", "_self")});

var goToPicButton = document.getElementsByName("link-to-NI");
if(goToPicButton.length > 0)
	goToPicButton[0].addEventListener("click", function(){window.location.href="http://www.neighborimpact.org", "_self"});