<!DOCTYPE html>
<html>
  <head>
    <title>~{$smarty.const.__APP_TITLE__}~</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="~{$smarty.const.__APP_TITLE__}~" />
    <meta name="keywords" content="Notifications, Admin, Dashboard, Bootstrap3, Sass, transform, CSS3, HTML5, Web design, UI Design, Responsive Dashboard, Responsive Admin, Admin Theme, Best Admin UI, Bootstrap Theme, Wrapbootstrap, Bootstrap, bootstrap.gallery" />
    <meta name="author" content="Bootstrap Gallery" />
    <link rel="shortcut icon" href="img/favicon.ico">

    <link href="~{$smarty.const.__WEB_LIB_BOOTSTRAP__}~dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="~{$smarty.const.__WEB_LIB_THEME__}~dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="~{$smarty.const.__WEB_LIB_BOWER__}~font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="~{$smarty.const.__WEB_LIB_THEME__}~dist/css/timeline.css" rel="stylesheet">
	<script src="~{$smarty.const.__WEB_LIB_BOWER__}~jquery/dist/jquery.min.js"></script>

    <!-- HTML5 shiv and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">

                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Message</h3>
                    </div>

                    <div class="panel-body">
                    	</br></br>
                    	<h2 align="center">~{$errmsg}~</h2>
                    	</br></br>
						<a class="btn btn-success" href="~{$suite}~.html" >~{$btnReturn}~</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!--     Main Container start -->
<!--     <div class="dashboard-container"> -->

<!--       <div class="container"> -->

<!--         Row Start -->
<!--         <div class="row"> -->
<!--           <div class="col-lg-4 col-md-4 col-md-offset-4"> -->
<!--             <div class="sign-in-container"> -->
<!--               <form class="login-wrapper"> -->
<!--                 <div class="header"> -->
<!--                   <div class="row"> -->
<!--                     <div class="col-md-12 col-lg-12"> -->
<!--                     	</br></br></br></br> -->
<!--                     	<h2 align="center">~{$errmsg}~</h2> -->
<!--                     	</br></br> -->
<!-- 						<a class="btn btn-success" href="~{$suite}~.html" >~{$btnReturn}~</a> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                 </div> -->
<!--               </form> -->
<!--             </div> -->
<!--           </div> -->
<!--         </div> -->
<!--         Row End -->

<!--       </div> -->
<!--     </div> -->
<!--     Main Container end -->

	<script src="~{$smarty.const.__WEB_LIB_BOWER__}~bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="~{$smarty.const.__WEB_LIB_THEME__}~dist/js/sb-admin-2.js"></script>

  </body>
</html>