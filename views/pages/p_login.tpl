<!DOCTYPE html>

<html   ~{if isset($smarty.session.__user_lang__)}~ 
		lang="~{$smarty.session.__user_lang__}~" 
		~{else}~ 
		lang="fr" 
		~{/if}~
>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>~{$smarty.const.__APP_TITLE__}~</title>
	
    <link href="~{$smarty.const.__WEB_LIB_BOOTSTRAP__}~dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="~{$smarty.const.__WEB_LIB_THEME__}~dist/css/sb-admin-2.css" rel="stylesheet">
    <link href="~{$smarty.const.__WEB_LIB_BOWER__}~font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="~{$smarty.const.__WEB_LIB_THEME__}~dist/css/timeline.css" rel="stylesheet">
	<script src="~{$smarty.const.__WEB_LIB_BOWER__}~jquery/dist/jquery.min.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>


<body>

    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Bienvenue dans Gestion JoliJeûne</h3>
                    </div>
                    <div class="panel-body">
                    
<!--                    <form action="login-index.html" class="login-wrapper" method="post"> -->
                    
                        <form action="index.php?action=login&page=index" method="POST" role="form" id="flogin" name="flogin">
                        
						 ~{if $smarty.server.__app_params__['__APP_MAINTAIN__']}~
										
			                <div class="content">
								<p>
								Le site est actuellement en maintenance<br/><br/>
								Merci de votre compréhension<br/><br/>						
								</p>
							</div>
			                <div class="actions">
			                  <a class="btn btn-success" href="index.html">Réessayer</a>
			                  <div class="clearfix"></div>
			                </div>
						
						 ~{else}~
                        
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Identifiant" name="login" type="login" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Mot de passe" name="password" type="password" value="">
                                </div>
<!--                                 <div class="checkbox"> -->
<!--                                     <label> -->
<!--                                         <input name="remember" type="checkbox" value="Remember Me">M&eacute;moriser -->
<!--                                     </label> -->
<!--                                 </div> -->
								</br>
                                <button type="submit" class="btn btn-lg btn-success btn-block">OK</button>
                            </fieldset>

						 ~{/if}~
						 
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
	<script src="~{$smarty.const.__WEB_LIB_BOWER__}~bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="~{$smarty.const.__WEB_LIB_THEME__}~dist/js/sb-admin-2.js"></script>

</body>

</html>