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
  <?php

if ($this->session->flashdata('message')) {
	$message = $this->session->flashdata('message');
}
if ($this->session->flashdata('error')) {
	$error = $this->session->flashdata('error');
}
if (function_exists('validation_errors') && validation_errors() != '') {
	$error = validation_errors();
}
?>

  <?php if (!empty($message)): ?>
  <div class="alert alert-info">
      <a class="close" data-dismiss="alert">×</a>
      <?php echo $message;?>
  </div>
  <?php endif;?>

  <?php if (!empty($error)): ?>
  <div class="alert alert-error">
      <a class="close" data-dismiss="alert">×</a>
      <?php echo $error;?>
  </div>
  <?php endif;?>

    <div class="container paddingTop20">
      <?php
$attributes = array('class' => 'form-horizontal', 'id' => 'account_form');
echo form_open('account/register/', $attributes);
?>
        <div class="form-group">
          <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
          <div class="col-sm-10">
            <?php
$data = array('id' => 'username', 'name' => 'username', 'value' => set_value('username', $username));
echo form_input($data);
?>
            <span class="help-inline">
              <i class="icon-star" title="<?php echo lang('data_required');?>"></i>
            </span>
          </div>
        </div>

        <div class="form-group">
          <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
          <div class="col-sm-10">
            <?php
$data = array('id' => 'password', 'name' => 'password', 'value' => set_value('password', ''));
echo form_password($data);
?>
            <span class="help-inline">
              <i class="icon-star" title="<?php echo lang('data_required');?>"> </i>
          </div>
        </div>

        <div class="form-group">
          <label for="inputPassword3" class="col-sm-2 control-label">再次输入密码</label>
          <div class="col-sm-10">
            <?php
$data = array('id' => 'password_confirm', 'name' => 'password_confirm', 'value' => set_value('password_confirm', ''));
echo form_password($data);
?>
            <span class="help-inline">
              <i class="icon-star" title=""> </i>
            </span>
          </div>
        </div>

        <div class="form-group">
          <label for="" class="col-sm-2 control-label">邮箱</label>
          <div class="col-sm-10">
            <?php
$data = array('id' => 'email', 'name' => 'email', 'value' => set_value('email', $email));
echo form_input($data);
?>
            <span class="help-inline">
              <i class="icon-star" title="<?php echo lang('data_required');?>"> </i>
            </span>
          </div>
        </div>

        <div class="form-group">
          <label for="" class="col-sm-2 control-label">手机号码</label>
          <div class="col-sm-10">
            <?php
$data = array('id' => 'phone', 'name' => 'phone', 'value' => set_value('phone', $phone));
echo form_input($data);
?>
            <span class="help-inline">
              <i class="icon-star" title="<?php echo lang('data_required');?>"> </i>
          </div>
        </div>
        <div class="form-actions">
            <button type="submit" class="btn btn-primary">注册</button>
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