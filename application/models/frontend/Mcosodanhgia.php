<?php
class Mcosodanhgia extends CI_Model {
        public function __construct()
        {
                parent::__construct();
                $this->table = $this->db->dbprefix('cosodanhgia');
        }


		public function comment_insert($mydata)
        {
                $this->db->insert($this->table,$mydata);
        }

		public function hoidap_all()
        {
                $this->db->order_by('question_time', 'asc');
                $query = $this->db->get($this->table);
                return $query->result_array();
        }


		public function comment_producerid_count($id)
        {
				$this->db->select('star, COUNT(id) as total');
                $this->db->where('producer_id', $id);
				$this->db->group_by('star');
				$this->db->order_by('total', 'desc');
                $query = $this->db->get($this->table);
                return $query->result_array();

        }
}