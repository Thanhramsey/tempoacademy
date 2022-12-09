<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Hoidap extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model('backend/Mproducer');
        $this->load->model('backend/Muser');
        $this->load->model('backend/Morders');
		$this->load->model('backend/Mhoidapcoso');
		if(!$this->session->userdata('sessionadmin')){
			redirect('admin/user/login','refresh');
		}
		$this->data['user']=$this->session->userdata('sessionadmin');
		$this->data['com']='hoidap';
	}

	public function index(){
		$this->load->library('phantrang');
		$limit=10;
		$current=$this->phantrang->PageCurrent();
		$first=$this->phantrang->PageFirst($limit, $current);
		$user_role = $this->session->userdata('sessionadmin');

		if ($user_role['role'] == 1) {
			$total=$this->Mhoidapcoso->hoidap_count();
			$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='admin/hoidap');
			$this->data['list']=$this->Mhoidapcoso->hoidap_all($limit,$first);
		} else {
			$userId = $this->session->userdata('id');
			$total=$this->Mhoidapcoso->hoidap_count_byId($userId);
			$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='admin/hoidap');
			$this->data['list']=$this->Mhoidapcoso->hoidap_byId($userId,$limit,$first);
		}
		$this->data['view']='index';
		$this->data['title']='Danh sách cung cầu ';
		$this->load->view('backend/layout', $this->data);
	}

	public function status($id){
		$row=$this->Mhoidapcoso->hoidap_detail($id);
		$status=($row['status']==1)?0:1;
		$mydata= array('status' => $status);
		$this->Mhoidapcoso->hoidap_update($mydata, $id);
		$this->session->set_flashdata('success', 'Cập nhật thành công');
		redirect('admin/hoidap/','refresh');
	}

	public function recyclebin(){
		$this->load->library('phantrang');
		$limit=10;
		$current=$this->phantrang->PageCurrent();
		$first=$this->phantrang->PageFirst($limit, $current);
		$total=$this->Mhoidapcoso->hoidap_trash_count();
		$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='admin/hoidap/recyclebin');
		$this->data['list']=$this->Mhoidapcoso->hoidap_trash($limit, $first);
		$this->data['view']='recyclebin';
		$this->data['title']='Thùng rác chính sách';
		$this->load->view('backend/layout', $this->data);
	}

	public function trash($id){
		$mydata= array('trash' => 0);
		$this->Mhoidapcoso->hoidap_update($mydata, $id);
		$this->session->set_flashdata('success', 'Xóa vào thùng rác thành công');
		redirect('admin/hoidap','refresh');
	}

	public function restore($id)
	{
		$this->Mhoidapcoso->hoidap_restore($id);
		$this->session->set_flashdata('success', 'Khôi phục thành công');
		redirect('admin/hoidap/recyclebin','refresh');
	}
	public function delete($id)
	{
		$row=$this->Mhoidapcoso->hoidap_delete_detail($id);
		$this->Mhoidapcoso->hoidap_delete($row['id']);
		$this->session->set_flashdata('success', 'Xóa thành công');
		redirect('admin/hoidap/recyclebin','refresh');
	}


	public function update($id){
		$this->data['row']=$this->Mhoidapcoso->hoidap_detail($id);
		$d=getdate();
		$today=$d['year']."/".$d['mon']."/".$d['mday']." ".$d['hours'].":".$d['minutes'].":".$d['seconds'];
		$this->load->library('form_validation');
		$this->load->library('session');
		$this->load->library('alias');
		$this->form_validation->set_rules('answer', 'Câu trả lời', 'required');
		$info  = $this->session->userdata('sessionadmin');
		if ($this->form_validation->run() == TRUE) {
			$mydata= array(
				'answer' =>$_POST['answer'],
				'answer_by' =>$info['fullname'],
				'answer_time' =>$today,
			);
			$this->Mhoidapcoso->hoidap_update($mydata, $id);
			$this->session->set_flashdata('success', 'Đã cập nhật câu trả lời');
			// redirect('admin/hoidap/','refresh');
		}
		$this->data['view']='update';
		$this->data['title']='Cập nhật nhà cung cấp';
		$this->load->view('backend/layout', $this->data);
	}


	public function updatesp($id){
		$this->data['row']=$this->Mhoidapcoso->hoidap_detail($id);
		$d=getdate();
		$today=$d['year']."/".$d['mon']."/".$d['mday']." ".$d['hours'].":".$d['minutes'].":".$d['seconds'];
		$this->load->library('form_validation');
		$this->load->library('session');
		$this->load->library('alias');
		$this->form_validation->set_rules('answer', 'Câu trả lời', 'required');
		$info  = $this->session->userdata('sessionadmin');
		if ($this->form_validation->run() == TRUE) {
			$mydata= array(
				'answer' =>$_POST['answer'],
				'answer_by' =>$info['fullname'],
				'answer_time' =>$today,
			);
			$this->Mhoidapcoso->hoidap_update($mydata, $id);
			$this->session->set_flashdata('success', 'Đã cập nhật câu trả lời');
		}
		$this->data['view']='updatesp';
		$this->data['title']='Cập nhật nhà cung cấp';
		$this->load->view('backend/layout', $this->data);
	}

	public function recyclebinsp(){
		$this->load->library('phantrang');
		$limit=10;
		$current=$this->phantrang->PageCurrent();
		$first=$this->phantrang->PageFirst($limit, $current);
		$total=$this->Mhoidapcoso->hoidap_trash_count();
		$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='admin/hoidap/recyclebinsp');
		$this->data['list']=$this->Mhoidapcoso->hoidap_trash($limit, $first);
		$this->data['view']='recyclebinsp';
		$this->data['title']='Thùng rác chính sách';
		$this->load->view('backend/layout', $this->data);
	}

}
