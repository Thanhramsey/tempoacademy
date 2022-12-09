<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Muser extends CI_Model {

	public function __construct(){
        parent::__construct();
        $this->table = $this->db->dbprefix('user');
    }
    //login
    function user_login($username, $password){
    	$this->db->where('username', $username);
		$this->db->or_where('email', $username);
    	$this->db->where('password', $password);
    	$query = $this->db->get($this->table);
        if(count($query->result_array())==1)
        {
        	return $query->row_array();
        }
        else
        {
        	return FALSE;
        }
    }
    //index
    public function users_all($limit, $first){
        $this->db->where('trash', 1);
        $this->db->where('id !=', 1);
        $this->db->order_by('created', 'desc');
        $query = $this->db->get($this->table, $limit, $first);
        return $query->result_array();
    }
	public function users_banhang(){
        $this->db->where('trash', 1);
        $this->db->where('id !=', 1);
		$this->db->where('role !=', 1);
        $this->db->order_by('id', 'desc');
        $query = $this->db->get($this->table);
        return $query->result_array();
    }
    public function users_count(){
        $this->db->where('status', 1);
        $this->db->where('trash', 1);
        $query = $this->db->get($this->table);
        return count($query->result_array());
    }
    public function user_detail_id($id){
        $this->db->where('trash', 1);
        $this->db->where('id', $id);
        $query = $this->db->get($this->table);
        return $query->row_array();
    }

    //RECYCLEBIN
    public function user_trash($limit, $first){
        $this->db->where('trash',0);
        $query = $this->db->get($this->table, $limit, $first);
        return $query->result_array();
    }
	public function user_trash_id($id){
        $this->db->where('trash', 0);
        $this->db->where('id', $id);
        $query = $this->db->get($this->table);
        return $query->row_array();
    }
    public function user_trash_count(){
        $this->db->where('trash', 0);
        $query = $this->db->get($this->table);
        return count($query->result_array());
    }

    public function user_restore($id){
        $data=array('trash'=>1);
        $this->db->where('id',$id);
        $this->db->update($this->table, $data);
    }

    //
    public function user_insert($mydata){
        $this->db->insert($this->table,$mydata);
    }
    public function user_update($mydata, $id){
        $this->db->where('id',$id);
        $this->db->update($this->table, $mydata);
    }
    public function user_delete($id){
        $this->db->where('id',$id);
        $this->db->delete($this->table);
    }
    //header
    public function user_name($id){
        $this->db->where('trash',1);
        $this->db->where('status',1);
        $this->db->where('id',$id);
        $this->db->limit(1);
        $query = $this->db->get($this->table);
        $row=$query->row_array();
        return $row['fullname'];
    }
    //
    public function groupadmin_list()
    {
        $this->db->where('trash',1);
        $this->db->order_by('created', 'asc');
        $this->db->order_by('modified', 'desc');
        $query = $this->db->get('db_usergroup');
        return $query->result_array();
    }


    function user_detail_email($email){
        $this->db->where('email', $email);
        $this->db->where('status', 1);
        $this->db->where('trash', 1);
        $query = $this->db->get($this->table);
        return $query->row_array();
    }

    function user_detail_id_fg($id){
        $this->db->where('id', $id);
        $this->db->where('status', 1);
        $this->db->where('trash', 1);
        $query = $this->db->get($this->table);
        return $query->row_array();
    }

    // kiểm tra id cần lấy lại có đúng với mail ko
    function user_check_id_email($id, $email){
        $this->db->where('id', $id);
        $this->db->where('email', $email);
        $query = $this->db->get($this->table);
        if(count($query->result_array())==1){
            return $query->row_array();
        }else{
            return FALSE;
        }
    }

    public function user_update_fg($data,$id){
        $this->db->where('id',$id);
        $this->db->update($this->table, $data);
    }


	// Trang tìm kiếm
    public function doanhnghiep_search($name,$limit,$first){
        $this->db->like('fullname', $name);
        $this->db->where('trash', 1);
		$this->db->where('status', 1);
		$this->db->where('role !=', 1);
        $this->db->order_by('created', 'desc');
        $query = $this->db->get($this->table,$limit,$first);
        return $query->result_array();
    }

	public function doanhnghiep_search_count($name){
        $this->db->like('fullname', $name);
        $this->db->where('status', 1);
		$this->db->where('role !=', 1);
        $this->db->where('trash', 1);
        $this->db->order_by('created', 'desc');
        $query = $this->db->get($this->table);
        return count($query->result_array());
    }

	//Xóa
    public function user_delete_im($id,$name){
		$filename = $name;
		if (unlink("public/images/admin/$filename")) {
			echo 'The file ' . $filename . ' was deleted successfully!';
		} else {
			echo 'There was a error deleting the file ' . $filename;
		}
        $this->db->where('id',$id);
        $this->db->delete($this->table);
	}

	//5
	public function users_banhang_five(){
        $this->db->where('trash', 1);
        $this->db->where('id !=', 1);
		$this->db->where('role !=', 1);
		$this->db->limit(5);
        $this->db->order_by('id', 'desc');
        $query = $this->db->get($this->table);
        return $query->result_array();
    }
}