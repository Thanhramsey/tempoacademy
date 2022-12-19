<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Trangchu extends CI_Controller {
	// Hàm khởi tạo
    function __construct() {
        parent::__construct();
        $this->load->model('frontend/Mproduct');
        $this->load->model('frontend/Mcategory');
        $this->load->model('frontend/Mslider');
        $this->load->model('frontend/Mcontent');
        $this->load->model('frontend/Mslider');
		$this->load->model('frontend/Mproducer');
		$this->load->model('frontend/Mproducer');
		$this->load->model('backend/Muser');
        $this->data['com']='trangchu';
    }

	public function index()
	{
		$this->data['option']= 0;
        $this->data['title']='TEMPO';
        $this->data['view']='index';
		$this->load->view('frontend/layout',$this->data);
	}
}
