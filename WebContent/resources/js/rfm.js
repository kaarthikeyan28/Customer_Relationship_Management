
var DbDetails = {};
var DbFields = {};
var tableData = {};

function loadData() {
    const url = "/CRM/getRfmData";

    fetch(url)
        .then(response => response.json())

        .then(json => {
            console.log(json);
            setTable(json);
            tableData = json;
        }
        );
}


function drawGraph(variable) {
    var recencyCount = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0 }
    var frequencyCount = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0 }
    var monetaryCount = { 1: 0, 2: 0, 3: 0, 4: 0, 5: 0 }

    tableData.forEach(item => {
        recencyCount[item.R] += 1;
        frequencyCount[item.F] += 1;
        monetaryCount[item.M] += 1;
    });
    var data;
    if (variable == 'r') {
        data = [recencyCount[1], recencyCount[2], recencyCount[3], recencyCount[4], recencyCount[5]];
    }
    else if (variable == 'f') {
        data = [frequencyCount[1], frequencyCount[2], frequencyCount[3], frequencyCount[4], frequencyCount[5]];
    }
    else {
        data = [monetaryCount[1], monetaryCount[2], monetaryCount[3], monetaryCount[4], monetaryCount[5]];
    }



    var myNode = document.getElementById("myChart").parentElement;
    document.getElementById("myChart").remove();
    var node = document.createElement("canvas");

    node.id = "myChart";
    node.width = "700";
    node.height = "700";
    myNode.appendChild(node);
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['1', '2', '3', '4', '5'],
            datasets: [{
                label: 'no of customers',
                data: data,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
}



function setTable(tabledata) {

    tabledata.forEach(item => {
        item.R = 6 - item.R;
        item.F = 6 - item.F;
        item.M = 6 - item.M;
    });
    //initialize table
    var elem = document.getElementById("tableData");
    elem.parentNode.classList.add("c-card--height");
    elem.classList.remove("c-card__logo");
    elem.classList.add("c-card__table");

    document.getElementById("tableButton").classList.add("h-hide");


    var table = new Tabulator("#tableData", {
        data: tabledata,           //load row data from array
        layout: "fitColumns",      //fit columns to width of table
        responsiveLayout: "hide",  //hide columns that dont fit on the table
        tooltips: true,            //show tool tips on cells
        addRowPos: "top",          //when adding a new row, add it to the top of the table
        history: true,             //allow undo and redo actions on the table
        pagination: "local",       //paginate the data
        paginationSize: 20,         //allow 7 rows per page of data
        movableColumns: true,      //allow column order to be changed
        resizableRows: true,       //allow row order to be changed
        autoResize: true,
        initialSort: [             //set the initial sort order of the data
            { column: "name", dir: "asc" },
        ],
        columns: [                 //define the table columns
            { title: "Name", field: "customerName", width: 150 },
            { title: "Recency", field: "Recency" },
            { title: "Frequency", field: "Frequency", sorter: "date" },
            { title: "Monetary", field: "Monetary", hozAlign: "center" },
            { title: "R", field: "R", formatter: "star", hozAlign: "center" },
            { title: "F", field: "F", formatter: "star", hozAlign: "center" },
            { title: "M", field: "M", formatter: "star", hozAlign: "center" },
            { title: "RFM", field: "RFMGroup", hozAlign: "center" },
            { title: "SCORE", field: "RFMScore", hozAlign: "center" },
        ],
    });

    window.addEventListener('resize', function () {
        table.redraw();
    });
}





