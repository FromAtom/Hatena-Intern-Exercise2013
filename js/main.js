// 課題 JS-1: 関数 `parseLTSVLog` を記述してください
function parseLTSVLog (logString){
    var parsedLog = new Array();

    var logs = logString.split("\n");

    for(var i = 0; i < logs.length-1; i++){
        var hashedLog = toHashLog(logs[i]);
        parsedLog[i] = hashedLog;
    }

    return parsedLog;
}

//ログ1行を連想配列変換する関数
function toHashLog (log){
    var elements = log.split("\t");
    var elementHashObj = {};

    for(var i in elements){
        var parsedElement = elements[i].split(":");

        if(parsedElement[0] === "reqtime_microsec")
            parsedElement[1] = parseInt(parsedElement[1]);

        elementHashObj[parsedElement[0]] = parsedElement[1];
    }

    return elementHashObj;
}

// 課題 JS-2: 関数 `createLogTable` を記述してください
function createLogTable (elementNode, logArray) {
    var table     = document.createElement("table");
    var tableBody = document.createElement("tbody");
    var tableHead = document.createElement("thead");

    var head_row = document.createElement("tr");
    var log = logArray[0];

    for (var log_key in log) {
        var cell = document.createElement("th");
        var cellText = document.createTextNode(log_key);
        cell.appendChild(cellText);
        head_row.appendChild(cell);
    }

    tableHead.appendChild(head_row);
    table.appendChild(tableHead);
    elementNode.appendChild(table);

    for (var i = 0; i < logArray.length; i++) {
        var row = document.createElement("tr");
        for (var key in logArray[i]) {
            var cell = document.createElement("td");
            var cellText = document.createTextNode(logArray[i][key]);
            cell.appendChild(cellText);
            row.appendChild(cell);
        }

        tableBody.appendChild(row);
    }

    table.appendChild(tableBody);
}
