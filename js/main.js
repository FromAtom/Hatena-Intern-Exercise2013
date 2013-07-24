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
