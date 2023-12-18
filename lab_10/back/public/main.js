const x2js = new X2JS()       // что это такое
const normalize = (str) => str.replaceAll('&lt;', '<').replaceAll('&gt;', '>').replaceAll('&quot;', '"')

func_1 = async () =>{
    const n = document.getElementById("val").value;
    const url = 'http://localhost:3000/lab_10/view.xml?val=' + n
    
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
    
        var response = await fetch(url);
        var data = x2js.xml_str2json(normalize(await response.text()))  //что оно делает
    
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


    func_2 = async () =>{
        const n = document.getElementById("val").value;
        const url = 'http://localhost:3000/lab_9/view.json?val=' + n
        var response = await fetch(url);
        const res = normalize(await response.text())
        document.getElementById("result").innerHTML = "<hr/>Найденное количество значений: " + res + "<hr/>;";
    }