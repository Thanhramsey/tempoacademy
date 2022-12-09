<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Chinhsach extends CI_Controller {

	public function __construct(){
		parent::__construct();
		$this->load->model('backend/Mproducer');
        $this->load->model('backend/Muser');
        $this->load->model('backend/Morders');
		$this->load->model('backend/Mchinhsach');
		if(!$this->session->userdata('sessionadmin')){
			redirect('admin/user/login','refresh');
		}
		$this->data['user']=$this->session->userdata('sessionadmin');
		$this->data['com']='chinhsach';
	}

	public function index(){
		$this->load->library('phantrang');
		$limit=10;
		$current=$this->phantrang->PageCurrent();
		$first=$this->phantrang->PageFirst($limit, $current);
		$total=$this->Mchinhsach->chinhsach_count();
		$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='admin/producer');
		$this->data['list']=$this->Mchinhsach->chinhsach_all($limit,$first);
		$this->data['view']='index';
		$this->data['title']='Danh sách nhà cung cấp ';
		$this->load->view('backend/layout', $this->data);
	}

	public function insert(){
		$user_role=$this->session->userdata('sessionadmin');
		if($user_role['role']==2){
			redirect('admin/E403/index','refresh');
		}
		$d=getdate();
		$today=$d['year']."/".$d['mon']."/".$d['mday']." ".$d['hours'].":".$d['minutes'].":".$d['seconds'];
		$this->load->library('form_validation');
		$this->load->library('session');
		$this->load->library('alias');
		$this->form_validation->set_rules('name', 'Tên văn bản', 'required|is_unique[db_chinhsach.name]');
		// $this->form_validation->set_rules('sohieu', 'Số hiệu', 'required|is_unique[db_chinhsach.sohieu]');
		// $this->form_validation->set_rules('loaivanban', 'Loại văn bản', 'required');
		// $this->form_validation->set_rules('linhvuc', 'Lĩnh vực', 'required');
		// $this->form_validation->set_rules('trichyeu', 'Trích yếu', 'required');
		// $this->form_validation->set_rules('ngaybanhanh', 'Ngày ban hành', 'required');
		if ($this->form_validation->run() == TRUE){
			$mydata= array(
				'name' =>$_POST['name'],
				'loaivanban'=>$_POST['loaivanban'],
				'loaivanban_name'=>$_POST['loaivanban_name'],
				'created_at'=>$today,
				'created_by'=>$this->session->userdata('id'),
				'updated_at'=>$today,
				'updated_by'=>$this->session->userdata('id'),
				'trash'=>1,
				'status'=>1,
			);
			if (!empty($_POST['linhvuc'])) {
				$mydata['linhvuc']=$_POST['linhvuc'];
			}
			if (!empty($_POST['sohieu'])) {
				$mydata['sohieu']=$_POST['sohieu'];
			}
			if (!empty($_POST['trichyeu'])) {
				$mydata['trichyeu']=$_POST['trichyeu'];
			}
			if (!empty($_POST['ngaybanhanh'])) {
				$mydata['ngaybanhanh']=$_POST['ngaybanhanh'];
			}
			$config['upload_path']          = './public/images/chinhsach/';
			$config['encrypt_name'] = TRUE;
            $config['allowed_types']        = 'pdf|doc|docx';
            $config['max_size']             = 10000;
            $this->load->library('upload', $config);
            if ( $this->upload->do_upload('file_pdf')){
                $data = $this->upload->data();
                $mydata['file']=$data['file_name'];
            }else{
                $mydata['file']='';
            }
			$this->Mchinhsach->chinhsach_insert($mydata);
			$this->session->set_flashdata('success', 'Thêm văn bản thành công');
			redirect('admin/chinhsach','refresh');
		}else{
			$this->data['view']='insert';
			$this->data['title']='Thêm nhà cung cấp';
        	$this->load->view('backend/layout', $this->data);
		}
	}

	public function update($id){
		$user_role=$this->session->userdata('sessionadmin');
		if($user_role['role']==2){
			redirect('admin/E403/index','refresh');
		}
		$this->data['row']=$this->Mchinhsach->chinhsach_detail($id);
		$d=getdate();
		$today=$d['year']."/".$d['mon']."/".$d['mday']." ".$d['hours'].":".$d['minutes'].":".$d['seconds'];
		$this->load->library('form_validation');
		$this->load->library('session');
		$this->load->library('alias');
		$this->form_validation->set_rules('name', 'Tên văn bản', 'required');
		// $this->form_validation->set_rules('sohieu', 'Số hiệu', 'required');
		$this->form_validation->set_rules('loaivanban', 'Loại văn bản', 'required');
		// $this->form_validation->set_rules('linhvuc', 'Lĩnh vực', 'required');
		// $this->form_validation->set_rules('trichyeu', 'Trích yếu', 'required');
		// $this->form_validation->set_rules('ngaybanhanh', 'Ngày ban hành', 'required');
		if ($this->form_validation->run() == TRUE) {
			$mydata= array(
				'name' =>$_POST['name'],
				'loaivanban'=>$_POST['loaivanban'],
				'loaivanban_name'=>$_POST['loaivanban_name'],
				'updated_at'=>$today,
				'updated_by'=>$this->session->userdata('id'),
				'trash'=>1,
				'status'=>$_POST['status']
			);
			if (!empty($_POST['linhvuc'])) {
				$mydata['linhvuc']=$_POST['linhvuc'];
			}
			if (!empty($_POST['sohieu'])) {
				$mydata['sohieu']=$_POST['sohieu'];
			}
			if (!empty($_POST['trichyeu'])) {
				$mydata['trichyeu']=$_POST['trichyeu'];
			}
			if (!empty($_POST['ngaybanhanh'])) {
				$mydata['ngaybanhanh']=$_POST['ngaybanhanh'];
			}
			$config['upload_path']          = './public/images/chinhsach/';
			$config['encrypt_name'] = TRUE;
            $config['allowed_types']        = 'pdf|doc|docx';
            $config['max_size']             = 10000;
            $this->load->library('upload', $config);
            if ( $this->upload->do_upload('file_pdf')){
                $data = $this->upload->data();
                $mydata['file']=$data['file_name'];
            }
			$this->Mchinhsach->chinhsach_update($mydata, $id);
			$this->session->set_flashdata('success', 'Cập nhật văn bản thành công');
			redirect('admin/chinhsach/','refresh');
		}
		$this->data['view']='update';
		$this->data['title']='Cập nhật văn bản';
		$this->load->view('backend/layout', $this->data);
	}

	public function status($id){
		$row=$this->Mchinhsach->chinhsach_detail($id);
		$status=($row['status']==1)?0:1;
		$mydata= array('status' => $status);
		$this->Mchinhsach->chinhsach_update($mydata, $id);
		$this->session->set_flashdata('success', 'Cập nhật văn bản thành công');
		redirect('admin/chinhsach/','refresh');
	}

	public function recyclebin(){
		$this->load->library('phantrang');
		$limit=10;
		$current=$this->phantrang->PageCurrent();
		$first=$this->phantrang->PageFirst($limit, $current);
		$total=$this->Mchinhsach->chinhsach_trash_count();
		$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='admin/chinhsach/recyclebin');
		$this->data['list']=$this->Mchinhsach->chinhsach_trash($limit, $first);
		$this->data['view']='recyclebin';
		$this->data['title']='Thùng rác chính sách';
		$this->load->view('backend/layout', $this->data);
	}

	public function trash($id){
		$mydata= array('trash' => 0);
		$this->Mchinhsach->chinhsach_update($mydata, $id);
		$this->session->set_flashdata('success', 'Xóa văn bản vào thùng rác thành công');
		redirect('admin/chinhsach','refresh');
	}

	public function restore($id)
	{
		$this->Mchinhsach->chinhsach_restore($id);
		$this->session->set_flashdata('success', 'Khôi phục văn bản thành công');
		redirect('admin/chinhsach/recyclebin','refresh');
	}
	public function delete($id)
	{
		$row=$this->Mchinhsach->chinhsach_delete_detail($id);
		$this->Mchinhsach->chinhsach_delete($row['id'],$row['file']);
		$this->session->set_flashdata('success', 'Xóa văn bản thành công');
		redirect('admin/chinhsach/recyclebin','refresh');
	}

}
