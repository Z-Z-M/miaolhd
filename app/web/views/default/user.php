<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>大数据，精彩生活，用户注册页</title>

    <!-- Bootstrap -->
    <link href="/assets/web/default/css/bootstrap.min.css" rel="stylesheet">
    <link href="/assets/web/default/css/main.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="container paddingTop20">
      <form id="login-form" class="form-horizontal">
        <div class="form-group">
          <label for="inputEmail3" class="col-sm-2 control-label" name="username">用户名</label>
          <div class="col-sm-10">
            <input type="name" class="form-control" id="inputName3" placeholder="用户名">
          </div>
        </div>
        <div class="form-group">
          <label for="inputPassword3" class="col-sm-2 control-label" name="password">密码</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="inputPassword3" placeholder="密码">
          </div>
        </div>
        <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <div class="checkbox">
              <label>
                <input type="checkbox"> 记住我
              </label>
            </div>
          </div>
        </div>
      </form>
      <form id="registered-form" class="form-horizontal">
        <div class="form-group">
          <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
          <div class="col-sm-10">
            <input type="name" class="form-control" id="" placeholder="用户名">
          </div>
        </div>
        <div class="form-group">
          <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="" placeholder="密码">
          </div>
        </div>
        <div class="form-group">
          <label for="inputPassword3" class="col-sm-2 control-label">再次输入密码</label>
          <div class="col-sm-10">
            <input type="password" class="form-control" id="" placeholder="再次输入密码">
          </div>
        </div>
        <div class="form-group">
          <label for="" class="col-sm-2 control-label">邮箱</label>
          <div class="col-sm-10">
            <input type="email" class="form-control" id="" placeholder="邮箱">
          </div>
        </div>
        <div class="form-group">
          <label for="" class="col-sm-2 control-label">手机号码</label>
          <div class="col-sm-10">
            <input type="tel" class="form-control" id="" placeholder="手机号码">
          </div>
        </div>
      </form>
      <div class="form-group">
          <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default btn-info login">登录</button>
            <button type="submit" class="btn btn-default btn-success registered">注册</button>
          </div>
      </div>
     </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/assets/web/default/js/bootstrap.min.js"></script>
    <script src="/assets/web/default/js/main.js"></script>
  </body>
</html>