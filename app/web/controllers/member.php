<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Member extends CI_Controller {

	function __construct() {
		parent::__construct();
		$this->load->database();
		$this->load->library(array('ion_auth'));
		$this->lang->load('auth');
	}

	//redirect if needed, otherwise display the user list
	function index() {

		if (!$this->ion_auth->logged_in()) {
			//redirect them to the login page
			redirect('auth/login', 'refresh');

		} else {

			//list the current user
			$user = $this->ion_auth->user()->row();
			$this->data['user'] = $user;
			$this->data['user']->groups = $this->ion_auth->get_users_groups($user->id)->result();

			//var_dump($this->ion_auth->user()->row());
			//exit;

			//$this->_render_page('auth/index', $this->data);
			$this->_render_page('member/index', $this->data);
		}
	}

	function _render_page($view, $data = null, $render = false) {

		$this->viewdata = (empty($data)) ? $this->data : $data;

		$view_html = $this->load->view($view, $this->viewdata, $render);

		if (!$render) {
			return $view_html;
		}

	}

}
