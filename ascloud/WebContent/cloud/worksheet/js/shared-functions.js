// Method to show remaining characters in a span
function limitcharById(elementId, spanId, totallength) {

    if (document.getElementById(elementId).value.length > totallength) {
        document.getElementById(elementId).value = document.getElementById(elementId).value.substring(0, totallength);
    }
    else {
        document.getElementById(spanId).innerHTML = totallength - parseInt(document.getElementById(elementId).value.length);

    }
}