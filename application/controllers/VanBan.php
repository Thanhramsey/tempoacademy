<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Vanban extends CI_Controller {

	function __construct()
	{
		parent::__construct();
		$this->data['com']='Vanban';
		$this->load->model('frontend/Mcategory');
		$this->load->model('frontend/Mproduct');
		$this->load->model('frontend/Mcontact');
		$this->load->model('frontend/Mproducer');
		$this->load->model('backend/Muser');
		$this->load->model('frontend/Mchinhsach');

	}

	public function index()
	{
		$this->load->library('phantrang');
		$limit=10;
		$current=$this->phantrang->PageCurrent();
		$first=$this->phantrang->PageFirst($limit, $current);
		$total=$this->Mchinhsach->chinhsach_count();
		$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='van-ban');
		$this->data['list']=$this->Mchinhsach->chinhsach_all($limit,$first);
		$this->data['title']="TEMPO  - Liên hệ";
		$this->data['view']='index';
		$this->load->view('frontend/layout',$this->data);
	}


}

