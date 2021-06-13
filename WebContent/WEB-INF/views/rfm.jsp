<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/9a3152f70a.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/rfm.css" />
    <script src="${pageContext.request.contextPath}/resources/js/rfm.js"></script>

   


    <link href="https://unpkg.com/tabulator-tables//dist/css/materialize/tabulator_materialize.min.css"
        rel="stylesheet">
    <script type="text/javascript" src="https://unpkg.com/tabulator-tables/dist/js/tabulator.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js" integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw==" crossorigin="anonymous"></script>

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
                <!-- <div class="card__logo" data-name="integrateDB">

                </div>
                <div class="c-card__button">
                    <a class="c-card__submit" href="#popupid">
                        Integrate DB
                    </a>
                </div> -->
                <h2 class="c-card__heading">RFM ANALYSIS</h2>
                <div class="c-card__rfm">
                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">START DATE</label>
                        <input type="text" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" onchange="hideWarningClass(this)" name="startDate"
                            placeholder="startDate" />

                    </div>

                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">END DATE</label>
                        <input type="text" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" onchange="hideWarningClass(this)" name="endDate"
                            placeholder="EndDate" />
                    </div>

                </div>
                <div class="c-card__button">
                    <a class="c-card__submit" href="#">
                        RUN ANALYZE
                    </a>
                </div>

            </div>

            <!-- card 2 -->
            <div class="c-card">
               <h2 class="c-card__heading">VISUALIZE</h2>
                <div class="c-card__rfm">
                    <a class="c-card__submit c-card__submit--button-style" onclick="drawGraph('r')" href="#popupid_chart">
                        Recency Graph
                    </a>
                     <a class="c-card__submit c-card__submit--button-style" onclick="drawGraph('f')" href="#popupid_chart">
                        Frequency Graph
                    </a>
                     <a class="c-card__submit c-card__submit--button-style" onclick="drawGraph('m')" href="#popupid_chart">
                        Monetary Graph
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

    <div id="popupid_chart" class="popup__container">
        <div class="popup">
            <h2 class="popup__heading" id="chart_heading">chart</h2>
            <a class="popup__close" href="#">&times;</a>
            <div class="popup__content">
            </div>
            <div class="popup__row" >
           <canvas id="myChart" width="700" height="700"></canvas>

            </div>
            <%-- <div class="c-card__button h-mar">
                <a class="c-card__submit" id="popupid2-submit" href="#popupid4">
                    OK
                </a>
            </div> --%>

        </div>
    </div>




    <script>
        var cardLabel = document.getElementById("cardLabel");
        //cardLabel.firstChild

        function addFocusClass(element) {
            element.type = 'date';

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