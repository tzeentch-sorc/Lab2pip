<%@ page import="java.util.ArrayList" %>
<%@ page import="com.sol.ru.ResRow" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCKTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="description" content="pip_lab1">
  <meta name="author" content="Soldatov Igor">
  <title>Лаба2</title>

  <style>
    .head{
      font-family: fantasy;
      font-size: 25px;
      color: #ffc62a;
      text-align: center;
      text-shadow: 1px 1px 2px black, 0 0 1em #f6bd4a;
      background: linear-gradient(#9a0000, #f6bd4a 150%) #f6bd4a;
      height: 30px;
      padding: 10px;
    }

    .block{
      border-radius: 10px;
      border: 2px solid #f6bd4a;
      padding: 10px;
      margin: 0 auto;
      width: 1000px;
      text-align: center;
    }

    a{
      color: #ffc62a;
      text-decoration: none;
    }
    a:hover{
      color: #f6bd4a;
      text-decoration: underline;
    }
    a:visited{
      color: #ffc62a;
    }
    table{
      border: 2px solid #ffc62a;
      box-shadow: 0 0 6px 2px #9a0000;
      vertical-align: center;
      text-align: center;
      text-align-all: center;
      align-content: center;
      background: #f6bd4a;
      font-size: 20px;
      margin: 20px auto;
    }

    td{
      padding: 3px 6px;
      width: 150px;
      box-shadow: 0 0 3px 1px black inset;
    }

    body{
      background: url("img/bg.jpg") fixed no-repeat center #9a0000;
    }

    .main{
      background-color: rgba(255, 255, 255, 0.65);
      margin: 10px auto;
      height: 630px;
      box-shadow:
              0 0 6px 4px #f6bd4a;
    }
    .history{
      background-color: rgba(255, 255, 255, 0.65);
      margin: 10px auto;
      box-shadow:
              0 0 6px 4px #f6bd4a;
    }

    #var{
      float: right;
      margin-right: 30px;
    }

    #group{
      float: left;
      margin-left: 30px;
    }

    .title{
      font-family: century gothic;
      font-size: 25px;
      color: #ffc62a;
      text-align: center;
      text-shadow: 2px 2px 3px black;
    }

    select{
      width: 130px;
      height: 30px;
      font-size: 20px;
      padding-left: 50px;
      margin-bottom: 30px;
      border-radius: 5px
    }

    #yCoord{
      width: 130px;
      height: 30px;
      font-size: 20px;
      text-align: center !important;
      margin-bottom: 30px;
    }

    #radiusValue{
      width: 130px;
      height: 30px;
      font-size: 20px;
      text-align: center !important;
      margin-bottom: 30px;
    }


    .form{
      float: left;
      margin-top: 0;
    }

    .form>p{
      font-family: Times New Roman;
      font-size: 20px;
      color: #ffc62a;
      text-shadow: 2px 2px 3px black;
      font-weight: 800;
      margin-top: 0;
      margin-bottom: 5px;
      width: 250px;
    }

    #send{
      font-family: Times New Roman;
      font-size: 24px;
      color: #ffc62a;
      text-shadow: 2px 2px 2px black;
      background: linear-gradient(#9a0000, #f6bd4a 150%) #f6bd4a;
      font-weight: 200;
      position: relative;
      display: inline-block;
      border: #282c34 10px;
      border-radius: 5px;
      margin-top: 15px;
      width: 130px;
      height: 30px;
      outline: none;
    }

    #send:hover {
      background: linear-gradient(#9a0000, #f6bd4a 120%);
    }

    #send:active {
      padding-top: 3px;
      background: linear-gradient(#9a0000, #f6bd4a 90%);
      box-shadow:
              0 0 2px 2px #f6bd4a,
              0 0 6px 3px #9a0000,
              0 0 4px 2px black,
              0 0 2px rgba(0, 0, 0, 1) inset,
              0 2px 3px rgba(0, 0, 0, 0.8) inset,
              0 1px 1px rgba(255, 255, 255, .1);

    }

    .shadow{
      box-shadow: 0 0 2px 2px #f6bd4a,
      0 0 6px 3px #9a0000,
      0 0 4px 2px black;
    }

    #canvas{
      border: 2px solid #ffc62a;
      border-radius: 5px;
      float: left;
      margin: 60px;
      margin-top: 0;
      margin-right: 80px;
      box-shadow: 0 0 6px 2px #9a0000,
      0 0 3px 1px black inset;
    }

    #answer{
      background-color: rgba(255, 255, 255, 0.65);
      display: none;
      margin: 10px auto;
    }
    #errY{
      visibility: hidden;
      color: #9a0000;
      margin-top: 125px;
    }
    #errR{
      visibility: hidden;
      color: #9a0000;
      margin-top: 30px;
    }
    #easterEgg{
      width: 383px;
      height: 363px;
      position: absolute;
      background: url("img/crusader.png") no-repeat;
      visibility: hidden;
      top: 800px;
      left: 0;
    }
    #main{
      position: relative;
    }
  </style>
</head>


<body id="body">
<div class="block head shadow">
  <a href="https://isu.ifmo.ru/pls/apex/f?p=2143:GR:103237292305101::NO:RP:GR_GR,GR_DATE:P3111," id="group" title="Ссылка на группу" target="_blank">Группа: P3211</a>
  <a href="https://isu.ifmo.ru/person/243885" id="name" title="Ссылка на автора" target="_blank">Студент: Солдатов Игорь</a>
  <span id="var">Вариант: 21123</span>
</div>


<div class="block main shadow" id="main">
  <p class="title"><b>Выберите координаты точки и размер области</b></p>
  <div id="easterEgg"></div>
  <div>
    <canvas id="canvas" height="500" width="500" onclick="interactiveCanvas()">
    </canvas>
  </div>


  <form name="form" id="form" class="form" action="result" target="_self" method="post">
    <p>Координата Х:</p>
    <select class="shadow" name="xCoord" id="xCoord" title="Выбор координаты Х" onchange="setX()">
      <option value="-2">-2</option>
      <option value="-1.5">-1.5</option>
      <option value="-1">-1</option>
      <option value="-0.5">-0.5</option>
      <option value="0" selected>0</option>
      <option value="0.5">0.5</option>
      <option value="1">1</option>
      <option value="1.5">1.5</option>ц
      <option value="2">2</option>
    </select>
    <input class="text" readonly id="xCoordClick" name="xCoordClick" style="visibility: hidden; display: none" value="0">
    <p>Координата Y:</p>
    <input class="shadow" type="text" name="yCoord" id="yCoord" placeholder="(-3..5)" maxlength="9" autocomplete="off" onkeydown="resetValidationY()">
    <br>
    <p>Размер R:</p>
    <input class="shadow" type="text" name="radiusValue" id="radiusValue" placeholder="(2..5)" value="4" onkeydown="resetValidationR()" maxlength="6"

           autocomplete="off"
    <%
           out.print("oninput=\"draw('canvas', 4);validateRadius(form.radiusValue.value);");
           Object obj2 = request.getSession().getAttribute("resultHistory");
           if (!(obj2 == null)) {
            ArrayList<ResRow> results = ((ArrayList<ResRow> ) obj2);
            if (results.size() != 0){
              for (int i = 0; i < results.size(); ++i) {
                ResRow res = results.get(i);
                if (!res.getResult().equals("INVALID ARGUMENTS")) {
                    out.print("drawDot(\'canvas\'," + res.getX() + "," + res.getY() + ",form.radiusValue.value);");
                }
              }
            }
           }
           out.print("\"");
    %>

           >
    <br>
    <input class="shadow" type="button" onclick="formSubmit()" name="send" id="send" value="Проверка">
  </form>

    <script type="text/javascript">
        window.onload = draw('canvas', 'radius');

        function formSubmit(){
            var video = document.getElementById('nevermore');
            video.style.visibility="hidden";
            var form, error, msg;
            form = document.getElementById('form');
            var yCoord = form.yCoord.value;
            var rCoord = form.radiusValue.value;
            error = false;
            msg = "Неверное значение Y.\nЧисло (-3..5)";
            document.getElementById('errY').style.visibility = "hidden";
            document.getElementById('errR').style.visibility = "hidden";
            if(yCoord=="nevermore")
            {
                video.style.visibility="visible";
                if (video.requestFullscreen) {
                    video.requestFullscreen();
                } else if (video.mozRequestFullScreen) {
                    video.mozRequestFullScreen();
                } else if (video.webkitRequestFullscreen) {
                    video.webkitRequestFullscreen();
                } else if (video.msRequestFullscreen) {
                    video.msRequestFullscreen();
                };
                video.play();
            } else
            if (yCoord == "DEUS VULT" || yCoord == "AVE MARIA"){
                var audio = new Audio('music/DEUS_VULT.mp3');
                audio.play();
                document.body.style.backgroundImage = "url('./img/bg_crusade.jpg')";
                document.body.style.backgroundColor = "white";
                document.getElementById('send').style.visibility = "hidden";
                drawCrusader();
                audio.onended = function() {
                    document.body.style.backgroundImage = "url('./img/bg.jpg')";
                    document.body.style.backgroundColor = "#9a0000";
                    document.getElementById('send').style.visibility = "visible";
                    document.getElementById('easterEgg').style.visibility="hidden";
                    document.getElementById('easterEgg').style.top="1000px";
                };
            }
            else {
                var reg = /^[+-]?([0-9]+([.,][0-9]+)?)([Ee]-?[0-9]+)?$/;

                if(!( yCoord.match(reg))){
                    error = true;
                    document.getElementById('errY').style.visibility = 'visible';
                    document.getElementById('errY').innerHTML = msg;
                }
                if (yCoord <= -3 || yCoord >= 5) {
                    error = true;
                    document.getElementById('errY').style.visibility = 'visible';
                    document.getElementById('errY').innerHTML = msg;
                }
                if (yCoord == "") {
                    document.getElementById('errY').style.visibility = 'visible';
                    document.getElementById('errY').innerHTML = msg;
                    error = true;
                }

                if ((error == false)&&!validateRadius(rCoord)) {
                    form.submit();
                    document.getElementById('answer').style.display="block";
                    draw('canvas', rCoord);
                    drawDot('canvas', form.xCoordClick.value, yCoord,rCoord);
                }

            }

        }

        function validateRadius(rCoord) {
            dropColor();
            var msgr= "Неверное значение R.\nЧисло (2..5)";
            var reg = /^[+-]?([0-9]+([.,][0-9]+)?)([Ee]-?[0-9]+)?$/;
            var error = false;
            if (rCoord == "" || rCoord <= 2 || rCoord >= 5 || !(rCoord.match(reg))) {
                document.getElementById('errR').style.visibility = 'visible';
                document.getElementById('errR').innerHTML = msgr;
                error = true;
            }
            else draw('canvas', rCoord);
            return error;
        }

        function clearY(){
            document.getElementById('yCoord').value = '';
        }

        function resetValidationY() {
            document.getElementById('errY').style.visibility = 'hidden';
            document.getElementById('errY').innerHTML = '123';
        }

        function resetValidationR() {
            document.getElementById('errR').style.visibility = 'hidden';
            document.getElementById('errR').innerHTML = '123';
        }

        function drawCrusader(){
            var ctx = document.getElementById('easterEgg');
            ctx.style.visibility="visible";
            var pos = 900;
            var id = setInterval(img, 10);
            function img() {
                if(pos == 600){
                    clearInterval(id);
                }
                else {
                    pos--;
                    ctx.style.top = pos + 'px';
                }
            }
        }

        function draw(canvasID, symbol) {
            var ctx = document.getElementById(canvasID).getContext("2d");
            ctx.clearRect(0,0, 500, 500);
            ctx.fillStyle = "rgba(255, 198, 42, 0.5)";
            ctx.fillRect(0, 0 , 500, 500);

            //triangle
            ctx.beginPath();
            ctx.strokeStyle = "#9a0000";
            ctx.fillStyle = "rgba(154, 0, 0, 0.7)";
            ctx.moveTo(450, 250);
            ctx.lineTo(250, 50);
            ctx.lineTo(250, 250);
            ctx.closePath();
            ctx.fill();
            ctx.stroke();

            //прямоугольник
            ctx.beginPath();
            ctx.moveTo(350, 250);
            ctx.lineTo(350, 450);
            ctx.lineTo(250, 450);
            ctx.lineTo(250, 250);
            ctx.closePath();
            ctx.fill();
            ctx.stroke();

            //сектор
            ctx.beginPath();
            ctx.arc(250, 250, 100, Math.PI, 3*Math.PI/2,false);
            ctx.lineTo(250, 250);
            ctx.closePath();
            ctx.fill();
            ctx.stroke();

            //оси
            ctx.beginPath();
            ctx.strokeStyle = "black";
            ctx.lineWidth = "2";
            ctx.moveTo(0, 250);
            ctx.lineTo(500, 250);
            ctx.moveTo(250, 0);
            ctx.lineTo(250, 500);
            ctx.stroke();

            //отметки
            ctx.beginPath();
            ctx.moveTo(245, 50);
            ctx.lineTo(255, 50);
            ctx.moveTo(245, 150);
            ctx.lineTo(255, 150);
            ctx.moveTo(245, 350);
            ctx.lineTo(255, 350);
            ctx.moveTo(245, 450);
            ctx.lineTo(255, 450);

            ctx.moveTo(50, 245);
            ctx.lineTo(50, 255);
            ctx.moveTo(150, 245);
            ctx.lineTo(150, 255);
            ctx.moveTo(350, 245);
            ctx.lineTo(350, 255);
            ctx.moveTo(450, 245);
            ctx.lineTo(450, 255);
            ctx.closePath();
            ctx.stroke();

            //подписи
            ctx.fillStyle="black";
            ctx.font = "20px Times New Roman bold";
            if(!isNaN(parseFloat(symbol))){
                ctx.fillText("-"+symbol, 40, 275);
                ctx.fillText("-"+ (symbol/2), 130, 275);
                ctx.fillText(symbol/2, 340, 275);
                ctx.fillText(symbol, 445, 275);

                ctx.fillText(symbol, 265, 53);
                ctx.fillText(symbol/2, 265, 153);
                ctx.fillText("-"+(symbol/2), 265, 353);
                ctx.fillText("-"+symbol, 265, 453);
                ctx.stroke();
            }
            else{
                ctx.fillText("-R", 40, 275);
                ctx.fillText("-R/2", 130, 275);
                ctx.fillText("R/2", 340, 275);
                ctx.fillText("R", 445, 275);

                ctx.fillText("R", 265, 53);
                ctx.fillText("R/2", 265, 153);
                ctx.fillText("-R/2", 265, 353);
                ctx.fillText("-R", 265, 453);
                ctx.stroke();
            }

        }

        function drawDot(canvasID, x, y, r) {
            var ctx = document.getElementById(canvasID).getContext("2d");
            if(Math.abs(x/r)>1.25 || Math.abs(y/r)>1.25){
                ctx.font = "14px Times New Roman";
                ctx.fillText('Некоторые точки за пределами графика', 60, 480);
            } else {
                ctx.fillStyle = "black";
                ctx.beginPath();
                ctx.arc(250 + ((x / r) * 200), 250 - ((y / r) * 200), 2, 0, Math.PI * 2);
                ctx.closePath();
                ctx.fill();
                ctx.stroke();
            }
        }

        function dropColor() {
            var nodes = document.querySelectorAll('.clickable');
            for (var i = 0; nodes[i]; i++) {
                nodes[i].style.backgroundColor = "#f6bd4a";
            }
        }

        function makeRed(elem){
            var x, y, r;
            dropColor();

            elem.style.backgroundColor = "red";
            var tds = elem.getElementsByTagName('td');
            x = parseFloat(tds[0].innerHTML);
            y = parseFloat(tds[1].innerHTML);
            r = parseFloat(tds[2].innerHTML);
            draw('canvas', r);
            drawDot('canvas', x, y, r);

        }

        function getMouseCoord(canvas, event) {
            var rect = canvas.getBoundingClientRect();
            return {
                x: event.clientX - rect.left,
                y: event.clientY - rect.top
            }
        }

        function interactiveCanvas(){
            var canvas = document.getElementById('canvas');
            var formObj = document.getElementById('form');
            var event = window.event;
            var mouseCoord = getMouseCoord(canvas, event);
            var radiusVal = formObj.radiusValue.value;
            if(!validateRadius(radiusVal)){

                var x = (((mouseCoord.x - 250) * radiusVal) / 200);
                var y = (((-mouseCoord.y + 250) * radiusVal) / 200 );
                document.getElementById('xCoordClick').value = x;
                formObj.yCoord.value = y;
                formSubmit();
            }
        }

        function setX(){
            document.getElementById('xCoordClick').value = document.getElementById('xCoord').value;
        }
    </script>

  <div>
    <div class="errY" id="errY">123</div>
    <br>
    <div class="errR" id="errR">123</div>
  </div>
</div>


<div class="block shadow history" id="historyBlock" name="historyBlock">
<%

  Object obj  = request.getSession().getAttribute("resultHistory");
  ArrayList<ResRow> results;

  if(obj == null){
      %>
      <p class="title">НЕТ ДАННЫХ</p>
      <p class="title">Здесь будет показана история проверки точек</p>
  <%
  }
  else {

      results = (ArrayList)(obj);
      %>
      <p class="title">История проверки точек</p>
      <table id="resTable">
              <tr>
                <td>X</td>
                <td>Y</td>
                <td>R</td>
                <td>Результат</td>
              </tr>

          <%
      for(int i= results.size() - 1; i > -1; i--){
          ResRow curr = results.get(i);
        %>
          <tr  class="clickable" onclick="makeRed(this)">

            <td><%= curr.getX()%></td>
            <td><%= curr.getY()%></td>
            <td><%= curr.getRadius()%></td>
            <td><%= curr.getResult()%></td>

          </tr>

        <%
      }
      %>
      </table>
  <%
      if (results.size() == 0) {
  %>
  <p class="title">НЕТ ДАННЫХ</p>
  <p class="title">Здесь будет показана история проверки точек</p>
  <%
      }
  }
%>
</div>
<video width="400" height="320" id="nevermore"src="video/nevermore.mp4" controls="controls" style="visibility: hidden; margin: 0 auto;">
</video>
</body>
</html>