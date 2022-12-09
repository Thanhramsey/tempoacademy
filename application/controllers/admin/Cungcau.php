<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Cungcau extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model('backend/Mproducer');
        $this->load->model('backend/Muser');
        $this->load->model('backend/Morders');
		$this->load->model('backend/Mcungcau');
		if(!$this->session->userdata('sessionadmin')){
			redirect('admin/user/login','refresh');
		}
		$this->data['user']=$this->session->userdata('sessionadmin');
		$this->data['com']='cungcau';
	}

	public function index(){
		$this->load->library('phantrang');
		$limit=10;
		$current=$this->phantrang->PageCurrent();
		$first=$this->phantrang->PageFirst($limit, $current);
		$total=$this->Mcungcau->cungcau_count();
		$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='admin/cungcau');
		$this->data['list']=$this->Mcungcau->cungcau_all($limit,$first);
		$this->data['view']='index';
		$this->data['title']='Danh sách cung cầu ';
		$this->load->view('backend/layout', $this->data);
	}

	public function status($id){
		$row=$this->Mcungcau->cungcau_detail($id);
		$status=($row['status']==1)?0:1;
		$mydata= array('status' => $status);
		$this->Mcungcau->cungcau_update($mydata, $id);
		$this->session->set_flashdata('success', 'Cập nhật thành công');
		redirect('admin/cungcau/','refresh');
	}

	public function recyclebin(){
		$this->load->library('phantrang');
		$limit=10;
		$current=$this->phantrang->PageCurrent();
		$first=$this->phantrang->PageFirst($limit, $current);
		$total=$this->Mcungcau->cungcau_trash_count();
		$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='admin/cungcau/recyclebin');
		$this->data['list']=$this->Mcungcau->cungcau_trash($limit, $first);
		$this->data['view']='recyclebin';
		$this->data['title']='Thùng rác chính sách';
		$this->load->view('backend/layout', $this->data);
	}

	public function trash($id){
		$mydata= array('trash' => 0);
		$this->Mcungcau->cungcau_update($mydata, $id);
		$this->session->set_flashdata('success', 'Xóa vào thùng rác thành công');
		redirect('admin/cungcau','refresh');
	}

	public function restore($id)
	{
		$this->Mcungcau->cungcau_restore($id);
		$this->session->set_flashdata('success', 'Khôi phục thành công');
		redirect('admin/cungcau/recyclebin','refresh');
	}
	public function delete($id)
	{
		$row=$this->Mcungcau->cungcau_delete_detail($id);
		$this->Mcungcau->cungcau_delete($row['id']);
		$this->session->set_flashdata('success', 'Xóa thành công');
		redirect('admin/cungcau/recyclebin','refresh');
	}

}
