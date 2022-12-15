<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Monhoc extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
        $this->load->model('backend/Mmonhoc');
        $this->load->model('backend/Muser');
        $this->load->model('backend/Mproduct');
        $this->load->model('backend/Morders');
		if(!$this->session->userdata('sessionadmin'))
		{
			redirect('admin/user/login','refresh');
		}
		$this->data['user']=$this->session->userdata('sessionadmin');
		$this->data['com']='monhoc';
	}

	public function index()
	{
		$this->load->library('phantrang');
		$this->load->library('alias');
		$limit=10;
		$current=$this->phantrang->PageCurrent();
		$first=$this->phantrang->PageFirst($limit, $current);
		$total=$this->Mmonhoc->monhoc_count();
		$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='admin/monhoc');
		$this->data['list']=$this->Mmonhoc->monhoc_all($limit,$first);
		$this->data['view']='index';
		$this->data['title']='Môn học';
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
		$this->form_validation->set_rules('name', 'Môn học', 'required|is_unique[db_monhoc.name]|max_length[25]');
		if ($this->form_validation->run() == TRUE)
		{
			$mydata= array(
				'name' =>$_POST['name'],
				'status' =>$_POST['status'],
				'created_at' =>$today,
				'trash'=>1
			);
			$this->Mmonhoc->monhoc_insert($mydata);
			$this->session->set_flashdata('success', 'Thêm danh mục thành công');
			redirect('admin/monhoc','refresh');
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
		$this->data['row']=$this->Mmonhoc->monhoc_detail($id);
		$d=getdate();
		$today=$d['year']."/".$d['mon']."/".$d['mday']." ".$d['hours'].":".$d['minutes'].":".$d['seconds'];
		$this->load->library('alias');
		$this->load->library('form_validation');
		$this->form_validation->set_rules('name', 'Tên môn học', 'required|max_length[25]');
		if ($this->form_validation->run() == TRUE)
		{
			$mydata= array(
				'name' =>$_POST['name'],
				'status' =>$_POST['status'],
				'updated_at' =>$today,
				'trash'=>1
			);
			$this->Mmonhoc->monhoc_update($mydata, $id);
			$this->session->set_flashdata('success', 'Cập nhật danh mục thành công');
			redirect('admin/monhoc','refresh');
		}
		$this->data['view']='update';
		$this->data['title']='Cập nhật danh mục';
		$this->load->view('backend/layout', $this->data);
	}

	public function status($id)
	{
		$row=$this->Mmonhoc->monhoc_detail($id);
		$status=($row['status']==1)?0:1;
		$mydata= array('status' => $status);
		$this->Mmonhoc->monhoc_update($mydata, $id);
		$this->session->set_flashdata('success', 'Cập nhật Môn học thành công');
		redirect('admin/monhoc','refresh');
	}

	public function trash($id)
	{
		$mydata= array('trash' => 0);
		$this->Mmonhoc->monhoc_update($mydata, $id);
		$this->session->set_flashdata('success', 'Xóa Môn học vào thùng rác thành công');
		redirect('admin/monhoc','refresh');
		// $row = $this->Mmonhoc->monhoc_detail($id);
		// $count_product = $this->Mproduct->product_count_parentid($row['id']);
		// $count_monhoc = $this->Mmonhoc->monhoc_count_parentid($row['id']);
		// if($count_product > 0)
		// {
		// 	$this->session->set_flashdata('error', 'Danh mục này còn sản phẩm bên trong! Hãy xóa sản phẩm trước !');
		// 	redirect('admin/monhoc','refresh');
		// }
		// else
		// {
		// 	if($count_monhoc > 0)
		// 	{
		// 		$this->session->set_flashdata('error', 'Danh mục này còn danh mục con bên trong! Không thể thực hiện !');
		// 		redirect('admin/monhoc','refresh');
		// 	}
		// 	else
		// 	{
		// 		$mydata= array('trash' => 0);
		// 		$this->Mmonhoc->monhoc_update($mydata, $id);
		// 		$this->session->set_flashdata('success', 'Xóa Môn học vào thùng rác thành công');
		// 		redirect('admin/monhoc','refresh');
		// 	}
		// }
	}

	public function recyclebin()
	{
		$this->load->library('phantrang');
		$limit=10;
		$current=$this->phantrang->PageCurrent();
		$first=$this->phantrang->PageFirst($limit, $current);
		$total=$this->Mmonhoc->monhoc_trash_count();
		$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='admin/monhoc/recyclebin');
		$this->data['list']=$this->Mmonhoc->monhoc_trash($limit, $first);
		$this->data['view']='recyclebin';
		$this->data['title']='Thùng rác Môn học';
		$this->load->view('backend/layout', $this->data);
	}
	public function restore($id)
	{
		$this->Mmonhoc->monhoc_restore($id);
		$this->session->set_flashdata('success', 'Khôi phục Môn học thành công');
		redirect('admin/monhoc/recyclebin','refresh');
	}

	public function delete($id)
	{
		$this->Mmonhoc->monhoc_delete($id);
		$this->session->set_flashdata('success', 'Xóa Môn học thành công');
		redirect('admin/monhoc/recyclebin','refresh');
	}

}
