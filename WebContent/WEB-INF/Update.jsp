<%@page import="leadController.SelectLead"%>
<%@page import="leadModel.LeadsData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
        <link rel="stylesheet" href="./css/leadStyleSheet.css">
        <style>
            .edit-leads-popup{
                position: fixed;
                top: 0;
                bottom: 0;
                left: 0;
                right: 0;
                background: rgba(0, 0, 0, 0.7);
                -webkit-transition: opacity 500ms;
                transition: opacity 500ms;
                /*visibility: hidden;
                opacity: 0;*/
            }/*
            .leads-popup:target {
              visibility: visible;
              opacity: 1;
            }*/
        </style>
        <link rel="stylesheet" href="./css/leadStyleSheet.css">
    </head>
    <body>
        <%
            LeadsData o = (LeadsData)request.getSession().getAttribute("leadsData");
            System.out.println(o.getLead_id());
            request.getSession().setAttribute("id", o.getLead_id());
        %>
        <div id="edit-leads-popup" class="edit-leads-popup">
            <div class="leads-popup-container">
                <h2 class="leads-popup-container-heading">Update Leads</h2>
                <a class="leads-popup-container-close" href="Lead">&times;</a>
                <% 
                    if(o.getLead_id() != null || o.getName() != null){
                %>
                <form method="GET" action="Update?id=<%= o.getLead_id() %>" class="leads-popup-form">
                    <div class="leads-popup-container-row">
                        <div class="leads-popup-container-column">
                            <div class="leads-popup-container-datainput">
                                <label class="leads-popup-container-datainput__label" >Name</label>
                                <input type="text" class="leads-popup-container-datainput__input" onfocus="addFocusClass(this)"
                                       onblur="removeFocusClass(this)" name="editName" value="<%=o.getName()%>" />
                            </div>
                            <div class="leads-popup-container-datainput">
                                <label class="leads-popup-container-datainput__label" >Phone No</label>
                                <input type="text" class="leads-popup-container-datainput__input" onfocus="addFocusClass(this)"
                                       onblur="removeFocusClass(this)" name="editPhone" value="<%=o.getPhone()%>" />
                            </div>
                            <div class="leads-popup-container-datainput">
                                <label class="leads-popup-container-datainput__label" >Email</label>
                                <input type="text" class="leads-popup-container-datainput__input" onfocus="addFocusClass(this)"
                                       onblur="removeFocusClass(this)" name="editEmail" value="<%=o.getEmail()%>" />
                            </div>      
                            <div class="leads-popup-container-datainput">
                                <label class="leads-popup-container-datainput__label" >Source</label>
                                <input type="text" class="leads-popup-container-datainput__input" onfocus="addFocusClass(this)"
                                       onblur="removeFocusClass(this)" name="editSource" value="<%=o.getSource()%>" />
                            </div>
                        </div>
                    </div>
                    <div class="lead-popup__button">
                        <div class="lead-card__button h-mar">
                            <!--<a class="lead-card__submit">
                                Add Lead
                           </a>-->
                            <input type="submit" value="Update" class="lead-card__submit" style="cursor: pointer;">
                        </div>
                    </div>
                </form>
                <% }else{ 
                    out.println("<h3>No Leads Found</h3>");
                }%>
            </div>
        </div>
        <script>
            function addFocusClass(element) {
                element.previousElementSibling.classList.add("leads-popup-container-datainput__label--focus");
            }

            function removeFocusClass(element) {
                element.previousElementSibling.classList.remove("leads-popup-container-datainput__label--focus");
            }
        </script>
    </body>
</html>
