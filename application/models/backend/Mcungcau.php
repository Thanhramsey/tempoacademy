<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mcungcau extends CI_Model {

	public function __construct(){
        parent::__construct();
        $this->table = $this->db->dbprefix('ketnoicungcau');
    }
    //index
    public function cungcau_all($limit, $first){
        $this->db->where('trash', 1);
        $this->db->order_by('ngaydang', 'desc');
        $query = $this->db->get($this->table, $limit, $first);
        return $query->result_array();
    }

    public function cungcau_count(){
        $this->db->where('status', 1);
        $this->db->where('trash', 1);
        $query = $this->db->get($this->table);
        return count($query->result_array());
    }
    //detail
    public function cungcau_detail($id){
        $this->db->where('trash', 1);
        $this->db->where('id', $id);
        $query = $this->db->get($this->table);
        return $query->row_array();
    }
	//detail
    public function cungcau_delete_detail($id){
        $this->db->where('id', $id);
        $query = $this->db->get($this->table);
        return $query->row_array();
    }
    //RECYCLEBIN
    public function cungcau_trash_count(){
        $this->db->where('trash', 0);
        $query = $this->db->get($this->table);
        return count($query->result_array());
    }

    public function cungcau_trash($limit, $first){
        $this->db->where('trash',0);
        $query = $this->db->get($this->table, $limit, $first);
        return $query->result_array();
    }

    public function cungcau_restore($id){
        $data=array('trash'=>1);
        $this->db->where('id',$id);
        $this->db->update($this->table, $data);
    }
     //Thêm
    public function cungcau_insert($mydata){
        $this->db->insert($this->table,$mydata);
    }

    //Cập nhật
    public function cungcau_update($mydata,$id){
        $this->db->where('id',$id);
        $this->db->update($this->table, $mydata);
    }

    //Xóa
    public function cungcau_delete($id,$name){
        $this->db->where('id',$id);
        $this->db->delete($this->table);
	}
}