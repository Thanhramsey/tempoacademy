<?php
class Mhoidapcoso extends CI_Model {
        public function __construct()
        {
                parent::__construct();
                $this->table = $this->db->dbprefix('hoidapcoso');
        }


		public function question_insert($mydata)
        {
                $this->db->insert($this->table,$mydata);
        }


		public function hoidap_all()
        {
                $this->db->order_by('question_time', 'asc');
				$this->db->where('trash', 1);
				$this->db->where('status', 1);
                $query = $this->db->get($this->table);
                return $query->result_array();
        }
		public function hoidap_byId($userId,$type){
			$this->db->where('producer_id', $userId);
			$this->db->where('type', $type);
			$this->db->where('trash', 1);
			$this->db->where('status', 1);
			$this->db->order_by('question_time', 'desc');
			$query = $this->db->get($this->table);
			return $query->result_array();
		}

}