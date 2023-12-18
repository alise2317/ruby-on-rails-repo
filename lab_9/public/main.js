func = async () =>{
const n = document.getElementById("val").value;
const url = 'http://localhost:3000/lab_9/view.json?val=' + n

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

    document.getElementById("result").innerHTML = "<hr/>Найденное количество значений: " + data.result + "<hr/>;";
    document.getElementById("solve").appendChild(table);
}
