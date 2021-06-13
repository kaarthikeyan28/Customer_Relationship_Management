<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="leadModel.SalesPersonDetails"%>
<%@page import="leadController.SalesPerson"%>
<%@page import="leadModel.LeadsData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="leadController.AllLeadData"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leads</title>
        <link rel="stylesheet" href="./css/jeganprakashStyleSheet.css">
        <link rel="stylesheet" href="./css/leadStyleSheet.css">
        <script src="https://kit.fontawesome.com/9a3152f70a.js" crossorigin="anonymous"></script>
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

                       <li class="sidebar__list-elem "><a href="/CRM/integrate">Integrate</a><i class="fas fa-database"></i>
                    </li>
                    <li class="sidebar__list-elem">Analytical<i class="fas fa-chart-line"></i></li>
                    <li class="sidebar__list-elem"><a href="/CRM/RFM">RFM</a><i class="fas fa-calculator"></i></li>
                    <li class="sidebar__list-elem"><a href="/CRM/segment">Segmentation</a><i class="fas fa-chart-pie"></i></li>
                    <li class="sidebar__list-elem sidebar__list-elem--active"><a href="/CRM/Operations" >Operational</a><i class="fas fa-cogs"></i></li>
                    <li class="sidebar__list-elem"><a href="/CRM/Leads">Leads</a><i class="far fa-id-card"></i></li>
                    </ul>
                </div>
            </aside>
            <div class="lead-main">
                <div class="lead-card--heading" style="position: relative;">
                    <h2 class="lead-card__heading">LEADS</h2>
                    <a href="#leads-popup" class="lead-addButton-button" style="position: absolute;top:5%;right:5%;">
                        <button>Add Leads</button>
                    </a>
                </div>

                <%
                    ArrayList<LeadsData> obj = AllLeadData.getData();
                    ArrayList<SalesPersonDetails> salesObj = SalesPerson.getAllDetails();
                    if (obj.isEmpty()) {%>
                <%= "<div  class=\"lead-card\" style=\"position: relative;\">"%>
                <%= "<h3>No Leads</h3>"%>
                <%= "</div>"%>
                <% } else {
                    for (LeadsData o : obj) {%>
                <div class="lead-card" style="position: relative;padding:5%;">
                    <div class="">
                        <table>
                            <tr>
                                <td class="lead-td-title">Name</td>
                                <td ><%= o.getName()%></td>
                            </tr>
                            <tr>
                                <td class="lead-td-title">Phone</td>
                                <td><%= o.getPhone()%></td>
                            </tr>
                            <tr>
                                <td class="lead-td-title">Email</td>
                                <td><%= o.getEmail()%></td>
                            </tr>
                            <tr>
                                <td class="lead-td-title">Source</td>
                                <td><%= o.getSource()%></td>
                            </tr>
                        </table><br>
                    </div>
                    <div class="lead-edit_delete-button" style="position: absolute;bottom: 5%;right:5%">
                        <% if (!o.isIs_assigned()) {%><!-- if(is_admin && !o.isIs_assigned()) -->
                        <a href="#leads-assigned-popup" class="">
                            <button onclick="pass(this)" value="<%= o.getLead_id()%>">Assigned To</button>
                        </a>
                        <% }%>
                        <a href="EditLead?id=<%=o.getLead_id()%>" class="">
                            <button>Edit</button>
                        </a>
                        <a href="DeleteLead?id=<%=o.getLead_id()%>" class="">
                            <button>Delete</button>
                        </a>
                    </div>
                    <% if (o.isIs_assigned()) {%><!-- if(is_admin && o.isIs_assigned()) -->
                    <h4 style="position: absolute;top:5%;right:5%;">Assigned for <%= SalesPerson.getAssignName(o.getAssigned())%></h4>
                    <% } %>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
        <div id="leads-assigned-popup" class="leads-popup">
            <div class ="leads-popup-container">
                <h2 class="leads-popup-container-heading">Assigned To</h2>
                <a class="leads-popup-container-close" href="#">&times;</a>

                <div class="leads-popup-container-row">
                    <form method="POST" action="UpdateAssign" class="leads-popup-form">
                        <div class="leads-popup-container-column">
                            <div class="leads-popup-container-datainput">
                                <input type="hidden" id="lead_id_to_assign" name="lead_id_to_assign"/>
                                <select class="leads-popup-container-datainput__input" name="lead_assign_value">
                                    <% for(SalesPersonDetails o : salesObj){ %>
                                    <option value=<%= o.getSalespersonpk() %>><%= o.getUsername() %></option>
                                        <% } %>
                                </select>
                            </div>
                        </div>
                        <div class="lead-popup__button">
                            <div class="lead-card__button h-mar">
                                <!--<a class="lead-card__submit">
                                    Add Lead
                               </a>-->
                                <input type="submit" value="Assign" class="lead-card__submit" style="cursor: pointer;">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div id="leads-popup" class="leads-popup">
            <div class="leads-popup-container">
                <h2 class="leads-popup-container-heading">Add Leads</h2>
                <a class="leads-popup-container-close" href="#">&times;</a>
                <form method="POST" action="AddLeads" onsubmit="return validate(this)" class="leads-popup-form">
                    <div class="leads-popup-container-row">
                        <div class="leads-popup-container-column">
                            <div class="leads-popup-container-datainput">
                                <label class="leads-popup-container-datainput__label" >Name</label>
                                <input type="text" class="leads-popup-container-datainput__input name" onfocus="addFocusClass(this)"
                                       onblur="removeFocusClass(this)" name="name" placeholder="John" />
                            </div>
                            <div class="leads-popup-container-datainput">
                                <label class="leads-popup-container-datainput__label" >Phone No</label>
                                <input type="text" class="leads-popup-container-datainput__input phone" onfocus="addFocusClass(this)"
                                       onblur="removeFocusClass(this)" name="phone" placeholder="9876543214" />
                            </div>
                            <div class="leads-popup-container-datainput">
                                <label class="leads-popup-container-datainput__label" >Email</label>
                                <input type="text" class="leads-popup-container-datainput__input email" onfocus="addFocusClass(this)"
                                       onblur="removeFocusClass(this)" name="email" placeholder="xyz@gmail.com" />
                            </div>      
                            <div class="leads-popup-container-datainput">
                                <label class="leads-popup-container-datainput__label" >Source</label>
                                <input type="text" class="leads-popup-container-datainput__input source" onfocus="addFocusClass(this)"
                                       onblur="removeFocusClass(this)" name="source" placeholder="source" />
                            </div>
                        </div>
                    </div>
                    <div class="lead-popup__button">
                        <div class="lead-card__button h-mar">
                            <!--<a class="lead-card__submit">
                                Add Lead
                           </a>-->
                            <input type="submit" id="leads-add_submit" onclick="validate(this)" value="Add" class="lead-card__submit" style="cursor: pointer;">
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script>
               let Lead_id;
               let add_submit = document.getElementById("leads-add_submit");
               add_submit.addEventListener("click", function(event){
            	   event.preventDefault();
            	 });
            function addFocusClass(element) {
                element.previousElementSibling.classList.add("leads-popup-container-datainput__label--focus");
            }

            function removeFocusClass(element) {
                element.previousElementSibling.classList.remove("leads-popup-container-datainput__label--focus");
            }
            
            function pass(element){
                Lead_id = element.value;
                document.getElementById("lead_id_to_assign").value=Lead_id;
            }
            
            
            function assign(e) {
                let assign = prompt("Enter Sales Representive Name");
                console.log("out " + assign);
                let xmlObj = new XMLHttpRequest();
                if (assign !== null) {
                    console.log("in " + assign);
                    xmlObj.onreadystatechange = function name() {
                        console.log(assign);
                    };
                }
                /*else{
                 alert("Not Assigned");
                 //e.preventDefault();
                 }*/
            }
            let form = document.querySelector('form');
            var name = /^[a-z A-Z]+$/;
            var source = /^[a-z A-Z]+$/;
            var phone = /^[0-9]{,10}$/;
            var email = /^[\w\d.]+\@[a-zA-Z\.]+\.[A-Z a-z]{6,30}$/;
            var form_name = document.querySelector('.name');
            var form_phone = document.querySelector('.phone');
            var form_email = document.querySelector('.email');
            var form_source = document.querySelector('.source');
            function validate(e) {
                //event.preventDefault();
                //alert("Enter");
                console.log("validate called"+form_name);
                if ( form_name.value === "") {
                    form_name.style.borderColor = 'red';
                    alert('False');
                    return false;
                }
                if ( form_phone.value === "") {

                    alert('False');
                    return false;
                }
                if ( form_email.value === "") {

                    alert('False');
                    return false;
                }
                if (!source.test(form_source.value) || form_source.value === "") {
                    alert('False');
                    return false;
                }
            }
        </script>

    </body>
</html>
