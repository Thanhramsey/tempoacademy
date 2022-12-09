<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Product extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model('backend/Mproduct');
		$this->load->model('backend/Mcategory');
		$this->load->model('backend/Muser');
		$this->load->model('backend/Mproducer');
		$this->load->model('backend/Morderdetail');
		$this->load->model('backend/Morders');
		$this->load->model('backend/Mevaluate');
		$this->load->model('backend/Mhoidapcoso');
		if (!$this->session->userdata('sessionadmin')) {
			redirect('admin/user/login', 'refresh');
		}
		$this->data['user'] = $this->session->userdata('sessionadmin');
		$this->data['com'] = 'product';
	}

	public function index()
	{
		$this->load->library('phantrang');
		$this->load->library('session');
		$limit = 10;
		$current = $this->phantrang->PageCurrent();
		$user_role = $this->session->userdata('sessionadmin');
		$first = $this->phantrang->PageFirst($limit, $current);

		$doanhnghiep = "";
		$loaisp = "";

		if(!empty($_POST['doanhnghiep'])){
			$doanhnghiep = $_POST['doanhnghiep'];
		}

		if(!empty($_POST['loaisp'])){
			$loaisp = $_POST['loaisp'];
		}

		if ($user_role['role'] == 1) {
			$total = $this->Mproduct->product_sanpham_count($doanhnghiep,$loaisp);
			$this->data['strphantrang'] = $this->phantrang->PagePer($total, $current, $limit, $url = 'admin/product');
			$this->data['list'] = $this->Mproduct->product_sanpham($limit, $first,$doanhnghiep,$loaisp);
		} else {
			$userId = $this->session->userdata('id');
			$total = $this->Mproduct->product_sanpham_byId_count($userId,$doanhnghiep,$loaisp);
			$this->data['strphantrang'] = $this->phantrang->PagePer($total, $current, $limit, $url = 'admin/product');
			$this->data['list'] = $this->Mproduct->product_sanpham_id($limit, $first, $userId,$doanhnghiep,$loaisp);

		}
		$this->data['doanhnghiep'] = $doanhnghiep;
		$this->data['loaisp'] = $loaisp;
		$this->data['view'] = 'index';
		$this->data['title'] = 'Danh mục sản phẩm';
		$this->load->view('backend/layout', $this->data);
	}

	public function insert()
	{
		// $user_role=$this->session->userdata('sessionadmin');
		// if($user_role['role']==2){
		// redirect('admin/E403/index','refresh');
		// }
		// $user_role=$this->session->userdata('sessionadmin');
		// if($user_role['role']==2){
		// redirect('admin/E403/index','refresh');
		// }
		$d = getdate();
		$today = $d['year'] . "/" . $d['mon'] . "/" . $d['mday'] . " " . $d['hours'] . ":" . $d['minutes'] . ":" . $d['seconds'];
		$this->load->library('form_validation');
		$this->load->library('session');
		$this->load->library('alias');
		$this->form_validation->set_rules('name', 'Tên sản phẩm', 'required|is_unique[db_product.name]');
		$this->form_validation->set_rules('catid', 'Loại sản phẩm', 'required');
		$this->form_validation->set_rules('producer', 'Xã', 'required');
		// $this->form_validation->set_rules('userId', 'Nhà cung cấp', 'required');
		$this->form_validation->set_rules('price_buy', 'Giá bán', 'required|callback_check');
		if ($this->form_validation->run() == TRUE) {
			if (empty($_POST['userId'])) {
				$userId = $this->session->userdata('id');
			} else {
				$userId = $_POST['userId'];
			}
			$mydata = array(
				'catid' => $_POST['catid'],
				'producer' => $_POST['producer'],
				'userId' => $userId,
				'name' => $_POST['name'],
				'alias' => $string = $this->alias->str_alias($_POST['name']),
				'detail' => $_POST['detail'],
				'sortDesc' => $_POST['sortDesc'],
				'number' => $_POST['number'],
				'sale' => $_POST['sale_of'],
				'price' => $_POST['price_root'],
				'price_sale' => $_POST['price_buy'],
				'created' => $today,
				'created_by' => $this->session->userdata('id'),
				'modified' => $today,
				'modified_by' => $this->session->userdata('id'),
				'trash' => 1,
				'status' => $_POST['status']
			);
			$config = array();
			$config['upload_path']   = './public/images/products/';
			$config['allowed_types'] = 'jpg|png|gif|jpeg';
			$config['max_size'] = 2000;
			$config['encrypt_name'] = TRUE;
			$name_array = array();
			$file  = $_FILES['image_list'];
			$count = count($file['name']);
			$img = '';
			$this->load->library('upload', $config);
			for ($i = 0; $i <= $count - 1; $i++) {
				$_FILES['userfile']['name']     = $file['name'][$i];  //khai báo tên của file thứ i
				$_FILES['userfile']['type']     = $file['type'][$i]; //khai báo kiểu của file thứ i
				$_FILES['userfile']['tmp_name'] = $file['tmp_name'][$i]; //khai báo đường dẫn tạm của file thứ i
				$_FILES['userfile']['error']    = $file['error'][$i]; //khai báo lỗi của file thứ i
				$_FILES['userfile']['size']     = $file['size'][$i]; //khai báo kích cỡ của file thứ i
				if ($this->upload->do_upload()) {
					$data = $this->upload->data();
					$img .= $data['file_name'] . '#';
				}
			}
			$name_array = explode('#',$img);
			if(count($name_array)>=4){
				$mydata['img']=$name_array[0];
				$mydata['img2']=$name_array[1];
				$mydata['img3']=$name_array[2];
				$mydata['img4']=$name_array[3];
			}else if(count($name_array)==3){
				$mydata['img']=$name_array[0];
				$mydata['img2']=$name_array[1];
				$mydata['img3']=$name_array[2];
			}else if(count($name_array)==2){
				$mydata['img']=$name_array[0];
				$mydata['img2']=$name_array[1];
			}else{
				$mydata['img']=$name_array[0];
			}
			$this->load->library('upload', $config);
			if($this->upload->do_upload('image')){
				$data = $this->upload->data();
				$mydata['avatar']=$data['file_name'];
			}
			$this->Mproduct->product_insert($mydata);
			$this->session->set_flashdata('success', 'Thêm sản phẩm thành công');
			redirect('admin/product', 'refresh');
		} else {
			$this->data['view'] = 'insert';
			$this->data['title'] = 'Thêm sản phẩm mới';
			$this->load->view('backend/layout', $this->data);
		}
	}

	function check()
	{
		$giaban = $this->input->post('price_buy');
		$giagoc = $this->input->post('price_root');
		if ($giaban > $giagoc) {
			$this->form_validation->set_message(__FUNCTION__, 'Bạn phải nhập giá bán nhỏ hơn hoặc bằng giá gốc');
			return FALSE;
		} else {
			return true;
		}
	}

	public function update($id)
	{
		//       $user_role=$this->session->userdata('sessionadmin');
		// if($user_role['role']==2){
		//   redirect('admin/E403/index','refresh');
		// }
		$this->data['row'] = $this->Mproduct->product_detail($id);
		$d = getdate();
		$today = $d['year'] . "/" . $d['mon'] . "/" . $d['mday'] . " " . $d['hours'] . ":" . $d['minutes'] . ":" . $d['seconds'];
		$this->load->library('form_validation');
		$this->load->library('session');
		$this->load->library('alias');
		$this->form_validation->set_rules('name', 'Tên sản phẩm', 'required');
		$this->form_validation->set_rules('catid', 'Loại sản phẩm', 'required');
		$this->form_validation->set_rules('producer', 'Xã', 'required');
		//  $this->form_validation->set_rules('userId', 'Nhà cung cấp', 'required');
		$this->form_validation->set_rules('price_buy', 'Giá bán', 'required|callback_check');
		if ($this->form_validation->run() == TRUE) {
			if (empty($_POST['userId'])) {
				$userId = $this->session->userdata('id');
			} else {
				$userId = $_POST['userId'];
			}
			$mydata = array(
				'catid' => $_POST['catid'],
				'producer' => $_POST['producer'],
				'userId' => $userId,
				'name' => $_POST['name'],
				'alias' => $string = $this->alias->str_alias($_POST['name']),
				'detail' => $_POST['detail'],
				'sortDesc' => $_POST['sortDesc'],
				'sale' => $_POST['sale_of'],
				'price' => $_POST['price_root'],
				'price_sale' => $_POST['price_buy'],
				'modified' => $today,
				'modified_by' => $this->session->userdata('id'),
				'status' => $_POST['status']
			);
			$config = array();
			$config['upload_path']   = './public/images/products/';
			$config['allowed_types'] = 'jpg|png|gif|jpeg';
			$config['max_size'] = 2000;
			$config['encrypt_name'] = TRUE;
			$name_array = array();
			$file  = $_FILES['image_list'];
			$count = count($file['name']);
			$img = '';
			$this->load->library('upload', $config);
			for ($i = 0; $i <= $count - 1; $i++) {
				$_FILES['userfile']['name']     = $file['name'][$i];  //khai báo tên của file thứ i
				$_FILES['userfile']['type']     = $file['type'][$i]; //khai báo kiểu của file thứ i
				$_FILES['userfile']['tmp_name'] = $file['tmp_name'][$i]; //khai báo đường dẫn tạm của file thứ i
				$_FILES['userfile']['error']    = $file['error'][$i]; //khai báo lỗi của file thứ i
				$_FILES['userfile']['size']     = $file['size'][$i]; //khai báo kích cỡ của file thứ i
				if ($this->upload->do_upload()) {
					$data = $this->upload->data();
					$img .= $data['file_name'] . '#';
				}
			}
			$name_array = explode('#',$img);
			if(count($name_array)>=4){
				$mydata['img']=$name_array[0];
				$mydata['img2']=$name_array[1];
				$mydata['img3']=$name_array[2];
				$mydata['img4']=$name_array[4];
			}else if(count($name_array)==3){
				$mydata['img']=$name_array[0];
				$mydata['img2']=$name_array[1];
				$mydata['img3']=$name_array[2];
			}else if(count($name_array)==2){
				$mydata['img']=$name_array[0];
				$mydata['img2']=$name_array[1];
			}else{
				$mydata['img']=$name_array[0];
			}
			$this->load->library('upload', $config);
			if($this->upload->do_upload('image')){
				$data = $this->upload->data();
				$mydata['avatar']=$data['file_name'];
			}
			$this->Mproduct->product_update($mydata, $id);
			$this->session->set_flashdata('success', 'Cập nhật sản phẩm thành công');
			redirect('admin/product', 'refresh');
		}
		$this->data['view'] = 'update';
		$this->data['title'] = 'Cập nhật sản phẩm';
		$this->load->view('backend/layout', $this->data);
	}

	public function status($id)
	{
		$row = $this->Mproduct->product_detail($id);
		$status = ($row['status'] == 1) ? 0 : 1;
		$mydata = array('status' => $status, 'modified_by' => $this->session->userdata('id'),);
		$this->Mproduct->product_update($mydata, $id);
		$this->session->set_flashdata('success', 'Cập nhật sản phẩm thành công');
		redirect('admin/product/', 'refresh');
	}

	public function tiemnang($id)
	{
		$row = $this->Mproduct->product_detail($id);
		$is_hot = ($row['is_hot'] == 1) ? 0 : 1;
		$mydata = array('is_hot' => $is_hot, 'modified_by' => $this->session->userdata('id'),);
		$this->Mproduct->product_update($mydata, $id);
		$this->session->set_flashdata('success', 'Cập nhật sản phẩm thành công');
		redirect('admin/product/', 'refresh');
	}

	public function recyclebin()
	{
		$this->load->library('phantrang');
		$limit = 10;
		$current = $this->phantrang->PageCurrent();
		$first = $this->phantrang->PageFirst($limit, $current);
		$total = $this->Mproduct->product_trash_count();
		$this->data['strphantrang'] = $this->phantrang->PagePer($total, $current, $limit, $url = 'admin/product/recyclebin');
		$this->data['list'] = $this->Mproduct->product_trash($limit, $first);
		$this->data['view'] = 'recyclebin';
		$this->data['title'] = 'Thùng rác sản phẩm';
		$this->load->view('backend/layout', $this->data);
	}

	public function trash($id)
	{
		$row = $this->Morderdetail->orderdetail_detail($id);
		if (count($row) > 0) {
			$this->session->set_flashdata('error', 'Đã có khách hàng đặt mua, không thể xóa !');
			redirect('admin/product', 'refresh');
		} else {
			$mydata = array('trash' => 0, 'modified_by' => $this->session->userdata('id'),);
			$this->Mproduct->product_update($mydata, $id);
			$this->session->set_flashdata('success', 'Xóa sản phẩm vào thùng rác thành công');
			redirect('admin/product', 'refresh');
		}
	}

	public function restore($id)
	{
		$this->Mproduct->product_restore($id);
		$this->session->set_flashdata('success', 'Khôi phục sản phẩm thành công');
		redirect('admin/product/recyclebin', 'refresh');
	}

	public function delete($id)
	{
		$this->load->helper('file');
		$row = $this->Mproduct->product_detail($id);
		if (!empty($row['avatar'])) {
			delete_files(base_url("public/images/products" . $row['avatar']));
		}
		else if (!empty($row['img'])) {
			delete_files(base_url("public/images/products" . $row['img']));
		}
		else if (!empty($row['img2'])) {
			delete_files(base_url("public/images/products" . $row['img2']));
		}
		else if (!empty($row['img3'])) {
			delete_files(base_url("public/images/products" . $row['img3']));
		}
		else if (!empty($row['img4'])) {
			delete_files(base_url("public/images/products" . $row['img4']));
		}

		$this->Mproduct->product_delete($id);
		$this->session->set_flashdata('success', 'Xóa sản phẩm thành công');
		redirect('admin/product/recyclebin', 'refresh');
	}

	public function import($id)
	{
		$row = $this->Mproduct->product_detail($id);
		$d = getdate();
		$today = $d['year'] . "/" . $d['mon'] . "/" . $d['mday'] . " " . $d['hours'] . ":" . $d['minutes'] . ":" . $d['seconds'];
		$this->load->library('form_validation');
		$this->load->library('session');
		$this->load->library('alias');
		$this->form_validation->set_rules('number', 'Số lượng', 'required');
		if ($this->form_validation->run() == TRUE) {
			$mydata = array(
				'number' => $row['number'] + $_POST['number'],
				'modified' => $today,
				'modified_by' => $this->session->userdata('id')
			);
			$this->Mproduct->product_update($mydata, $id);
			$this->session->set_flashdata('success', 'Cập nhật sản phẩm thành công');
			redirect('admin/product', 'refresh');
		}
		$this->data['row'] = $row;
		$this->data['view'] = 'import';
		$this->data['title'] = 'Cập nhật sản phẩm';
		$this->load->view('backend/layout', $this->data);
	}
	// public function quicksearch(){
	// 	$query = '';
	// 	if($this->input->post('query'))
	// 	{
	// 		$query = $this->input->post('query');
	// 	}
	// 	$data = $this->Mproduct->get_data_search($query);
	// 	if($data->num_rows() > 0)
	// 	{
	// 		foreach($data->result() as $row)
	// 		{
	// 			$this->data['get'] = $row;
	// 			$this->data['view']='index';
	// 			$this->load->view('backend/layout', $this->data);

	// 		}
	// 	}


	// }
	public function danhgia($id){
		$this->load->library('phantrang');
		$limit=10;
		$current=$this->phantrang->PageCurrent();
		$first=$this->phantrang->PageFirst($limit, $current);
		$total=$this->Mhoidapcoso->hoidap_count_byId($id);
		$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='admin/product/danhgia');
		$this->data['list']=$this->Mhoidapcoso->hoidap_byId_2($id);
		$this->data['total']=$total;
		$this->data['view']='danhgia';
		$this->data['title']='Bình luận sản phẩm';
		$this->load->view('backend/layout', $this->data);
	}
	public function deleteComment($id){

		$product_id = $this->Mevaluate->get_comment($id);
		$this->Mevaluate->comment_delete($id);
		$this->session->set_flashdata('success', 'Xóa comment thành công');
		redirect('admin/product/danhgia/'.$product_id,'refresh');
	}


}
