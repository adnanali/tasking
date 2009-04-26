// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// Always send the authenticity_token with ajax
$(document).ajaxSend(function(event, request, settings) {
    if ( settings.type == 'POST' ) {
        settings.data = (settings.data ? settings.data + "&" : "")
            + "authenticity_token=" + encodeURIComponent( AUTH_TOKEN );
        request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    }
});

$.ajaxSettings.accepts.html = $.ajaxSettings.accepts.script;

