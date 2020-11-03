var linksToWelcome = document.getElementsByClassName("link-to-home");
var linksToPic = document.getElementsByClassName("link-to-pic")
var i;

for (i = 0; i < linksToWelcome.length; i++) {
    linksToWelcome[i].addEventListener("click", function () {
        open("home.html", "_self");
    });
}

for (i = 0; i < linksToPic.length; i++) {
    linksToPic[i].addEventListener("click", function () {
        open("choose_pic_source.html", "_self");
    });
}
