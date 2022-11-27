form = document.querySelector("#forms")
src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"
//Обработка запроса
let Storage = [];
let circles = document.querySelector('.circles');
form.addEventListener("submit", (e)=> {
    let element_y = document.querySelector('.y')
    let errorX = document.querySelector('#errorX')
    let errorY = document.querySelector('#errorY')
    errorX.innerHTML = ""
    errorY.innerHTML = ""
    element_y.value=element_y.value.replaceAll(",",".")
    let value_of_element = element_y.value

    let int_value_y = parseInt(value_of_element)
    if(isNaN(int_value_y) || int_value_y<-3 || int_value_y>3){
        errorY.innerHTML = "Введены не корректные данные. Повторите ввод!"
        e.preventDefault()
        return false
    }

    let element_x = document.querySelectorAll('.x')
    let count_check = 0;
    for(let i = 0; i<element_x.length;i++){
        if(element_x[i].checked) count_check++
    }
    if(count_check!=1){
        errorX.innerHTML = "Выберите одно значение X!"
        e.preventDefault()
        return false
    }
})

let svg = document.querySelector('.svg')
let square = document.querySelector('.square')
let circle = document.querySelector('.circle')
let triangle = document.querySelector('.triangle')

svg.onclick = function (event) {
    let r = Math.round(circle.getBoundingClientRect().x) - Math.round(square.getBoundingClientRect().x);
    let x = event.clientX - Math.round(circle.getBoundingClientRect().x);
    let y = Math.round(circle.getBoundingClientRect().y) - event.clientY;
    let rValue = document.querySelector('.r').value;
    let xValue = (rValue * x / r)  + 1;
    let yValue = (rValue * y / r)  - 1;

    let color;
    let cx = 150 - xValue * 100 / rValue;
    let cy = 150 + yValue * 100 / rValue;
    if(hit(-xValue,-yValue,rValue)) color="white";
    else color="red"
    let Lcircle = `<circle r="${3}" cx="${cx}" cy="${cy}" fill="${color}"></circle>`;
        circles.innerHTML += Lcircle;

    Storage.push(Lcircle);
    localStorage.setItem('Answer', JSON.stringify(Storage));
    document.querySelector('.y').value = -yValue;
    document.querySelector('.r').value = rValue;
    document.querySelector('#x_value_0').value = -xValue;
    document.querySelector('#x_value_0').checked = true;
    document.querySelector('.validate_button').click();
    document.querySelector('#x_value_0').value = 0;
}

function hit(x,y,r){
    if (x > 0 && y < 0) {
        return false;
    } else if (x >= 0 && y >= 0 && x <= r && y <= r / 2) {
        return  true;
    } else if (x < 0 && y < 0 && y >= -x - r) {
        return  true;
    } else if (x <= 0 && y >= 0 && y <= Math.sqrt(r * r  - x * x)) {
        return  true;
    }
}
function paint(){
     Storage = [];
    let newMatrix = JSON.parse(localStorage.getItem('Answer'))
    for (let i = 0; i< newMatrix.length ; i++) {
        Storage.push(newMatrix[i]);
    }
    for (let i = 0; i< Storage.length ; i++) {
        circles.innerHTML += Storage[i];
    }
}
paint();