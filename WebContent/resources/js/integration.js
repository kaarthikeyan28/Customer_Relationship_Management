
var DbDetails = {};
var DbFields = {};

function validate(elemid, obj) {
    var popup = document.getElementById(elemid);

    var input = popup.querySelectorAll('.datainput__input');
    console.log(input);
    var flag = 1;
    console.log('validating');
    Array.prototype.forEach.call(input, (elem) => {
        if (elem.tagName === "select") {
            DbDetails[elem.name] = elem.options[elem.selectedIndex].value;
            return;
        }

        if (elem.value === '') {

            elem.nextElementSibling.classList.remove('h-hide');
            flag = 0;
        }
        obj[elem.name] = elem.value;
    });
    if (flag == 1)
        return true;
    else return false;
}


function connectDb(elemid) {

    if (!validate(elemid, DbDetails)) return;

    // POST request using fetch() 
    console.log(DbDetails);
    // const proxyurl = "https://cors-anywhere.herokuapp.com/";
    const url = "/CRM/ConnectDB";

    fetch(url, {

        // Adding method type 
        method: "POST",

        // Adding body or contents to send 
        body: JSON.stringify(DbDetails),

        // Adding headers to the request 
        headers: {
            "X-Requested-With": "XMLHttpRequest",
            "Content-type": "application/json; charset=UTF-8",
            "Retry-After": 3600
        }
    })

        // Converting to JSON 
        .then(response => response.json())

        // Displaying results to console 
        .then(json => {
            console.log(json);
            if (json.connection == true) {
                document.getElementById("popupid2-submit").click();
                console.log("clicked", document.getElementById("popupid2-submit"));
            }
            else {
                const host = window.location.hostname;
                const proto = window.location.protocol;
                console.log(host, proto);
                console.log("failed");
                document.getElementById("popup__error").innerText="Connection Failed.Please check the username and password.";
                window.location.replace(proto + "/CRM/integrate#popupid");
            }

            DbDetails = json;
        }
        );


};


function fetchData(elemid) {
    if (!validate(elemid, DbFields)) return;
    const url = "/CRM/getData";
    fetch(url, {

        // Adding method type 
        method: "POST",

        // Adding body or contents to send 
        body: JSON.stringify([DbDetails.dbModel, DbFields]),

        // Adding headers to the request 
        headers: {
            "X-Requested-With": "XMLHttpRequest",
            "Content-type": "application/json; charset=UTF-8",
            "Retry-After": 3600
        }
    })

        // Converting to JSON 
        .then(response => response.json())

        // Displaying results to console 
        .then(json => {
            console.log(json);
            if(!json || Object.keys(json).length === 0){
            	const host = window.location.hostname;
                const proto = window.location.protocol;
                console.log(host, proto);
                console.log("failed");
                document.getElementById("popup__error1").innerText="Fetching Data Failed.Please check the Field name and it types";
                window.location.replace(proto + "/CRM/integrate#popupid4");
            }
            else{
            	const host = window.location.hostname;
                const proto = window.location.protocol;
                console.log(host, proto);
                window.location.replace(proto + "/CRM/integrate#");
                }
        }
        );

}



function loadData() {

    const url = "/CRM/getCustomersTable";


    fetch(url)

        .then(response => response.json())

        .then(json => {
            console.log(json);
            setTable(json);
        }
        );
}



function setTable(tabledata) {

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
            { title: "Name", field: "customerName", width: 100 },
            { title: "Email", width: 250, field: "customersEmail" },
            { title: "Invoice Date", width: 250, field: "invoiceDate", sorter: "date" },
            { title: "Product", field: "itemName", hozAlign: "center" },
            { title: "Quantity", field: "quantity", width: 125, hozAlign: "center" },

            { title: "Total", field: "totalAmount", width: 100, hozAlign: "center" },
        ],
    });

    window.addEventListener('resize', function () {
        table.redraw();
    });
}





