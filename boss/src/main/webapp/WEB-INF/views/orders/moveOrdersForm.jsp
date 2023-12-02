<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 폼</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="css/ordersForm.css">

</head>
<!-- jQuery -->
<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
   src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
   
<body>
   <form method="post" action="ordersForm.do">
   	<input type="hidden" name="bid" value="${bucket.bid}">
   	<input type="hidden" name="mEmail" value="${member.mEmail}">
      <div class="container_main">
         <center>
            <h1 style="font-size: 50px">주문서 작성</h1>
         </center>
         <div class="container_left">

            <h2>배송지 입력</h2>
            <table class="table_orders1">
               <tr>
                  <td><input type="text" value="${member.mName } "
                     placeholder="이름을 입력하세요." maxlength="5"
                     style="color: palegreen; font-size: 30px"></td>
               </tr>
               <tr>
                  <td><input type="text" value="${member.mPhone }" nmae="mPhone"
                     placeholder="휴대폰번호를 입력하세요." maxlength="11"></td>
               </tr>
               <tr>
                  <td><input type="text" value="${member.mPost }" name="mPost"
                     placeholder="우편번호를 입력하세요." maxlength="5"></td>
               </tr>
               <tr>
                  <td><input type="text" value="${member.mAddress }" name="mAddress"
                     placeholder="주소를 입력하세요." maxlength="40"></td>
               </tr>
            </table>
            <h2>주문자 입력</h2>
            <table class="table_orders2">
               <tr>
                  <td><input type="text" value="${member.mName }"
                     placeholder="이름을 입력하세요." maxlength="5"
                     style="color: palegreen; font-size: 30px"></td>
               </tr>
               <tr>
                  <td><input type="text" value="${member.mPhone }" name="mPhone"
                     placeholder="휴대폰번호를 입력하세요." maxlength="11"></td>
               </tr>
            </table>



            <h2>주문상품</h2>
            <table class="table_product">
               <tr>
                  <td class="product_img" rowspan="5"><img
                     src="./imeges/${bucket.bimage}"></td>
               <tr>
                  <td><input type="text" value="${bucket.bname}" name="bname" readonly
                     style="color: palegreen; font-size: 30px"></td>
               </tr>

               <tr>
                  <td>${bucket.bsize}</td>
               </tr>
               <tr>
                  <td>${bucket.bcolor}</td>
               </tr>
               <tr>
                  <td>${bucket.bprice}&#8361;${bucket.bcount}개</td>
               </tr>

            </table>

         </div>
         <div class="container_right">
            <table class="table_point">
               <tr>
                  <h2>결제정보</h2>
               </tr>
               <tr>
                  <td><input type="text" value="${member.mName }" name="mName"
                     placeholder="이름을 입력하세요." maxlength="5"
                     style="color: palegreen; font-size: 30px"></td>
               </tr>
               <tr>
                  <td>총금액 : ${bucket.bprice }</td>
               </tr>
               <tr>
                  <td>배송비 : 4000</td>
               </tr>

            </table>
            <button type="submit">결제하기</button>
            <div class="img_logo">
               <a href="main.do"><img src="./images/logo.png"
                  style="margin-left: 20px; width: 350px"></a>
            </div>
         </div>
   </form>









</body>   