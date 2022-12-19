<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Search extends CI_Controller {

	function __construct() {
		parent::__construct();
		$this->load->model('frontend/Mcontent');
		$this->load->model('frontend/Mcategory');
		$this->load->model("frontend/Mproduct");
		$this->load->model('frontend/Mproducer');
		$this->load->model('backend/Muser');
		$this->data['com']='search';
	}
	public function index(){
		// $this->load->library('phantrang');
		$this->load->library('phantrangsearch');
		$key = $_GET['search'];
		if (!empty($_GET['option'])) {
			$option = $_GET['option'];
		  }
		else{
			$option = 0;
		}

		$aurl= explode('/',uri_string());
		$sufix = '?search='.str_replace(' ', '+', $key).'&option='.str_replace(' ', '+', $option);
		$limit=12;
		$current=$this->phantrangsearch->PageCurrent();
		$first=$this->phantrangsearch->PageFirst($limit, $current);
		//tìm theo sp
		if($option == 0){
			$total = $this->Mproduct->product_search_count($key);
			$this->data['list'] = $this->Mproduct->product_search($key,$limit,$first);
			$this->data['search_name']='sản phẩm';
		}else if ($option == 1){
			// timm doanh nghiep
			$total = $this->Muser->doanhnghiep_search_count($key);
			$this->data['list'] = $this->Muser->doanhnghiep_search($key,$limit,$first);
			$this->data['search_name']='doanh nghiệp';
		}else if($option == 2){
			// timm hang sx
			$total = $this->Mproducer->xa_search_count($key);
			$this->data['list'] = $this->Mproducer->xa_search($key,$limit,$first);
			$this->data['search_name']='hãng sản xuất';
		}

		$this->data['title']='TEMPO  - Bạn muốn tìm gì ?';
		$this->data['option'] =$option;
		$this->data['strphantrang']=$this->phantrangsearch->PagePer($total, $current, $limit, $url= 'search',$sufix= $sufix );
		$this->data['view']='index';
		$this->data['count'] = $total;
		$this->data['key'] =$key;
		$this->load->view('frontend/layout',$this->data);
	}
}