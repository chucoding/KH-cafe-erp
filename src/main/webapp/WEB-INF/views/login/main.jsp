<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
   <title>메인 화면</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->   
   <link rel="icon" type="image/png" href="/resources/images/icons/favicon.ico"/>
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/resources/vendor/fontawesome-free/css/all.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">
<!--===============================================================================================-->   
   <link rel="stylesheet" type="text/css" href="/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
   <link rel="stylesheet" type="text/css" href="/resources/css/util.css">
   <link rel="stylesheet" type="text/css" href="/resources/css/login.css">
<!--===============================================================================================-->
<script type="text/javascript">
console.log(${position})
</script>

</head>
<body>
   
   <div class="limiter">
      <div class="container-login100">
         <div class="wrap-login100">
            <div class="login100-pic js-tilt" data-tilt>
               <img src="/resources/images/khlogo.png" alt="IMG">
            </div>

            <form class="login100-form validate-form" action="/login/check" method="post">
               <span class="login100-form-title">
                  <h1>KH Cafe ERP</h1><br>
                  <h1>프로그램</h1>
               </span>
               <c:if test="${ !login }">
<!--                <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz"> -->
<!--                   <input class="input100" type="text" name="shopNo" placeholder="Shop code"> -->
<!--                   <span class="focus-input100"></span> -->
<!--                   <span class="symbol-input100"> -->
<!--                      <i class="fa fa-coffee" aria-hidden="true"></i> -->
<!--                   </span> -->
<!--                </div> -->
               <div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
                  <input class="input100" type="text" name="staffNo" placeholder="Staff code">
                  <span class="focus-input100"></span>
                  <span class="symbol-input100">
                     <i class="fa fa-user" aria-hidden="true"></i>
                  </span>
               </div>

               <div class="wrap-input100 validate-input" data-validate = "Password is required">
                  <input class="input100" type="password" name="pw" placeholder="Password">
                  <span class="focus-input100"></span>
                  <span class="symbol-input100">
                     <i class="fa fa-lock" aria-hidden="true"></i>
                  </span>
               </div>
               
               <div class="container-login100-form-btn">
                  <button class="login100-form-btn" data-toggle="modal" data-target="#logincheck" >
                     로그인
                  </button>
               </div>

               <div class="text-center p-t-12">
                  
                  <a class="txt2" href="/findinfo/findinfo">
                     아이디 찾기
                  </a>
                  <a class="txt2" href="/findinfo/findpwinfo">
                     패스워드 찾기
                  </a>
                  
               </div>

               <div class="text-center p-t-136">
                  <a class="txt2" href="/join/join">
                     회원가입하기
                     <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                  </a>
               </div>
               </c:if>
            </form>
               <c:if test="${ login }">
                  <div class="container-login100-form-btn">
                  <a href="/dashboard/index">
                     <button class="login100-form-btn">
                        대쉬보드 시작하기
                     </button>
                  </a>
                  <br>
                  <a href="/login/logout">
                     <button class="login100-form-btn">
                        로그아웃
                     </button>
                  </a>
               </div>
               </c:if>
         </div>
      </div>
   </div>
   





   
<!--===============================================================================================-->   
   <script src="/resources/vendor/jquery/jquery.min.js"></script>
<!--===============================================================================================-->
   <script src="/resources/vendor/bootstrap/js/popper.js"></script>
   <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
   <script src="/resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
   <script src="/resources/vendor/tilt/tilt.jquery.min.js"></script>
   <script >
      $('.js-tilt').tilt({
         scale: 1.1
      })
   </script>
<!--===============================================================================================-->
   <script src="/resources/js/login.js"></script>

</body>
</html>