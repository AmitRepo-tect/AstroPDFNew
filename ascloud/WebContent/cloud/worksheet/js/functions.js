function updateTips(t) {
tips
.text(t)
.addClass('ui-state-highlight');
setTimeout(function () {
tips.removeClass('ui-state-highlight', 1500);
}, 500);
}

function validationMsg(msg) {
updateTips(msg);
return false;
}

function isRealNumber(NumberToTest) {
    var IsFound = /^(\+|-)?[0-9][0-9]*(\.[0-9]*)?$/.test(NumberToTest);
    return (IsFound);
}


function isIntegerNumber(NumberToTest) {
var IsFound = /^-?\d+$/.test(NumberToTest);
return (IsFound);
}