
var DbDetails = {};
var DbFields = {};

var rfmData = [];


function loadData() {
    const url = "/CRM/getRfmData";

    fetch(url)
        .then(response => response.json())

        .then(json => {
            console.log(json);
            rfmData = json;
        }
        );
}



function fetchData(category) {

    data = rfmData.filter((item) => {
        return item["Segment"] === category
    })
    setTable(data);

}


function setTable(tabledata) {

    //initialize table
    console.log(tabledata);
    var elem = document.getElementById("tableData");
    elem.parentNode.classList.add("c-card--height");
    elem.classList.remove("c-card__logo");
    elem.classList.add("c-card__table");

    //document.getElementById("tableButton").classList.add("h-hide");


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
            { title: "RFM", field: "RFMGroup", hozAlign: "center" },
            { title: "Cluster", field: "Segment", hozAlign: "center" },
        ],
    });

    window.addEventListener('resize', function () {
        table.redraw();
    });
}





window.onload = function () {

    var dataPlatinum = parseInt(document.getElementById("platinum").innerHTML);
    var dataGold = parseInt(document.getElementById("gold").innerHTML);
    var dataSilver = parseInt(document.getElementById("silver").innerHTML);
    var databronze = parseInt(document.getElementById("bronze").innerHTML);
	loadData();
    var data = [dataPlatinum, dataGold, dataSilver, databronze]


    // var myNode = document.getElementById("myChart").parentElement;
    // document.getElementById("myChart").remove();
    // var node = document.createElement("canvas");

    // node.id = "myChart";
    // node.width = "400";
    // node.height = "400";
    // myNode.appendChild(node);
    var ctx = document.getElementById("y").getContext("2d");
    console.log(ctx);
    var myChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ['Platinum', 'Gold', 'Silver', 'Bronze'],
            datasets: [{
                label: 'no of customers',
                data: data,
                backgroundColor: [
                    '#99ff99',
                    '#FFFF00',
                    '#C0C0C0',
                    '#f3c597',

                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                ],
                borderWidth: 1
            }]
        },

    });

}
