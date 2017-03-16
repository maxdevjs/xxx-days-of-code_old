var panel;

function setup(yymmdd, prev, next, desc, issueNumber, links) {
    document.title = yymmdd;
    panel= QuickSettings.create(10, 10, yymmdd)
        // .addHTML("home", '<a href="../">CALENDAR</a> - <a href="../thumbs.html">THUMBS</a>');
        .addHTML("home", '<a href="../">CALENDAR</a>');

    var prevNext = '';
    if(prev) {
        prevNext += '<a href="' + prev + '.html">PREV</a>';
        if(next) {
            prevNext += " - ";
        }
    }
    if(next) {
        prevNext += '<a href="' + next + '.html">NEXT</a>'
    }

    panel
        .addHTML("Source, Comments, Social", '<a href="https://github.com/max-devjs/xxx-days-of-code/blob/master/dailies-md/' + yymmdd + '.md"><img src="../images/github.png"></a><a href="https://github.com/max-devjs/xxx-days-of-code/issues/' + issueNumber + '"><img src="../images/comment.png"></a><a href="https://twitter.com/home?status=Check it: https://max-devjs.github.io/xxx-days-of-code/dailies/' + yymmdd + '.html %23100DaysOfCode %23301daysofcode"><img src="../images/twitter.png"></a><a href="https://www.facebook.com/sharer.php?u=https://max-devjs.github.io/xxx-days-of-code/dailies/' + yymmdd + '.html"><img src="../images/facebook.png"></a>')
        .addHTML("prev_next", prevNext)
        .addHTML("Description", desc);

        if(links) {
            panel.addHTML("Links", "");
            for(var i = 0; i < links.length; i++) {
                panel.addHTML("link" + i, links[i]);
            }
        }
    panel
        .hideAllTitles()
        .showTitle("Source, Comments, Social")
        .showTitle("Description");

    if(links) {
        panel.showTitle("Links");
    }

    // var script = document.createElement("script");
    // script.src = yymmdd + ".js";
    // document.body.appendChild(script);
}
