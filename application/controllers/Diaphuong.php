<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Diaphuong extends CI_Controller {
    function __construct() {
        parent::__construct();
        $this->load->model('frontend/Mproduct');
		$this->load->model('frontend/Mproducer');
        $this->load->model('frontend/Mcategory');
		$this->load->model('frontend/Mevaluate');
		$this->load->model('backend/Muser');
        $this->data['com']='diaphuong';
        $this->load->library('session');
        $this->load->library('phantrang');
    }

    public function detail($id){
		$row = $this->Mproducer->producer_detail($id);
        $total=$this->Mproduct->product_sanpham_xaid_count($row['id']);
		$sp=$this->Mproduct->product_sanpham_xaid($row['id']);
		$this->data['row']=$row;
		$this->data['total']=$total;
		$this->data['sp']=$sp;
        $this->data['title']='TEMPO  - Giới thiệu';
        $this->data['view']='detail';
		$this->load->view('frontend/layout',$this->data);
	}
}
