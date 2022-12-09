<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User extends CI_Controller {
	public function __construct()
	{
		parent::__construct();
		$this->load->model('backend/Muser');
		$this->load->model('backend/Morders');
		$this->load->model('backend/Mconfiguration');
	}

	public function login()
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('username', 'Tên đăng nhập', 'required|min_length[5]|max_length[32]');
		$this->form_validation->set_rules('password', 'Mật khẩu', 'required|min_length[5]|max_length[32]');
        if ($this->form_validation->run() ==TRUE)
        {
        	$username = $_POST['username'];
        	$password = sha1($_POST['password']);
        	if($this->Muser->user_login($username, $password)!=FALSE)
        	{
        		$row = $this->Muser->user_login($username, $password);
				if($row['status'] != 1){
					$data['error']='Vui lòng liên hệ quản trị để kích hoạt tài khoản của bạn !';
	        		$this->load->view('backend/components/user/login', $data);
					return;
				}
        		$this->session->set_userdata('sessionadmin',$row);
        		$this->session->set_userdata('id',$row['id']);
        		redirect('admin','refresh');
        	}
        	else
	        {
	        	$data['error']='Thông tin đăng nhập không chính xác';
	        	$this->load->view('backend/components/user/login', $data);
	        }
        }
        else
        {
        	$this->load->view('backend/components/user/login');
        }
	}

	public function logout()
	{
		$array_items = array('sessionadmin', 'id');
        $this->session->unset_userdata($array_items);
		redirect('admin','refresh');
	}

	public function insert(){
		$d=getdate();
		$today=$d['year']."/".$d['mon']."/".$d['mday']." ".$d['hours'].":".$d['minutes'].":".$d['seconds'];
		$this->load->library('form_validation');
		$this->load->library('alias');
		$this->form_validation->set_rules('fullname', 'Họ và tên', 'required');
		$this->form_validation->set_rules('phone', 'Số điện thoại', 'required|is_unique[db_user.phone]');
		$this->form_validation->set_rules('email', 'Địa chỉ email', 'required|is_unique[db_user.email]');
		$this->form_validation->set_rules('address', 'Địa chỉ', 'required');
		$this->form_validation->set_rules('username', 'Tên đăng nhập', 'required|is_unique[db_user.username]');
		$this->form_validation->set_rules('password', 'Mật khẩu', 'required|min_length[5]|max_length[32]');
		$this->form_validation->set_rules('detail', 'Thông tin', 'required');
		if ($this->form_validation->run() == TRUE){
			$mydata= array(
				'fullname' =>$_POST['fullname'],
				'phone' =>$_POST['phone'],
				'address' =>$_POST['address'],
				'email' =>$_POST['email'],
				'username' =>$_POST['username'],
				'password' =>sha1($_POST['password']),
				'role' => 2,
				'status' => 1,  // 1 : active , 2: chua active
				'created' =>$today,
				'detail' =>$_POST['detail'],
				'username' =>$_POST['username'],
				'star'=> 4,
				'trash'=>1
			);
			$config['upload_path']          = './public/images/admin/';
			$config['encrypt_name'] = TRUE;
            $config['allowed_types']        = 'gif|jpg|png';
            $config['max_size']             = 2000;
            $this->load->library('upload', $config);
            if ( $this->upload->do_upload('img')){
                $data = $this->upload->data();
                $mydata['img']=$data['file_name'];
            }else{
                $mydata['img']='default.png';
            }
			$this->Muser->user_insert($mydata);
			$this->session->set_flashdata('success', 'Thêm tài khoản thành công');
			redirect('admin/useradmin','refresh');
		}
		else{
			$this->data['view']='insert';
			$this->data['title']='Thêm mới tài khoản';
			$this->load->view('backend/components/user/insert', $this->data);
		}
	}

	public function forgotpassword(){
	$this->form_validation->set_rules('email', 'Email', 'required|callback_check_mail_forget');
	$config_data = $this->Mconfiguration->get_config();
        if($this->form_validation->run() ==TRUE){

            $email = $this->input->post('email');
            $list = $this->Muser->user_detail_email($email);

            $this->load->library('email');
            $this->load->library('parser');
            $this->email->clear();
            $config['protocol']    = 'smtp';
            $config['smtp_host']    = 'ssl://smtp.gmail.com';
            $config['smtp_port']    = '465';
            $config['smtp_timeout'] = '7';
			$config['smtp_user']    = $config_data['mail_smtp'];
            $config['smtp_pass']    = $config_data['mail_smtp_password'];
            $config['charset']    = 'utf-8';
            $config['newline']    = "\r\n";
            $config['wordwrap'] = TRUE;
            $config['mailtype'] = 'html';
            $config['validation'] = TRUE;
            $this->email->initialize($config);
            $this->email->from($config_data['mail_smtp'], 'Hệ thống COOP UBND Chư pưh');
            $this->email->to($list['email']);
            $this->email->subject('Hệ thống COOP UBND Chư pưh - Lấy lại mật khẩu');
            $this->email->message('Vui lòng truy cập đường dẫn để lấy lại mật khẩu <button class="btn"><a href="'.base_url().'admin/user/reset_password_new/'.$list['id'].'">Lấy lại mật khẩu</a></button>');
            $this->email->send();
            $this->data['success']='Bạn vui lòng kiểm tra mail để lấy lại mật khẩu!';
        }
        $this->data['view']='insert';
		$this->data['title']='Quên mật khẩu';
		$this->load->view('backend/components/user/forgotpassword', $this->data);
    }

	public function reset_password_new($id){
        $list = $this->Muser->user_detail_id_fg($id);

        $this->load->library('form_validation');
        $this->form_validation->set_rules('email', 'Email', 'required');
        $this->form_validation->set_rules('password', 'Mật khẩu', 'required|min_length[6]|max_length[32]');
        $this->form_validation->set_rules('re_password', 'Nhập lại mật khẩu', 'required|matches[password]');

        if($this->form_validation->run() ==TRUE){
           $email = $_POST['email'];
           if($this->Muser->user_check_id_email($id, $email)!=FALSE){
               $password_new = sha1($_POST['re_password']);
               $mydata= array( 'password' => $password_new,);
               $this->Muser->user_update_fg($mydata, $list['id']);
               $this->data['success']='Đổi mật khẩu thành công';
               echo '<script>alert("Mật khẩu đã được thay đổi thành công !")</script>';
			   redirect('admin/useradmin','refresh');
           }
           else{
            $this->data['error']='Email không đúng, vui lòng nhập đúng email cần lấy lại mật khẩu !';
            $this->data['title']='Hệ thống COOP UBND Chư pưh - Cập nhật mật khẩu mới';
            $this->data['view']='reset_password_new';
            $this->load->view('backend/components/user/reset_password_new', $this->data);
        	}

    	}
		$this->data['title']='Hệ thống COOP UBND Chư pưh - Cập nhật mật khẩu mới';
		$this->data['view']='reset_password_new';
		$this->load->view('backend/components/user/reset_password_new', $this->data);
	}
	// Kiêm tra email lấy lại mk có đúng
    function check_mail_forget(){
        $email = $this->input->post('email');
        if($this->Muser->user_detail_email($email))
        {

            return TRUE;
        }
        else{
            $this->form_validation->set_message(__FUNCTION__, 'Email này không phải thành viên của cửa hàng !!');
            return FALSE;
        }
    }
}

/* End of file User.php */
/* Location: ./application/controllers/User.php */