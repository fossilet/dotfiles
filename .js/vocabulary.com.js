// Since Thu Jan 15 17:51:23 CST 2015
// Fix progress display.

klass = "i.progress.icon.med";

function rm() {
    offset = $(klass).attr("data-prg");
    $(klass).css({
        'background-position-x': offset + '%',
    });
}

// Fix after the progress guage is displayed.
setTimeout(rm, 3000);
