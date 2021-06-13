<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/styles/operations.css" />
 
    
     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>
    <script src="https://kit.fontawesome.com/9a3152f70a.js" crossorigin="anonymous"></script>
    <title>Document</title>

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
                    <li class="sidebar__list-elem"></li>
                </ul>
            </div>
        </aside>

        <div class="main">
            <div class="card--heading">
                <!-- <h2 class="card__heading">DASHBOARD</h2> -->
            </div>
             <!-- card 3 -->
  
             <div class="card">
                
               <div class="row over" style="width:100%;">
               <div class="col">
                    <div class="row one1">
                         <div class="col one"><h5>Total Tasks</h5></div>
                           <div class="col one"><h5 id="tasksa"><%= request.getAttribute("totaltask")%></h5></div>
                           </div>
                     <div class="row two2">
                         <div class="col two"><h5>Tasks Completed</h5></div>
                           <div class="col two"><h5 id="tasksc"><%= request.getAttribute("completed")%></h5></div>
                    </div>
                     <div class="row three3">
                         <div class="col three"><h5>Tasks Pending</h5></div>
                           <div class="col three"><h5 id="tasksp"><%= request.getAttribute("pending")%></h5></div>
                    </div>
                    <br>
                    <% int isadmin=1;%>
                    <%if(isadmin==1){%>
                    <div class="row">
                     <div class="col">
                     <div class="card__button">
                    <a class="card__submit" href="#popupid3">
                        Assign task
                    </a>
                </div>
                </div>
                <div class="col">
                 <div class="card__button">
                    <a class="card__submit" href="#popupid4">
                        Add Sales rep
                    </a>
                </div>
                </div>
                </div>
                <% }%>
               </div>
              
               </div>
           
            </div>
            <div class="card">
                <h4>Tasks Log</h4>
                <div class="container" id="tasks-container">
                   <div id="task-completed">
                      <div class="summa1">
                      <h5 style="text-align:center;font-weight:bold;">Tasks Completed</h5></div>
                      <%String st=(String)request.getAttribute("tasks");
                      String[] str1=st.split(",");
                      if(str1.length!=0)
                      {
                      for(String i:str1){
                      %>
                      <%="<p class='task1' style='text-align:center;'>"+i+"</p>" %>
                        <%}} %>
                   </div>
                   <div id="task-pending">
                   <div class="summa2">
                   <h5 style="text-align:center;font-weight:bold;">Tasks Pending</h5></div>
                   <%String stu=(String)request.getAttribute("taskpending");
                      String[] str2=stu.split(",");
                      if(str2.length!=0)
                      {
                      for(String i:str2){
                      %>
                      <%="<p class='task1'style='text-align:center;'>"+i+"</p>" %>
                        <%}} %>
                   </div>
                </div>
            </div>
            <!-- card 1 -->
            <div class="card">
                <h4>Todo list</h4>
                <div class="container" id="todo-container">
                   <ul class="todos" id="todoid">
                   <%String s=(String)request.getAttribute("todos");
                     String[] str=s.split(",");
                     if(str.length!=0)
                     {
                     for(String i:str){
                   %>
                   <%="<li><input type='checkbox' class='todo1'><label for='todo1'><span class='check'>"+i+"</span></label><i class='far fa-trash-alt delete' onclick='deletetodo(this)'></i> </li>"%>
                   <%}} %>
                   </ul>
                </div>
                <div class="card__button">
                    <a class="card__submit" href="#popupid2">
                       Add Todo
                    </a>
                </div>
            </div>
  

            <!-- card 2 -->
            <div class="card"> 
                   <div class="row">
                       <div class="col-sm-6">
                           <h5>Category</h5>
                       </div>
                       <div class="col-sm-6"> <div class="dropdown">
                              <select id="category">
                            <option value="Bronze" selected>Bronze</option>
                            <option value="silver">Silver</option>
                             <option value="gold">Gold</option>
                             <option value="platinum">Platinum</option>
                               </select>
                      </div>
                    </div>
                    </div>
                <div class="card__button">
                    <a class="card__submit" href="#popupid1">
                        Send mail
                    </a>
                </div>
                


           </div>
        </div>
    </div>

  
      <div id="popupid1" class="popup__container">
        <div class="popup">
            <h2 class="popup__heading">Enter email details</h2>
            <a class="popup__close" href="#">&times;</a>
            <div class="popup__row">
                 <form id="mail"  method="post">
                <div class="popup__column">   
                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">Subject</label>
                        <input type="text"  id="message1" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" name="subject" placeholder="Subject" />
                    </div>
                    
                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">Content</label>
                        <textarea rows='1'  id="message" class="datainput__input form-control" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" name="content" placeholder="Content"></textarea>
                    </div>
                     <p id="infomsg" style="color:red;margin-left:20px;"></p>          
                </div>
                  <div class="popup__button">
                <div class="card__button h-mar">
                  <input id="button1" class="btn btn-primary" type="submit" value="submit" onclick="sendmail1()"/>
                </div>
            </div>
                </form>
            </div>
          
        </div>
    </div>
    
      <div id="popupid2" class="popup__container">
        <div class="popup">
            <h2 class="popup__heading">Add todo</h2>
            <a class="popup__close" href="#">&times;</a>

            <div class="popup__row">
                 <form  method="post">
                <div class="popup__column">
                   
                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">Todo-name</label>
                        <input type="text" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" id="todoname" name="name" placeholder="Todo" />
                    </div>
                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">Todo-description</label>
                        <textarea rows='1' class="datainput__input form-control" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)"  id="todocontent" name="description" placeholder="Todo-Description"></textarea>
                    </div>
                <p id="infomsg2" style="color:red;margin-left:20px;"></p>    
                </div>
                  <div class="popup__button">
                <div class="card__button h-mar">
                  <input id="button3" class="btn btn-primary" type="submit" value="submit" onclick="sendtodo()"/>
                </div>
            </div>
                </form>
            </div>
          
        </div>
    </div>
     
      <div id="popupid4" class="popup__container">
        <div class="popup">
            <h2 class="popup__heading">Add Sales Rep</h2>
            <a class="popup__close" href="#">&times;</a>

            <div class="popup__row">
                 <form  method="post">
                <div class="popup__column">
                   
                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">SalesRep-name</label>
                        <input type="text" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" id="salesrepname" name="name" placeholder="SalesRep" />
                    </div>
                <p id="infomsg4" style="color:red;margin-left:20px;"></p>    
                </div>
                  <div class="popup__button">
                <div class="card__button h-mar">
                  <input id="button4" class="btn btn-primary" type="submit" value="Generate mail" onclick="m2()"/>
                </div>
            </div>
                </form>
            </div>
          
        </div>
    </div>
      <div id="popupid3" class="popup__container">
        <div class="popup">
            <h2 class="popup__heading">Add tasks</h2>
            <a class="popup__close" href="#">&times;</a>

            <div class="popup__row">
                 <form id="tasks" method="post">
                <div class="popup__column">
                   
                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">Task name</label>
                        <input type="text" id="tname" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" name="taskname" placeholder="Task name" />
                    </div>
                    <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">Task content</label>
                       <input type="text" id="tcontent" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" name="taskcontent" placeholder="Task content" />
                    </div>
                      <div class="datainput">
                        <label class="datainput__label" id="cardLabel" tabindex="1">Assign task</label>
                        <input type="text" id="tassigned" class="datainput__input" onfocus="addFocusClass(this)"
                            onblur="removeFocusClass(this)" name="assignto" placeholder="Assign to" />
                    </div>
                    <p id="infomsg1" style="color:red;margin-left:20px;"></p>                   
                </div>
                  <div class="popup__button">
                <div class="card__button h-mar">
                  <input id="button2" class="btn btn-primary" type="submit" value="submit" onclick="assigntask()"/>
                </div>
            </div>
                </form>
            </div>
          
        </div>
    </div>

    <script>
    document.getElementById("button1").addEventListener("click", function(event){
    	  event.preventDefault()
    	});
    document.getElementById("button2").addEventListener("click", function(event){
  	  event.preventDefault()
  	});
    document.getElementById("button3").addEventListener("click", function(event){
    	  event.preventDefault()
    	});
    
    document.getElementById("button4").addEventListener("click", function(event){
  	  event.preventDefault()
  	});
        //var cardLabel = document.getElementById("cardLabel");
        //cardLabel.firstChild
        function assigntask()
        {
        	var name=document.getElementById("tname").value;
        	var content=document.getElementById("tcontent").value;
        	var assign=document.getElementById("tassigned").value;
        	if(name=="" || content=="" || assign=="")
        		{
        		
        		document.getElementById("infomsg1").innerHTML="Task fields should not be empty";	
        		}
        	else
        		{
        		 const host = window.location.hostname;
                 const proto = window.location.protocol;
                 console.log(host, proto);
                 window.location.replace(proto + "/CRM/Operations#");
  		          task({name,content,assign});
        		}

        }
        function deletetodo(ele)
        {
        	var obj=ele.previousSibling.firstChild.innerText;
        	console.log(obj);
        	ele.parentElement.id='delta';
        	document.getElementById('delta').remove();	
        	deltodo({obj});
        }
      
        function sendtodo()
        {
        	var name=document.getElementById("todoname").value;
        	var content=document.getElementById("todocontent").value;
        	if(name=="" || content=="")
        		{
        		document.getElementById("infomsg2").innerHTML="Todo fields should not be empty";
        		}
        	else
        		{
        		 const host = window.location.hostname;
                 const proto = window.location.protocol;
                 console.log(host, proto);
                 window.location.replace(proto + "/CRM/Operations#");
  		          todo({name,content});
        		}
        }
      
        function sendmail1()
        {
        	//
           var ele=document.getElementById("category");
           var e=ele.value;
           var msg=document.getElementById("message").value;
           var msg1=document.getElementById("message1").value;
        	if(e==='Bronze')
        		{
        		   if(msg==="")
            	   {
        			   document.getElementById("infomsg").innerHTML="Mail should not be empty";
            	   }
        		   else
        			   {
        			   const host = window.location.hostname;
                       const proto = window.location.protocol;
                       console.log(host, proto);
                       window.location.replace(proto + "/CRM/Operations#");
        		          mail({msg,msg1,e});
        			   }
        		}
        	else
        		{
        		alert("Choose the Bronze cluster");
        		}  	
        }
        function m2()
        {
        	      System.out.println("func called");
        	      var msg=document.getElementById("salesrepname").value;
        	      System.out.println(msg);
        	      
        	      console.log(msg);
        		   if(msg==="")
            	   {
        			   alert("hello");
        			   document.getElementById("infomsg4").innerHTML="E-mail should not be empty";
            	   }
        		   else
        			   {
        			   alert("hello");
        			   //const host = window.location.hostname;
                       //const proto = window.location.protocol;
                       //console.log(host, proto);
                       //window.location.replace(proto + "/operations/Operations#");
        		          //mail1({msg});
        			   }
        }
        	
        function deltodo(obj)
        {
        	 const url = "/CRM/deletetodo";
     	    fetch(url, {

     	        // Adding method type 
     	        method: "POST",

     	        // Adding body or contents to send 
     	        body: JSON.stringify(obj),

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
     	        }
     	        );
        }
        
        function mail(obj)
        {
        	 const url = "/CRM/sendmail";
        	    fetch(url, {

        	        // Adding method type 
        	        method: "POST",

        	        // Adding body or contents to send 
        	        body: JSON.stringify(obj),

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
        	            alert("Mail sent successfylly");
        	        }
        	        );
        }
        function todo(obj)
        {
        	const url = "/CRM/sendtodo";
     	    fetch(url, {

     	        // Adding method type 
     	        method: "POST",

     	        // Adding body or contents to send 
     	        body: JSON.stringify(obj),

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
     	            console.log(json.name);
     	            var uli=document.getElementById("todoid");
     	            var liu=document.createElement("li");
     	            liu.innerHTML="<input type='checkbox' class='todo1'><label for='todo1'><span class='check'>"+json.name+"</span></label><i class='far fa-trash-alt delete' onclick='deletetodo(this)'></i>";
     	            uli.appendChild(liu);
     	          // 
     	        }
     	        );
        }
        function task(obj)
        {
        	 const url = "/CRM/TaskController";
     	    fetch(url, {

     	        // Adding method type 
     	        method: "POST",

     	        // Adding body or contents to send 
     	        body: JSON.stringify(obj),

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
     	            //console.log(json.hello);
     	            console.log(document.getElementById("tasksa").innerHTML);
     	            var assig= document.getElementById("tasksa").innerHTML;
     	            document.getElementById("tasksa").innerHTML=parseInt(assig)+1;
     	            var pend= document.getElementById("tasksp").innerHTML;
     	           document.getElementById("tasksp").innerHTML=parseInt(pend)+1;
     	           var t=document.getElementById("task-pending");
     	           var liu=document.createElement("p");
     	           liu.style.textAlign="center";
     	           var node = document.createTextNode(json.name);
     	           liu.appendChild(node);
     	           t.appendChild(liu);
     	        }
     	        );
        }
     

      
        function addFocusClass(element) {
            console.log(element)
            element.previousElementSibling.classList.add("datainput__label--focus");
        }

        function removeFocusClass(element) {
            element.previousElementSibling.classList.remove("datainput__label--focus");
        }

    </script>
</body>

</html>