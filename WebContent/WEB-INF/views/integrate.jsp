<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/9a3152f70a.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/integration.css" />
    <script src="${pageContext.request.contextPath}/resources/js/integration.js"></script>

    <%-- tabulator links --%>
   <link href="https://unpkg.com/tabulator-tables//dist/css/materialize/tabulator_materialize.min.css"
        rel="stylesheet">
    <script type="text/javascript" src="https://unpkg.com/tabulator-tables/dist/js/tabulator.min.js"></script>

    
    
    <title>CRM</title>
    <style>

    </style>

</head>

<body>
    <header class="header">
        <div class="header__logo">

        </div>
        <nav class="header__nav">
            <ul class="header__list">
                <li class="header__list-elem">Home</li>
                <li class="header__list-elem">About</li>
                <li class="header__list-elem">Docs</li>
                <li class="header__list-elem">Support</li>
                <li class="header__list-elem">Contact</li>
            </ul>
        </nav>
    </header>

    <div class="l-topcontainer">
        <aside class="sidebar">
            <div class="sidebar__sticky">
                <div class="sidebar__icon"><i class="fas fa-list-alt"></i>Menu bar</div>
                <ul class="sidebar__menu">

                    <li class="sidebar__list-elem sidebar__list-elem--active"><a href="/CRM/integrate">Integrate</a><i class="fas fa-database"></i>
                    </li>
                    <li class="sidebar__list-elem">Analytical<i class="fas fa-chart-line"></i></li>
                    <li class="sidebar__list-elem"><a href="/CRM/RFM">RFM</a><i class="fas fa-calculator"></i></li>
                    <li class="sidebar__list-elem"><a href="/CRM/segment">Segmentation</a><i class="fas fa-chart-pie"></i></li>
                    <li class="sidebar__list-elem"><a href="/CRM/Operations">Operational</a><i class="fas fa-cogs"></i></li>
                    <li class="sidebar__list-elem"><a href="/CRM/Leads">Leads</a><i class="far fa-id-card"></i></li>
                    <li class="sidebar__list-elem"></li>
                </ul>
            </div>
        </aside>

        <div class="main">
            <div class="c-card c-card--heading">
                <h2 class="c-card__heading">DASHBOARD</h2>
            </div>
            <!-- card 1 -->
            <div class="c-card">
                <div class="c-card__logo" data-name="integrateDB">

                </div>
                <div class="c-card__button">
                    <a class="c-card__submit" href="#popupid">
                        Integrate DB
                    </a>
                </div>
            </div>

            <!-- card 2 -->
            <div class="c-card">
                <div class="c-card__logo" data-name="spreadsheet">

                </div>
                <div class="c-card__button">
                    <a class="c-card__submit" >
                       <input type="file"> Upload CSV
                    </a>
                </div>
            </div>

            <!-- card 3 -->
            <div class="c-card c-card--full-width ">
                <div class="c-card__logo striped highlight" id="tableData" data-name="viewdata">

                </div>
                <div class="c-card__button" id="tableButton">
                    <button class="c-card__submit" onclick="loadData()">
                        View Data
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- dB Credintials popup --1 -->
    <div id="popupid" class="popup__container">
        <div class="popup">
            <h2 class="popup__heading">Enter DB details</h2>
            <a class="popup__close" href="#">&times;</a>
            <div class="popup__content" id="popup__error">
                
            </div>
            <div class="popup__row">
                <div class="popup__column">

                    <div class="datainput">

                        <select class="datainput__input dbform" id="dbvalue1" name="database">
                            <option value="mysql">Mysql</option>
                            <option value="postgres">Postgres</option>
                            <option value="oracle">Oracle</option>
                        </select>
                    </div>

                    <div class="datainput">
                        <label class="datainput__label " id="cardLabel" tabindex="1">host ip</label>
                        <input type="text" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" onchange="hideWarningClass(this)" name="host"
                            placeholder="host ip" />
                        <div class="h-hide datainput__warnings">Required</div>
                    </div>

                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">port</label>
                        <input type="text" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" onchange="hideWarningClass(this)" name="port"
                            placeholder="port" />
                        <div class="h-hide datainput__warnings">Required</div>
                    </div>



                </div>

                <div class="popup__column">
                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">Username</label>
                        <input type="text" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" onchange="hideWarningClass(this)" name="userName"
                            placeholder="Username" />
                        <div class="h-hide datainput__warnings">Required</div>
                    </div>

                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">Password</label>
                        <input type="Password" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" onchange="hideWarningClass(this)" name="password"
                            placeholder="Password" required />
                        <div class="h-hide datainput__warnings">Required</div>
                    </div>

                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">Database
                            Name</label>
                        <input type="text" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" onchange="hideWarningClass(this)" name="dbName"
                            placeholder="Database Name" />
                        <div class="h-hide datainput__warnings">Required</div>
                    </div>


                </div>

            </div>
            
            <div class="popup__button">
                <div class="c-card__button h-mar">
                    <a class="c-card__submit" onclick="connectDb('popupid')" href="#popupid2">
                        Confirm
                    </a>
                </div>
                <div class="c-card__button h-mar">
                    <a class="c-card__submit c-card__submit--blue">
                        Reset
                    </a>
                </div>
            </div>
        </div>
    </div>



    <!-- loading or confirmation popup 2 -->
    <div id="popupid2" class="popup__container">
        <div class="popup">
            <h2 class="popup__heading">Loading ...</h2>
            <a class="popup__close" href="#">&times;</a>
            <div class="popup__content">
            </div>
            <div class="popup__row popup__loading">
                <!-- <i class="fas fa-spinner"></i> -->

            </div>
            <div class="c-card__button h-mar">
                <a class="c-card__submit" id="popupid2-submit" href="#popupid3">
                    OK
                </a>
            </div>

        </div>
    </div>

      <div id="popupid3" class="popup__container">
        <div class="popup">
            <h2 class="popup__heading">Connection Established</h2>
            <a class="popup__close" href="#">&times;</a>
            <div class="popup__content">
            </div>
            <div class="popup__row popup__confirmed">
                <!-- <i class="fas fa-spinner"></i> -->

            </div>
            <div class="c-card__button h-mar">
                <a class="c-card__submit" id="popupid2-submit"  href="#popupid4">
                    OK
                </a>
            </div>

        </div>
    </div>


    <!-- Db details popup 3 -->
    <div id="popupid4" class="popup__container">
        <div class="popup">
            <h2 class="popup__heading">Enter DB details</h2>
            <a class="popup__close" href="#">&times;</a>
            <div class="popup__content" id="popup__error1">

            </div>
            <div class="popup__row">
                <div class="popup__column">

                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">Table Name</label>
                        <input type="text" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" onchange="hideWarningClass(this)" name="tableName"
                            placeholder="Table Name" />
                        <div class="h-hide datainput__warnings">Required</div>
                    </div>

                    <div class="datainput datainput--heading">
                        <h4 class="popup__heading">
                            Database Fields
                        </h4>
                    </div>


                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">invoice Date</label>
                        <input type="text" class="datainput__input" onchange="hideWarningClass(this)"
                            onfocus="addFocusClass(this)" onblur="removeFocusClass(this)" name="invoiceDate"
                            placeholder="invoice Date" />
                        <div class="h-hide datainput__warnings">Required</div>
                    </div>

                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">Customer ID</label>
                        <input type="text" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" onchange="hideWarningClass(this)" name="customerId"
                            placeholder="Customer ID" />
                        <div class="h-hide datainput__warnings">Required</div>
                    </div>

                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">Customer Name</label>
                        <input type="text" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" onchange="hideWarningClass(this)" name="customerName"
                            placeholder="Customer Name" />
                        <div class="h-hide datainput__warnings">Required</div>
                    </div>
                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">Customer Email</label>
                        <input type="text" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" onchange="hideWarningClass(this)" name="customerEmail"
                            placeholder="Customer Email" />
                        <div class="h-hide datainput__warnings">Required</div>
                    </div>

                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">product</label>
                        <input type="text" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" onchange="hideWarningClass(this)" name="itemName"
                            placeholder="product" />
                        <div class="h-hide datainput__warnings">Required</div>
                    </div>
                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">unit price</label>
                        <input type="text" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" onchange="hideWarningClass(this)" name="unitPrice"
                            placeholder="unit price" />
                        <div class="h-hide datainput__warnings">Required</div>
                    </div>

                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">quantity</label>
                        <input type="text" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" onchange="hideWarningClass(this)" name="quantity"
                            placeholder="quantity" />
                        <div class="h-hide datainput__warnings">Required</div>
                    </div>

                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">total amount</label>
                        <input type="text" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" onchange="hideWarningClass(this)" name="totalAmount"
                            placeholder="total amount" />
                        <div class="h-hide datainput__warnings">Required</div>
                    </div>


                </div>
                <div class="popup__column">

                    <div class="datainput datainput--heading datainput--margin-top">
                        <h4 class="popup__heading">
                            Field Types
                        </h4>
                    </div>

                    <div class="datainput">

                        <select class="datainput__input" id="dbvalue" name="invoiceDate_type">
                            <option value="varchar">VARCHAR</option>
                            <option  value="int">INT</option>
                            <option value="datetime">DATETIME</option>
                            <option value="date">DATE</option>
                            <option value="tinyint">TINYINT</option>
                            <option value="smallint">SMALLINT</option>
                            <option value="bigint">BIGINT</option>
                            <option value="float">FLOAT</option>
                            <option value="decimal">DECIMAL</option>
                            <option value="double">DOUBLE</option>
                        </select>
                    </div>

                    <div class="datainput">

                        <select class="datainput__input" id="dbvalue" name="customerId_type">
                            <option value="varchar">VARCHAR</option>
                            <option value="int">INT</option>
                            <option value="datetime">DATETIME</option>
                            <option value="date">DATE</option>
                            <option value="tinyint">TINYINT</option>
                            <option value="smallint">SMALLINT</option>
                            <option value="bigint">BIGINT</option>
                            <option value="float">FLOAT</option>
                            <option value="decimal">DECIMAL</option>
                            <option value="double">DOUBLE</option>
                        </select>
                    </div>


                    <div class="datainput">

                        <select class="datainput__input" id="dbvalue" name="customerName_type">
                            <option value="varchar">VARCHAR</option>
                            <option value="int">INT</option>
                            <option value="datetime">DATETIME</option>
                            <option value="date">DATE</option>
                            <option value="tinyint">TINYINT</option>
                            <option value="smallint">SMALLINT</option>
                            <option value="bigint">BIGINT</option>
                            <option value="float">FLOAT</option>
                            <option value="decimal">DECIMAL</option>
                            <option value="double">DOUBLE</option>
                        </select>
                    </div>

                    <div class="datainput">

                        <select class="datainput__input" id="dbvalue" name="customerEmail_type">
                            <option value="varchar">VARCHAR</option>
                            <option  value="int">INT</option>

                            <option value="datetime">DATETIME</option>
                            <option value="date">DATE</option>
                            <option value="tinyint">TINYINT</option>
                            <option value="smallint">SMALLINT</option>
                            <option value="bigint">BIGINT</option>
                            <option value="float">FLOAT</option>
                            <option value="decimal">DECIMAL</option>
                            <option value="double">DOUBLE</option>
                        </select>
                    </div>

                    <div class="datainput">

                        <select class="datainput__input" id="dbvalue" name="itemName_type">
                            <option value="varchar">VARCHAR</option>
                            <option value="int">INT</option>

                            <option value="datetime">DATETIME</option>
                            <option value="date">DATE</option>
                            <option value="tinyint">TINYINT</option>
                            <option value="smallint">SMALLINT</option>
                            <option value="bigint">BIGINT</option>
                            <option value="float">FLOAT</option>
                            <option value="decimal">DECIMAL</option>
                            <option value="double">DOUBLE</option>
                        </select>
                    </div>

                    <div class="datainput">

                        <select class="datainput__input" id="dbvalue" name="unitPrice_type">
                            <option value="int">INT</option>
                            <option value="varchar">VARCHAR</option>
                            <option value="datetime">DATETIME</option>
                            <option value="date">DATE</option>
                            <option value="tinyint">TINYINT</option>
                            <option value="smallint">SMALLINT</option>
                            <option value="bigint">BIGINT</option>
                            <option value="float">FLOAT</option>
                            <option value="decimal">DECIMAL</option>
                            <option value="double">DOUBLE</option>
                        </select>
                    </div>

                    <div class="datainput">

                        <select class="datainput__input" id="dbvalue" name="quantity_type">
                            <option value="int">INT</option>
                            <option value="varchar">VARCHAR</option>
                            <option value="datetime">DATETIME</option>
                            <option value="date">DATE</option>
                            <option value="tinyint">TINYINT</option>
                            <option value="smallint">SMALLINT</option>
                            <option value="bigint">BIGINT</option>
                            <option value="float">FLOAT</option>
                            <option value="decimal">DECIMAL</option>
                            <option value="double">DOUBLE</option>
                        </select>
                    </div>

                     <div class="datainput">

                        <select class="datainput__input" id="dbvalue" name="totalAmount_type">
                            <option value="int">INT</option>
                            <option value="varchar">VARCHAR</option>
                            <option value="datetime">DATETIME</option>
                            <option value="date">DATE</option>
                            <option value="tinyint">TINYINT</option>
                            <option value="smallint">SMALLINT</option>
                            <option value="bigint">BIGINT</option>
                            <option value="float">FLOAT</option>
                            <option value="decimal">DECIMAL</option>
                            <option value="double">DOUBLE</option>
                        </select>
                    </div>


                </div>

            </div>
            <div class="popup__button">
                <div class="c-card__button h-mar">
                    <a class="c-card__submit" onclick="fetchData('popupid4')" href="#popupid4">
                        Confirm
                    </a>
                </div>
                <div class="c-card__button h-mar">
                    <a class="c-card__submit c-card__submit--blue">
                        reset
                    </a>
                </div>
            </div>
        </div>
    </div>



    <%-- popup Table --%>


    <script>
        var cardLabel = document.getElementById("cardLabel");
        //cardLabel.firstChild

        function addFocusClass(element) {
            console.log(element)
            element.previousElementSibling.classList.add("datainput__label--focus");

            //  element.classList.add("datainput__label--focus");
        }

        function removeFocusClass(element) {
            if (element.value == "")
                element.previousElementSibling.classList.remove("datainput__label--focus");
        }

        function hideWarningClass(element) {
            if (element.value != "")
                element.nextElementSibling.classList.add("h-hide");
        }

    </script>
</body>

</html>