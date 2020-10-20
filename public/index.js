var linksToWelcome = document.getElementsByClassName("link-to-welcome");
var i;

for (i = 0; i < linksToWelcome.length; i++) {
    linksToWelcome[i].addEventListener("click", function () {
        open("welcome.html", "_self");
    });
}
