func = async () => {
    const n = document.getElementById("input-max").value;
    const url = "http://127.0.0.1:3000//lab9/view.json?n=" + n
    const response = await fetch(url);
    const result = (await response.json()).value

    const insert_number = (n) => {
        let s = n.toString()
        
        return s;
    };

    document.getElementById("result").innerHTML = `
<pre>
Result:
+----------------+----------------+
|       n        |       n*n      |
+----------------+----------------+
${result.map((x) => {
    return `| \t\t | \t\t  |
| ${insert_number(x)} | ${insert_number(x*x)} |`;
}).join('\n')}
+----------------+----------------+
| count:         | ${result.length}\t\t  |
+----------------+----------------+
</pre>`
};