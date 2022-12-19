<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('backend/Mproduct');
		$this->load->model('backend/Mcategory');
		$this->load->model('backend/Mcontent');
		$this->load->model('backend/Mcustomer');
		$this->load->model('backend/Muser');
		$this->load->model('backend/Morders');
		$this->load->model('backend/Morderdetail');
		if(!$this->session->userdata('sessionadmin'))
		{
			redirect('admin/user/login','refresh');
		}
		$this->data['user']=$this->session->userdata('sessionadmin');
		$this->data['com']='dashboard';
	}

	public function index()
	{
		$user_role = $this->session->userdata('sessionadmin');
		$userId = $this->session->userdata('id');
		$this->data['total1'] = 0;
		$this->data['total2'] = 0;
		$this->data['total3'] = 0;
		$this->data['total4'] = 0;
		if ($user_role['role'] == 1) {
			$this->data['total1']=$this->Mproduct->product_sanpham_count("","");
			$this->data['total2']=$this->Mcontent->content_count();
			$this->data['total3']=$this->Mcustomer->customer_count();
			$this->data['total4']=$this->Morders->orders_count();
		} else {
			$this->data['total1']=$this->Mproduct->product_sanpham_byId_count($userId,"","");
			$this->data['total2']=$this->Mcontent->content_count();
			$this->data['total3']=$this->Mcustomer->customer_count();
			$this->data['total4']=$this->Morders->orders_listorders_byId_count($userId);
		}

		//Thống kê - vẽ biểu đồ

		$this->data['view']='index';
		$this->data['title']='Hệ thống quản lý OCCP- ';
		$this->load->view('backend/layout', $this->data);
	}

}

/* End of file Dashboard.php */
/* Location: ./application/controllers/Dashboard.php */