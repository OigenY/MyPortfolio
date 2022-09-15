const userInput = document.getElementById("userInpt");
var expression = '';

function press(num) {
    expression += num;
    userInput.value = expression;

}

function equal() {
    if (userInput.value == "") {
        alert("Please enter any numbers to equal!");
    } else {
        userInput.value = eval(expression);
        expression = userInput.value;
    }
}

function erase() {
    if (userInput.value == "") {
        alert("Please enter any numbers to erase!");
    } else {
        expression = '';
        userInput.value = expression;
    }
}
