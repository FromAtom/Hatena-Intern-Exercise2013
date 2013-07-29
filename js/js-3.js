// 課題 JS-3 の実装をここに記述してください。



var submitButton = document.getElementById('submit-button');
submitButton.addEventListener('click', function (e) {
    var textElement = document.getElementById("log-input");
    var logArray = parseLTSVLog(textElement.value);
    var containerElement = document.getElementById("table-container");

    createLogTable(containerElement,logArray);
}, false);
