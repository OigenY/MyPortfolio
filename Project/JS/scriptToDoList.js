//get all required elements(Input)
const inputBox = document.querySelector(".inputField input");
const addBtn = document.querySelector(".inputField button");
const todoList = document.querySelector(".todoList");
const deleteAllBtn = document.querySelector(".footer button");

inputBox.onkeyup = () => {
    let userData = inputBox.value; // getting user entered value
    if (userData.trim() != 0) { //if user values aren't only spaces
        addBtn.classList.add("active");  //activate the add button 
    } else {
        addBtn.classList.remove("active");
    }
}
showTasks(); //calling showtask func

//if user click on the add button (LocalStorage)
addBtn.onclick = () => {
    let userData = inputBox.value; // getting user entered value
    let getLocalStorage = localStorage.getItem("New Todo") //getting local storage
    if (getLocalStorage == null) { //if local storage is null
        listArr = []; // creating blank array
    } else {
        listArr = JSON.parse(getLocalStorage); //transforming json string into js object
    }
    listArr.push(userData); // pushing or adding user data
    localStorage.setItem("New Todo", JSON.stringify(listArr)); //transforming js object into a json string
    showTasks(); //calling showtask func
    addBtn.classList.remove("active");
}

//adding li tag inside ul tag with js
function showTasks() {
    let getLocalStorage = localStorage.getItem("New Todo");
    if (getLocalStorage == null) { //if local storage is null
        listArr = []; // creating blank array
    } else {
        listArr = JSON.parse(getLocalStorage); //transforming json string into js object
    }
    const pendingNumb = document.querySelector(".pendingNumb");
    pendingNumb.textContent = listArr.length; //passing the length value in pendingNumb
    if (listArr.length > 0) { // if array length is > 0
        deleteAllBtn.classList.add("active"); //activate the clear all button
    } else {
        deleteAllBtn.classList.remove("active");
    }
    let newLiTag = '';
    listArr.forEach((element, index) => {
        newLiTag += `<li>${element}<span onclick="deleteTask(${index})"; ><i class="fa-solid fa-trash"></i></span></li>`;
    });
    todoList.innerHTML = newLiTag; //adding new li tag inside ul tag
    inputBox.value = ""; //once task added leave the input field blank
}

//delete task function
function deleteTask(index) {
    let getLocalStorage = localStorage.getItem("New Todo");
    listArr = JSON.parse(getLocalStorage);
    listArr.splice(index, 1); //delete or remove the particular indexed li
    //after remove the li again update the local storage
    localStorage.setItem("New Todo", JSON.stringify(listArr)); //transforming js object into a json string
    showTasks(); //calling showtask func
}

//delete all tasks function
deleteAllBtn.onclick = () => {
    listArr = []; //empty an array
    //after delete all tasks,  again update the local storage
    localStorage.setItem("New Todo", JSON.stringify(listArr)); //transforming js object into a json string
    showTasks(); //calling showtask func
}