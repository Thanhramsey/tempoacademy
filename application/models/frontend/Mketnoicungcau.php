<?php
class Mketnoicungcau extends CI_Model {
    public function __construct()
    {
        parent::__construct();
        $this->table = $this->db->dbprefix('ketnoicungcau');
    }

	//index
    public function cungcau_all($limit, $first){
        $this->db->where('trash', 1);
		$this->db->where('status', 1);
        $this->db->order_by('ngaydang', 'desc');
        $query = $this->db->get($this->table, $limit, $first);
        return $query->result_array();
    }

	public function cungcau_all_count(){
        $this->db->where('status', 1);
        $this->db->where('trash', 1);
        $query = $this->db->get($this->table);
        return count($query->result_array());
    }


	//cungcau
    public function cungcau_list($limit, $first,$type){
        $this->db->where('trash', 1);
		$this->db->where('status', 1);
		$this->db->where('type', $type);
        $this->db->order_by('ngaydang', 'desc');
        $query = $this->db->get($this->table, $limit, $first);
		// $query = $this->db->get($this->table);

        return $query->result_array();
    }

	public function cungcau_list_count($type){
        $this->db->where('status', 1);
        $this->db->where('trash', 1);
		$this->db->where('type', $type);
        $query = $this->db->get($this->table);
        return count($query->result_array());
    }

	public function cungcau_detail($id){
        $this->db->where('trash', 1);
        $this->db->where('id', $id);
        $query = $this->db->get($this->table);
        return $query->row_array();
    }


	public function tangview($mydata,$id){
        $this->db->where('id',$id);
        $this->db->update($this->table, $mydata);
    }

	public function cungcau_insert($mydata)
	{
		$this->db->insert($this->table,$mydata);
	}


	public function cungcau_timkiem_count($loaicungcau,$loaisp,$keyword){
			if($keyword !=""){
				$this->db->like('tieude', $keyword);
			}
			if($loaicungcau !=""){
				$this->db->like('type', $loaicungcau);
			}
			if($loaisp !=""){
				$this->db->like('catid', $loaisp);
			}
			$this->db->where('trash', 1);
			$this->db->where('status', 1);
			$query = $this->db->get($this->table);
			return count($query->result_array());
	}

	public function cungcau_timkiem($limit, $first,$loaicungcau,$loaisp,$keyword){
		if($keyword !=""){
			$this->db->like('tieude', $keyword);
		}
		if($loaicungcau !=""){
			$this->db->like('type', $loaicungcau);
		}
		if($loaisp !=""){
			$this->db->like('catid', $loaisp);
		}
		$this->db->where('trash', 1);
		$this->db->where('status', 1);
		$this->db->order_by('ngaydang', 'desc');
		$query = $this->db->get($this->table,$limit, $first);
		return $query->result_array();
	}
}