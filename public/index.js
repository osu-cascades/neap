var linksToWelcome = document.getElementsByClassName("link-to-home");
var i;

for (i = 0; i < linksToWelcome.length; i++) {
    linksToWelcome[i].addEventListener("click", function () {
        open("index.html", "_self");
    });
}
