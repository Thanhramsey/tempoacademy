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

	}

	public function index()
	{
		$d=getdate();
		$today=$d['year']."/".$d['mon']."/".$d['mday'];
		$this->load->library('form_validation');
		$this->form_validation->set_rules('fullname', 'Họ và tên','required' );
		$this->form_validation->set_rules('email', 'email','required|valid_email' );
		$this->form_validation->set_rules('phone', 'Số điện thoại','required' );
		$this->form_validation->set_rules('title', 'tiêu đề','required' );
		$this->form_validation->set_rules('content', 'nội dụng','required' );
		if($this->form_validation->run()==TRUE){
			$mydata=array(
				'fullname'=>$_POST['fullname'],
				'email'=>$_POST['email'],
				'phone'=>$_POST['phone'],
				'title'=>$_POST['title'],
				'content'=>$_POST['content'],
				'created_at'=> $today
			);
			$this->Mcontact->contact_insert($mydata);
		}
		$this->data['title']="OCOP CHƯPƯH - Liên hệ";
		$this->data['view']='index';
		$this->load->view('frontend/layout',$this->data);
	}


	public function questions()
	{
		$this->data['title']="OCOP CHƯPƯH - Liên hệ";
		$this->data['view']='questions';
		$this->load->view('frontend/layout',$this->data);
	}
	public function dieukhoanthamgia()
	{
		$this->data['title']="OCOP CHƯPƯH - Liên hệ";
		$this->data['view']='dieukhoanthamgia';
		$this->load->view('frontend/layout',$this->data);
	}
	public function chinhsachbaomat()
	{
		$this->data['title']="OCOP CHƯPƯH - Liên hệ";
		$this->data['view']='chinhsachbaomat';
		$this->load->view('frontend/layout',$this->data);
	}
}

