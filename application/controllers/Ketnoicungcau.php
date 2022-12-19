<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ketnoicungcau extends CI_Controller {
	// Hàm khởi tạo
    function __construct() {
        parent::__construct();
        $this->load->model('frontend/Mproduct');
        $this->load->model('frontend/Mcategory');
        $this->load->model('frontend/Mcontent');
		$this->load->model('frontend/Mproducer');
		$this->load->model('backend/Muser');
		$this->load->model('frontend/Mketnoicungcau');
        $this->data['com']='ketnoicungcau';
    }

	public function index(){
		$this->load->library('phantrang');
		$limit=10;
		$current=$this->phantrang->PageCurrent();
		$first=$this->phantrang->PageFirst($limit, $current);
		$total=$this->Mketnoicungcau->cungcau_all_count();
		$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='ketnoicungcau');
		$this->data['list']=$this->Mketnoicungcau->cungcau_all($limit,$first);
		$this->data['listShop']=$this->Muser->users_banhang_five();
		$this->data['title']="TEMPO  - Liên hệ";
		$this->data['view']='index';
		$this->load->view('frontend/layout',$this->data);
	}

	public function cung(){
		$this->load->library('phantrang');
		$limit=10;

		$current=$this->phantrang->PageCurrent();
		$first=$this->phantrang->PageFirst($limit, $current);
		$type =1;
		$total=$this->Mketnoicungcau->cungcau_list_count($type);

		$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='ketnoicungcau');
		$this->data['list']=$this->Mketnoicungcau->cungcau_list($limit,$first,$type);
		$this->data['listShop']=$this->Muser->users_banhang_five();
		$this->data['title']="TEMPO  - Liên hệ";
		$this->data['view']='index';
		$this->load->view('frontend/layout',$this->data);
	}

	public function cau(){
		$this->load->library('phantrang');
		$limit=10;

		$current=$this->phantrang->PageCurrent();
		$first=$this->phantrang->PageFirst($limit, $current);
		$type =2;
		$total=$this->Mketnoicungcau->cungcau_list_count($type);

		$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='ketnoicungcau');
		$this->data['list']=$this->Mketnoicungcau->cungcau_list($limit,$first,$type);
		$this->data['listShop']=$this->Muser->users_banhang_five();
		$this->data['title']="TEMPO  - Liên hệ";
		$this->data['view']='index';
		$this->load->view('frontend/layout',$this->data);
	}

	public function doitac(){
		$this->load->library('phantrang');
		$limit=10;
		$current=$this->phantrang->PageCurrent();
		$first=$this->phantrang->PageFirst($limit, $current);
		$type =3;
		$total=$this->Mketnoicungcau->cungcau_list_count($type);

		$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='ketnoicungcau');
		$this->data['list']=$this->Mketnoicungcau->cungcau_list($limit,$first,$type);
		$this->data['listShop']=$this->Muser->users_banhang_five();
		$this->data['title']="TEMPO  - Liên hệ";
		$this->data['view']='index';
		$this->load->view('frontend/layout',$this->data);
	}


	public function tangview(){
		$id = $_POST['id'];
		$luotxem = $_POST['view'] +1 ;
		$mydata= array(
			'luotxem'=>$luotxem,
		);
		$this->Mketnoicungcau->tangview($mydata, $id);
	}

	public function dangtincungcau()
	{
		$d = getdate();
		$today = $d['year'] . "/" . $d['mon'] . "/" . $d['mday'] . " " . $d['hours'] . ":" . $d['minutes'] . ":" . $d['seconds'];
		$this->load->library('form_validation');
		$this->load->library('session');
		$this->load->library('alias');
		$this->form_validation->set_rules('type', 'Loại', 'required');
		$this->form_validation->set_rules('name', 'Tên người', 'required');
		$this->form_validation->set_rules('title', 'Tiêu đề', 'required');
		$this->form_validation->set_rules('phone', 'Số điện thoại', 'required');
		$this->form_validation->set_rules('address', 'Địa chỉ', 'required');
		if ($this->form_validation->run() == TRUE) {

			$mydata = array(
				'type'  => $_POST['type'],
				'nguoidang' => $_POST['name'],
				'tieude' => $_POST['title'],
				'phone' => $_POST['phone'],
				'address' => $_POST['address'],
				'ngaydang' => $today,
				'luotxem' => 1,
				'trash' => 1,
				'status' =>1
			);
			if (!empty($_POST['catid'])) {
				$mydata['catid']=$_POST['catid'];
			}
			if (!empty($_POST['price'])) {
				$mydata['price']=$_POST['price'];
			}
			if (!empty($_POST['detail'])) {
				$mydata['detail']=$_POST['detail'];
			}

			$config = array();
			$config['upload_path']   = './public/images/ketnoicungcau/';
			$config['allowed_types'] = 'jpg|png|gif|jpeg';
			$config['max_size'] = 2000;
			$config['encrypt_name'] = TRUE;
			$this->load->library('upload', $config);
            if ( $this->upload->do_upload('image')){
                $data = $this->upload->data();
                $mydata['hinhanh']=$data['file_name'];
            }else{
				if($_POST['type']==1){
					$mydata['hinhanh']='buy.png';
				}elseif($_POST['type']==2){
					$mydata['hinhanh']='sell.png';
				}else{
					$mydata['hinhanh']='coop.png';
				}
            }
			$this->Mketnoicungcau->cungcau_insert($mydata);
			$this->session->set_flashdata('success', 'Đã thêm cung cầu!');
			redirect('ketnoicungcau','refresh');
		}
	}


	function timkiem(){

		$this->load->library('phantrang');
		$limit=10;
		$current=$this->phantrang->PageCurrent();
		$first=$this->phantrang->PageFirst($limit, $current);

		$loaicungcau ="";
		$loaisp ="";
		$keyword ="";
		if(!empty($_POST['loaicungcau'])){
			$loaicungcau= $_POST['loaicungcau'];
		}
		if(!empty($_POST['loaisp'])){
			$loaisp= $_POST['loaisp'];
		}
		if(!empty($_POST['keyword'])){
			$keyword= $_POST['keyword'];
		}

		$total=$this->Mketnoicungcau->cungcau_timkiem_count($loaicungcau,$loaisp,$keyword);
		$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='ketnoicungcau');
		$this->data['list']=$this->Mketnoicungcau->cungcau_timkiem($limit,$first,$loaicungcau,$loaisp,$keyword);
		$this->data['listShop']=$this->Muser->users_banhang_five();
		$this->data['title']="TEMPO  - Liên hệ";
		$this->data['view']='index';
		$this->load->view('frontend/layout',$this->data);
	}
}
