<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 
 <!-- css 불러오기 -->
<link rel="stylesheet" href="css/chatbot.css">


<script src="./js/chatbot.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>

<!-- Popup chat window -->
<!-- <div class="chat-body"> -->
<!-- chat open -->
<div class="chat-bar-open" id="chat-open" style="display: block;">
   <button id="chat-open-button" type="button" class="collapsible close"
      onclick="chatOpen()">
      <img src="images/chatbot.png" alt="Chat Botimage" />
   </button>
</div>

<!-- chat close -->
<div class="chat-bar-close" id="chat-close" style="display: none;">
   <button id="chat-close-button" type="button" class="collapsible close"
      onclick="chatClose()">
      <i class="material-icons-outlined">x</i>
   </button>
</div>

<!-- chat chat-window -->
<div class="chat-window" id="chat-window1" style="display: none;">
   <div class="message-box" id="messageBox">
      <div class="hi-there">
         <p class="p1">안녕하세요</p>
         <br />
         <p class="p2">AI가 당신의 취향에 맞게 옷을 추천해 줘요. 질문 후 기다려 주세요!</p>
      </div>
   </div>
   <div class="input-box">
      <div class="write-reply">
         <input class="inputText" type="text" id="textInput"
            placeholder="물어봐줘 제발..." />
      </div>
      <div class="send-button">
         <button type="submit" class="send-message" id="send"
            onclick="userResponse()">
            <i class="material-icons-outlined"> 대답! </i>
         </button>
      </div>
   </div>
</div>
<!-- </div> -->
</body>
</html>