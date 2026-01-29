//Auto jump to next field       
var downStrokeField;
function autojump(fieldName, nextFieldName, fakeMaxLength) {
    var myForm = document.forms[document.forms.length - 1];
    var myField = myForm.elements[fieldName];
    myField.nextField = myForm.elements[nextFieldName];
    if (myField.maxLength == null)
        myField.maxLength = fakeMaxLength;
    myField.onkeydown = autojump_keyDown;
    myField.onkeyup = autojump_keyUp;
}
function autojump_keyDown() {
    this.beforeLength = this.value.length;
    downStrokeField = this;
}
function autojump_keyUp() {
    if ((this == downStrokeField) && (this.value.length > this.beforeLength) && (this.value.length >= this.maxLength))
        this.nextField.focus();
    downStrokeField = null;
}
autojump('Day', 'Month', 2);
autojump('Month', 'Year', 2);
autojump('Year', 'Hrs', 4);
autojump('Hrs', 'Min', 2);
autojump('Min', 'Sec', 2);
autojump('Sec', 'place', 2);

//End function