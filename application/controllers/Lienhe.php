<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Lienhe extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->data['com']='lienhe';
		$this->load->model('frontend/Mcategory');
		$this->load->model('frontend/Mproduct');
		$this->load->model('frontend/Mcontact');
		$this->load->model('frontend/Mproducer');
		$this->load->model('backend/Muser');
		$this->load->model('backend/Mmonhoc');
		$this->load->model('backend/Mcahoc');

	}

	public function index()
	{
		$d=getdate();
		$today=$d['year']."/".$d['mon']."/".$d['mday'];
		$this->load->library('form_validation');
		$this->form_validation->set_rules('fullname', 'Họ và tên','required' );
		// $this->form_validation->set_rules('email', 'email','required|valid_email' );
		$this->form_validation->set_rules('phone', 'Số điện thoại','required' );
		// $this->form_validation->set_rules('title', 'tiêu đề','required' );
		$this->form_validation->set_rules('content', 'nội dụng','required' );
		$mon = "" ;
		$ca = "" ;
		if($this->form_validation->run()==TRUE){

			if(!empty($_POST['monId'])){
				$monhoc = $this->Mmonhoc->monhoc_detail($_POST['monId']);
				$mon = $monhoc['name'];
			}
			if(!empty($_POST['caId'])){
				$cahoc = $this->Mcahoc->cahoc_detail($_POST['caId']);
				$ca = $cahoc['name'];
			}
			if(empty($_POST['title'])){
				$_POST['title'] = "Đăng kí học thử";
			}
			echo "<pre>---In ra---\n".print_r($_POST)."</pre>";
			$mydata=array(
				'fullname'=>$_POST['fullname'],
				'email'=>$_POST['email'],
				'phone'=>$_POST['phone'],
				'title'=>$_POST['title'],
				'cahoc' =>"Môn: ".$mon." Ca: ".$ca,
				'content'=>$_POST['content'],
				'created_at'=> $today
			);
			$this->Mcontact->contact_insert($mydata);
			$this->session->set_flashdata('success', 'Chúng tôi sẽ liên hệ với bạn sớm nhất !');
		}
		$this->data['title']="TEMPO  - Liên hệ";
		$this->data['view']='index';
		$this->load->view('frontend/layout',$this->data);
	}


	public function questions()
	{
		$this->data['title']="TEMPO  - Liên hệ";
		$this->data['view']='questions';
		$this->load->view('frontend/layout',$this->data);
	}
	public function dieukhoanthamgia()
	{
		$this->data['title']="TEMPO  - Liên hệ";
		$this->data['view']='dieukhoanthamgia';
		$this->load->view('frontend/layout',$this->data);
	}
	public function chinhsachbaomat()
	{
		$this->data['title']="TEMPO  - Liên hệ";
		$this->data['view']='chinhsachbaomat';
		$this->load->view('frontend/layout',$this->data);
	}
}

