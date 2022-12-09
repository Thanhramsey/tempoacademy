<?php
class Mevaluate extends CI_Model {
        public function __construct()
        {
                parent::__construct();
                $this->table = $this->db->dbprefix('evaluate');
        }

        public function comment_productid($id)
        {
                $this->db->where('product_id', $id);
                $this->db->order_by('id', 'asc');
                $query = $this->db->get($this->table);
                return $query->result_array();
        }

		public function comment_productid_2($id, $limit, $first){
			$this->db->where('product_id', $id);
			$this->db->order_by('id', 'asc');
			$query = $this->db->get($this->table, $limit, $first);
			return $query->result_array();
		}
		public function comment_insert($mydata)
        {
                $this->db->insert($this->table,$mydata);
        }

		public function comment_productid_count($id)
        {
				$this->db->select('star, COUNT(id) as total');
                $this->db->where('product_id', $id);
				$this->db->group_by('star');
				$this->db->order_by('total', 'desc');
                $query = $this->db->get($this->table);
                return $query->result_array();

        }

		public function comment_productid_count_2($id)
        {
                $this->db->where('product_id', $id);
                $this->db->order_by('id', 'asc');
                $query = $this->db->get($this->table);
                return count($query->result_array());
        }
		//Xóa
		public function get_comment($id){
			$this->db->where('id',$id);
			$this->db->limit(1);
			$query = $this->db->get($this->table);
			$row=$query->row_array();
			return $row['product_id'];
		}

		 //Xóa
		 public function comment_delete($id){
			$this->db->where('id',$id);
			$this->db->delete($this->table);
		}

}