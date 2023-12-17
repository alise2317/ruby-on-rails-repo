func = async () =>{
const n = document.getElementById("val").value;
const url = 'http://localhost:3000/lab_9/view.json?val=' + n


    //var my_JSON_object = {};
    var xhr = new XMLHttpRequest();      // объект для оправки запроса
    xhr.open('GET', url, true);          //соединяю с конроллером   
    xhr.send();                        
    xhr.onreadystatechange = function () {       // обработчик ответа, кот вызывается после получения данных или ошибки
        if (xhr.readyState == done && xhr.status == ok) {  // проверка что запрос завершен и данные получены и запрос без ошибок
            //my_JSON_object = JSON.parse(xhr.responseText);
            //show_result(my_JSON_object);
            var responses = JSON.parse(xhr.responseText);  //преобразовываю в js
            var results = responses.result;     // присваиваю значение из конроллера в переменную
            document.getElementById("result").innerHTML = "<hr/>Найденное количество значений: "
                + results + "<hr/>;"     //вывожу результат на страницу html
        }
    };
    //xhr.send();        //реальная отправка запроса
//return false;
// function show_result(data) {
    
//     var result = document.getElementById("result");
//     result.innerHTML = "<hr/>Найденное количество значений: " + data.value + "<hr/><p>" + Date() + "</p>";

// }
    var table = document.createElement("table");
    table.setAttribute("border", "1");
    var tr = document.createElement("tr");
    var th1 = document.createElement("th");
    th1.innerHTML = "Счётчик автоморфных чисел";
    var th2 = document.createElement("th");
    th2.innerHTML = "Исходное число";
    var th3 = document.createElement("th");
    th3.innerHTML = "Квадрат числа";
    tr.appendChild(th1);
    tr.appendChild(th2);
    tr.appendChild(th3);
    table.appendChild(tr);

    var response = await fetch('http://localhost:3000/lab_9/view.json?val=' + n);
    var data = await response.json();

    console.log(data)
    data.solve.forEach(function (row) {
        var tr = document.createElement("tr");
        row.forEach(function (value) {
            var td = document.createElement("td");
            td.innerHTML = value;
            tr.appendChild(td);
        });
        table.appendChild(tr);
    });

    document.getElementById("result").innerHTML = "<hr/>Найденное количество значений: " + data.result + "<hr/>;"
    document.getElementById("solve").appendChild(table);
}
// var link = document.createElement("a");
// link.href = "http://127.0.0.1:3000/";
// link.innerHTML = "Повторить вычисления";
// document.body.appendChild(link);
// <a onclick="document.location.href = 'http://127.0.0.1:3000/" style="cursor:pointer;">повторит вычисления</a>
// <a onclick="document.location.replace('http://127.0.0.1:3000/');" style="cursor:pointer;">повторить вычисления</a>
