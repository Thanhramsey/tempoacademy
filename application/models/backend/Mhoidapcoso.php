<?php
class Mhoidapcoso extends CI_Model {
        public function __construct()
        {
                parent::__construct();
                $this->table = $this->db->dbprefix('hoidapcoso');
        }


		public function answer_insert($mydata)
        {
                $this->db->insert($this->table,$mydata);
        }

		public function hoidap_all($limit, $first){
			$this->db->where('trash', 1);
			$this->db->order_by('question_time', 'desc');
			$query = $this->db->get($this->table, $limit, $first);
			return $query->result_array();
		}

		public function hoidap_count(){
			$this->db->where('status', 1);
			$this->db->where('trash', 1);
			$query = $this->db->get($this->table);
			return count($query->result_array());
		}

		//ById

		public function hoidap_byId($userId,$limit, $first){
			$this->db->where('producer_id', $userId);
			$this->db->where('trash', 1);
			$this->db->order_by('question_time', 'desc');
			$query = $this->db->get($this->table, $limit, $first);
			return $query->result_array();
		}

		public function hoidap_byId_2($userId){
			$this->db->where('producer_id', $userId);
			$this->db->where('trash', 1);
			$this->db->order_by('question_time', 'desc');
			$query = $this->db->get($this->table);
			return $query->result_array();
		}


		public function hoidap_count_byId($userId){
			$this->db->where('producer_id', $userId);
			$this->db->where('status', 1);
			$this->db->where('trash', 1);
			$query = $this->db->get($this->table);
			return count($query->result_array());
		}

		public function hoidap_trash_count(){
			$this->db->where('trash', 0);
			$query = $this->db->get($this->table);
			return count($query->result_array());
		}

		 //Cập nhật
		 public function hoidap_update($mydata,$id){
			$this->db->where('id',$id);
			$this->db->update($this->table, $mydata);
		}

		//detail
		public function hoidap_detail($id){
			$this->db->where('trash', 1);
			$this->db->where('id', $id);
			$query = $this->db->get($this->table);
			return $query->row_array();
		}

		//detail
		public function hoidap_delete_detail($id){
			$this->db->where('id', $id);
			$query = $this->db->get($this->table);
			return $query->row_array();
		}

		public function hoidap_trash($limit, $first){
			$this->db->where('trash',0);
			$query = $this->db->get($this->table, $limit, $first);
			return $query->result_array();
		}

		public function hoidap_restore($id){
			$data=array('trash'=>1);
			$this->db->where('id',$id);
			$this->db->update($this->table, $data);
		}
		 //Thêm
		public function hoidap_insert($mydata){
			$this->db->insert($this->table,$mydata);
		}
		//Xóa
		public function hoidap_delete($id,$name){
			$this->db->where('id',$id);
			$this->db->delete($this->table);
		}
}