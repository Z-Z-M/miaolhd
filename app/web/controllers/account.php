
<?php
if (!defined('BASEPATH')) {
	exit('No direct script access allowed');
}

/**
 *用户登录、注册、退出控制器
 * @category Controllers
 * @author 　zzskyfish
 * @link
 */
class Account extends CI_Controller {

	private $model_name = 'ucenter';
	private $controller_name = 'account';

	/**
	 * 构造函数
	 *
	 * @access public
	 * @return void
	 */
	public function __construct() {
		parent::__construct();
		$this->load->model('account_model');
		$this->lang->load($this->controller_name);

	}

	// ------------------------------------------------------------------------

	/**
	 * 默认入口
	 */
	public function index() {
		//print_r($this->config);
		//var_dump(base_url());
		$this->load->view('default/user');
		//header('Location: /project/cncms/admin');
		//var_dump('test');
	}

	// ------------------------------------------------------------------------

	public function register() {
		$this->load->helper('form');
		$this->load->library('form_validation');

		$data['username'] = '';
		$data['password'] = '';
		$data['password_confirm'] = '';
		$data['phone'] = '';
		$data['email'] = '';

		$this->form_validation->set_rules('username', 'lang:account_username', 'trim|required|alpha_numeric|min_length[6]|max_length[50]|callback_check_username');
		$this->form_validation->set_rules('phone', 'lang:account_phone', 'trim|required|max_length[11]|numeric_phone|callback_check_phone');
		$this->form_validation->set_rules('email', 'lang:account_email', 'trim|required|valid_email|max_length[50]|callback_check_email');

		$this->form_validation->set_rules('password', 'lang:account_password', 'trim|required|alpha_dash_bias|min_length[6]|max_length[16]');
		$this->form_validation->set_rules('password_confirm', 'lang:account_password_confirm', 'trim|required|matches[password]');

		if ($this->form_validation->run() == FALSE) {
			$this->load->view('default/register', $data);
		} else {
			$this->load->helper('my_md5');
			$save['username'] = strtolower($this->input->post('username'));
			$save['phone'] = $this->input->post('phone');
			$save['email'] = strtolower($this->input->post('email'));

			if ($this->input->post('password') != '') {
				$save['password'] = str_md5($this->input->post('password'));
			} else {
				$save['password'] = str_md5($data['password']);
			}

			$save['status'] = 1;

			$action = $this->account_model->insert($this->model_name, $save);

			if ($action) {
				$this->session->set_flashdata('message', lang('save_success'));
				redirect('meeting');
			}

			$this->session->set_flashdata('error', lang('save_fail'));
			redirect('default/register', $data);
		}
		//$this->load->view('default/register', $data);
	}

	// ------------------------------------------------------------------------
	/**
	 * 检查用户名
	 */
	public function check_username($str) {
		$username = $this->account_model->check_table_field($this->model_name, 'username', strtolower($str), false);
		if ($username) {
			$this->form_validation->set_message('check_username', lang('error_manager_username_taken'));
			return FALSE;
		} else {
			return TRUE;
		}
	}
	// ------------------------------------------------------------------------

	/**
	 * 检查手机号码
	 */
	public function check_phone($str) {
		$phone = $this->account_model->check_table_field($this->model_name, 'phone', $str, false);
		if ($phone) {
			$this->form_validation->set_message('check_phone', lang('error_manager_phone_taken'));
			return FALSE;
		} else {
			return TRUE;
		}
	}
	// ------------------------------------------------------------------------

	/**
	 * 检查电子邮箱
	 */
	public function check_email($str) {
		$email = $this->account_model->check_table_field($this->model_name, 'email', strtolower($str), false);
		if ($email) {
			$this->form_validation->set_message('check_email', lang('error_manager_email_taken'));
			return FALSE;
		} else {
			return TRUE;
		}
	}
	// ------------------------------------------------------------------------

}

/* End of file index.php */
/* Location: ./app/web/controllers/index.php */
