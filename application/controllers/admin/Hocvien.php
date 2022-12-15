<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Hocvien extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
        $this->load->model('backend/Mhocvien');
        $this->load->model('backend/Muser');
        $this->load->model('backend/Morders');
		$this->load->model('backend/Mmonhoc');
		$this->load->model('backend/Mcahoc');
		if(!$this->session->userdata('sessionadmin'))
		{
			redirect('admin/user/login','refresh');
		}
		$this->data['user']=$this->session->userdata('sessionadmin');
		$this->data['com']='hocvien';
	}

	public function index()
	{
		$this->load->library('phantrang');
		$this->load->library('alias');
		$limit=10;
		$current=$this->phantrang->PageCurrent();
		$first=$this->phantrang->PageFirst($limit, $current);
		$loaisp = "";
		if(!empty($_POST['loaisp'])){
			$loaisp = $_POST['loaisp'];
		}
		$total=$this->Mhocvien->hocvien_count($loaisp);
		$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='admin/hocvien');
		$this->data['list']=$this->Mhocvien->hocvien_all($limit,$first,$loaisp);
		$this->data['view']='index';
		$this->data['title']='Học viên';
		$this->load->view('backend/layout', $this->data);
	}

	public function insert()
	{
		$user_role=$this->session->userdata('sessionadmin');
		if($user_role['role']==2){
			redirect('admin/E403/index','refresh');
		}
		$d=getdate();
		$this->load->library('alias');
		$this->load->library('form_validation');
		$today=$d['year']."/".$d['mon']."/".$d['mday']." ".$d['hours'].":".$d['minutes'].":".$d['seconds'];
		$this->form_validation->set_rules('name', 'Học viên', 'required|is_unique[db_hocvien.name]|max_length[25]');
		// $this->form_validation->set_rules('thoigian', 'Thời gian', 'required');
		$this->form_validation->set_rules('monId', 'Môn', 'required');
		if ($this->form_validation->run() == TRUE)
		{
			$mydata= array(
				'name' =>$_POST['name'],
				'monId' =>$_POST['monId'],
				'startTime' =>$_POST['startTime'],
				'endTime' =>$_POST['endTime'],
				'status' =>$_POST['status'],
				'created_at' =>$today,
				'trash'=>1
			);
			$this->Mhocvien->hocvien_insert($mydata);
			$this->session->set_flashdata('success', 'Thêm danh mục thành công');
			redirect('admin/hocvien','refresh');
		}
		else
		{
			$this->data['view']='insert';
			$this->data['title']='Thêm danh mục mới';
			$this->load->view('backend/layout', $this->data);
		}
	}

	public function update($id)
	{
		$user_role=$this->session->userdata('sessionadmin');
		if($user_role['role']==2){
			redirect('admin/E403/index','refresh');
		}
		$this->data['row']=$this->Mhocvien->hocvien_detail($id);
		$d=getdate();
		$today=$d['year']."/".$d['mon']."/".$d['mday']." ".$d['hours'].":".$d['minutes'].":".$d['seconds'];
		$this->load->library('alias');
		$this->load->library('form_validation');
		$this->form_validation->set_rules('name', 'Học viên', 'required');
		// $this->form_validation->set_rules('thoigian', 'Thời gian', 'required');
		$this->form_validation->set_rules('monId', 'Môn', 'required');
		if ($this->form_validation->run() == TRUE)
		{
			$mydata= array(
				'name' =>$_POST['name'],
				'monId' =>$_POST['monId'],
				'startTime' =>$_POST['startTime'],
				'endTime' =>$_POST['endTime'],
				'status' =>$_POST['status'],
				'updated_at' =>$today,
				'trash'=>1
			);
			$this->Mhocvien->hocvien_update($mydata, $id);
			$this->session->set_flashdata('success', 'Cập nhật danh mục thành công');
			redirect('admin/hocvien','refresh');
		}
		$this->data['view']='update';
		$this->data['title']='Cập nhật danh mục';
		$this->load->view('backend/layout', $this->data);
	}

	public function status($id)
	{
		$row=$this->Mhocvien->hocvien_detail($id);
		$status=($row['status']==1)?0:1;
		$mydata= array('status' => $status);
		$this->Mhocvien->hocvien_update($mydata, $id);
		$this->session->set_flashdata('success', 'Cập nhật Học viên thành công');
		redirect('admin/hocvien','refresh');
	}

	public function trash($id)
	{
		$mydata= array('trash' => 0);
		$this->Mhocvien->hocvien_update($mydata, $id);
		$this->session->set_flashdata('success', 'Xóa Học viên vào thùng rác thành công');
		redirect('admin/hocvien','refresh');
		// $row = $this->Mhocvien->hocvien_detail($id);
		// $count_product = $this->Mproduct->product_count_parentid($row['id']);
		// $count_hocvien = $this->Mhocvien->hocvien_count_parentid($row['id']);
		// if($count_product > 0)
		// {
		// 	$this->session->set_flashdata('error', 'Danh mục này còn sản phẩm bên trong! Hãy xóa sản phẩm trước !');
		// 	redirect('admin/hocvien','refresh');
		// }
		// else
		// {
		// 	if($count_hocvien > 0)
		// 	{
		// 		$this->session->set_flashdata('error', 'Danh mục này còn danh mục con bên trong! Không thể thực hiện !');
		// 		redirect('admin/hocvien','refresh');
		// 	}
		// 	else
		// 	{
		// 		$mydata= array('trash' => 0);
		// 		$this->Mhocvien->hocvien_update($mydata, $id);
		// 		$this->session->set_flashdata('success', 'Xóa Học viên vào thùng rác thành công');
		// 		redirect('admin/hocvien','refresh');
		// 	}
		// }
	}

	public function recyclebin()
	{
		$this->load->library('phantrang');
		$limit=10;
		$current=$this->phantrang->PageCurrent();
		$first=$this->phantrang->PageFirst($limit, $current);
		$total=$this->Mhocvien->hocvien_trash_count();
		$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='admin/hocvien/recyclebin');
		$this->data['list']=$this->Mhocvien->hocvien_trash($limit, $first);
		$this->data['view']='recyclebin';
		$this->data['title']='Thùng rác Học viên';
		$this->load->view('backend/layout', $this->data);
	}
	public function restore($id)
	{
		$this->Mhocvien->hocvien_restore($id);
		$this->session->set_flashdata('success', 'Khôi phục Học viên thành công');
		redirect('admin/hocvien/recyclebin','refresh');
	}

	public function delete($id)
	{
		$this->Mhocvien->hocvien_delete($id);
		$this->session->set_flashdata('success', 'Xóa Học viên thành công');
		redirect('admin/hocvien/recyclebin','refresh');
	}

}
