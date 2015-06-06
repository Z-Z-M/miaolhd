<?php
if (!defined('BASEPATH')) {
	exit('No direct script access allowed');
}

/**
 *首页控制器
 * @category Controllers
 * @author 　二　阳°(QQ:707069100)
 * @link http://weibo.com/513778937?topnav=1&wvr=5
 */
class Index extends CI_Controller {

	/**
	 * 构造函数
	 *
	 * @access public
	 * @return void
	 */
	public function __construct() {
		parent::__construct();

	}

	// ------------------------------------------------------------------------

	/**
	 * 默认入口
	 */
	public function index() {
		//print_r($this->config);
		//var_dump(base_url());
		$this->load->view('default/index');
		//header('Location: /project/cncms/admin');
		//var_dump('test');
	}

	// ------------------------------------------------------------------------

}

/* End of file index.php */
/* Location: ./app/web/controllers/index.php */
