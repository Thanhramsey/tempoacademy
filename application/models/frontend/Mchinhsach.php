<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mchinhsach extends CI_Model {

	public function __construct(){
        parent::__construct();
        $this->table = $this->db->dbprefix('chinhsach');
    }
    //index
    public function chinhsach_all($limit, $first){
        $this->db->where('trash', 1);
        $this->db->order_by('created_at', 'desc');
        $query = $this->db->get($this->table, $limit, $first);
        return $query->result_array();
    }

    public function chinhsach_count(){
        $this->db->where('status', 1);
        $this->db->where('trash', 1);
        $query = $this->db->get($this->table);
        return count($query->result_array());
    }
    //detail
    public function chinhsach_detail($id){
        $this->db->where('trash', 1);
        $this->db->where('id', $id);
        $query = $this->db->get($this->table);
        return $query->row_array();
    }
	//detail
    public function chinhsach_delete_detail($id){
        $this->db->where('id', $id);
        $query = $this->db->get($this->table);
        return $query->row_array();
    }
    //RECYCLEBIN
    public function chinhsach_trash_count(){
        $this->db->where('trash', 0);
        $query = $this->db->get($this->table);
        return count($query->result_array());
    }

    public function chinhsach_trash($limit, $first){
        $this->db->where('trash',0);
        $query = $this->db->get($this->table, $limit, $first);
        return $query->result_array();
    }

    public function chinhsach_restore($id){
        $data=array('trash'=>1);
        $this->db->where('id',$id);
        $this->db->update($this->table, $data);
    }
     //Thêm
    public function chinhsach_insert($mydata){
        $this->db->insert($this->table,$mydata);
    }

    //Cập nhật
    public function chinhsach_update($mydata,$id){
        $this->db->where('id',$id);
        $this->db->update($this->table, $mydata);
    }

    //Xóa
    public function chinhsach_delete($id,$name){
		$filename = $name;
		if (unlink("public/images/chinhsach/$filename")) {
			echo 'The file ' . $filename . ' was deleted successfully!';
		} else {
			echo 'There was a error deleting the file ' . $filename;
		}
        $this->db->where('id',$id);
        $this->db->delete($this->table);
	}
}