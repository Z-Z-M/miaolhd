<?php
if (!defined('BASEPATH')) {
	exit('No direct script access allowed');
}

/**
 * 前台公共模型
 *
 * @category Models
 * @author
 * @link
 */
class Base_model extends CI_Model {
	public function __construct() {
		parent::__construct();
	}

	// ------------------------------------------------------------------------

	/**
	 * 获取单条数据
	 *
	 * @access public
	 * @param
	 *        	string 表名
	 * @param
	 *        	array 条件数组
	 * @param
	 *        	string 查询字段
	 * @return array 一维数据数组
	 */
	public function get_one($table, $where = array(), $fields = '*') {
		$db_table = $this->db->dbprefix($table);
		if ($where) {
			$this->db->where($where);
		}
		return $this->db->select($fields)->from($db_table)->get()->row_array();
	}

	// ------------------------------------------------------------------------

	/**
	 * 获取多条数据
	 *
	 * @access public
	 * @param
	 *        	string 表名
	 * @param
	 *        	array 条件数组
	 * @param
	 *        	string 查询字段
	 * @return array 多维数据数组
	 */
	public function get_all($table, $where = array(), $fields = '*') {
		$db_table = $this->db->dbprefix($table);
		if ($where) {
			$this->db->where($where);
		}
		return $this->db->select($fields)->from($db_table)->get()->result_array();
	}

	// ------------------------------------------------------------------------

	/**
	 * 获取多条数据
	 *   分页
	 * @access public
	 * @param
	 *        	string 表名
	 * @param
	 *        	limit 条数
	 * @param
	 *        	offset 页码
	 * @param
	 *        	array 条件数组
	 * @param
	 *        	string 查询字段
	 * @return array 多维数据数组
	 */
	public function get_all_page($table, $rows, $page, $where = array(), $fields = '*') {
		$db_table = $this->db->dbprefix($table);
		if ($where) {
			$this->db->where($where);
		}

		if (!empty($rows)) {
			$this->db->limit($rows);
		}

		if (!empty($page)) {
			$this->db->offset($page);
		}

		return $this->db->select($fields)->from($db_table)->get()->result_array();
	}

	// ------------------------------------------------------------------------

	/**
	 * 获取行数
	 *
	 * @access public
	 * @param
	 *        	int
	 * @return int
	 */
	public function get_count_num($table) {
		return $this->db->count_all_results($this->db->dbprefix($table));
	}

	// ------------------------------------------------------------------------

	/**
	 * 添加数据
	 *
	 * @access public
	 * @param
	 *        	string 表名
	 * @param
	 *        	array 数据数组
	 * @return number 添加的记录 ID
	 */
	public function insert($table, $data) {
		$db_table = $this->db->dbprefix($table);
		$this->db->insert($db_table, $data);
		return $this->db->insert_id();
	}

	// ------------------------------------------------------------------------

	/**
	 * 删除数据
	 *
	 * @access public
	 * @param
	 *        	string 表名
	 * @param
	 *        	array 条件数组
	 * @return number 影响行数
	 */
	public function delete($table, $where) {
		$db_table = $this->db->dbprefix($table);
		$this->db->delete($db_table, $where);
		return $this->db->affected_rows();
	}

	// ------------------------------------------------------------------------

	/**
	 * 更新数据
	 * 不会将原值与新值一样的列更新
	 *
	 * @access public
	 * @param
	 *        	string 表名
	 * @param
	 *        	array 数据数组
	 * @param
	 *        	array 条件数组
	 * @return number 影响行数
	 *  自动
	 *  $this->db->set('field', 'field+1', FALSE);
	 *
	$this->db->update('mytable');
	 *
	 */
	public function update($table, $data, $where = array()) {
		$db_table = $this->db->dbprefix($table);
		if ($where) {
			$this->db->where($where);
		}
		$this->db->update($db_table, $data);
		return $this->db->affected_rows();
	}

	// ------------------------------------------------------------------------

	/**
	 * 更新数据
	 *
	 * @access public
	 * @param
	 *        	string 表名
	 * @param
	 *        	array 数据数组
	 * @param
	 *        	array 条件数组
	 * @return number 影响行数
	 */
	public function update_equal_field($table, $data, $where = array()) {
		$db_table = $this->db->dbprefix($table);
		if ($where) {
			$this->db->where($where);
		}
		return $this->db->update($db_table, $data);
	}
	// ------------------------------------------------------------------------

	/**
	 * 更新数据
	 * 某个字段自增
	 *  $this->db->set('field', 'field+1', FALSE);
	 * $this->db->update('mytable');
	 * @access public
	 * @param
	 *        	string 表名
	 * @param
	 *        	array 数据数组
	 *  * @param
	 *        	array 条件
	 *
	 */
	public function update_set_data($table, $where = array(), $data = array(), $is_add = false, $field = false/*字段名*/) {

		if ($is_add) {
//如果自增
			$this->db->set($field, $field + 1, FALSE);
		}

		if ($data) {
//其他字段
			$this->db->set($data);
		}

		if ($where) {
//条件
			$this->db->where($where);
		}

		return $this->db->affected_rows($table);
		// return $this -> db -> update($table);
	}

	// ------------------------------------------------------------------------
	/**
	 * 检查某表的某字段的值是否存在
	 */
	public function check_table_field($table, $field, $str, $id = false, $where = array()) {
		$db_table = $this->db->dbprefix($table);
		$this->db->select($field);
		$this->db->from($db_table);
		$this->db->where($field, $str);
		if (!empty($where)) {
//自定义条件
			$this->db->where($where);
		}
		if ($id) {
			$this->db->where('id !=', $id);
		}
		$count = $this->db->count_all_results();
		if ($count > 0) {
			return true;
		} else {
			return false;
		}
	}

	// ------------------------------------------------------------------------
}

/* End of file base_model.php */
/* Location: ./app/admin/models/base_model.php */
