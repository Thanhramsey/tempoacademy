<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Giohang extends CI_Controller {
	// Hàm khởi tạo
    function __construct() {
        parent::__construct();
        $this->load->model('frontend/Morder');
        $this->load->model('frontend/Mproduct');
        $this->load->model('frontend/Morderdetail');
        $this->load->model('frontend/Mcustomer');
        $this->load->model('frontend/Mcategory');
        $this->load->model('frontend/Mconfig');
        $this->load->model('frontend/Mdistrict');
        $this->load->model('frontend/Mprovince');
		$this->load->model('frontend/Mproducer');
		$this->load->model('backend/Muser');
        $this->data['com']='giohang';
    }

    public function index(){
        $this->data['title']='TEMPO - Giỏ hàng của bạn';
        $this->data['view']='index';
        $this->load->view('frontend/layout',$this->data);
    }
    function check_mail(){
        $email = $this->input->post('email');
        if($this->Mcustomer->customer_detail_email($email))
        {
            $this->form_validation->set_message(__FUNCTION__, 'Email đã đã là thành viên, Vui lòng đăng nhập hoặc nhập Email khác !');
            return FALSE;
        }
        return TRUE;
    }
    public function info_order(){
        $this->load->library('session');
        $this->load->helper('string');
        $this->load->library('email');
        $this->load->library('form_validation');
        $d=getdate();
        $today=$d['year']."/".$d['mon']."/".$d['mday']." ".$d['hours'].":".$d['minutes'].":".$d['seconds'];
		$todayDes = $d['year'].$d['mon'].$d['mday'].$d['hours'].$d['minutes'].$d['seconds'];
        if(!$this->session->userdata('sessionKhachHang'))
        {
            $this->form_validation->set_rules('email', 'Địa chỉ email', 'required|is_unique[db_customer.email]');
        }
        $this->form_validation->set_rules('phone', 'Số điện thoại', 'required');
        $this->form_validation->set_rules('name', 'Họ và tên', 'required|min_length[3]');
        $this->form_validation->set_rules('address', 'Địa chỉ', 'required');
        $this->form_validation->set_rules('city', 'Tỉnh thành', 'required');
        $this->form_validation->set_rules('DistrictId', 'Quận huyện', 'required');
        $priceShip=$this->Mconfig->config_price_ship();
        if($this->form_validation->run() == TRUE){
            //Tinh tien don hang
            $money=0;
			$idCustomer=null;
            if($this->session->userdata('cart')){
                $data=$this->session->userdata('cart');
                foreach ($data as $key => $value) {
                    $row = $this->Mproduct->product_detail_id($key);
                    $total=0;
                    if($row['price_sale'] > 0){
                        $total=$row['price_sale']*$value;
                    }else{
                        $total=$row['price'] * $value;
                    }
                    $money+=$total;
					if($this->session->userdata('sessionKhachHang')){
						$emailtemp = $this->session->userdata('email');
						$info=$this->session->userdata('sessionKhachHang');
						$idCustomer=$info['id'];
					}else{
						$emailtemp = $_POST['email'];
					}
					if(!$this->session->userdata('sessionKhachHang')){
						$datacustomer= array(
							'fullname'=>$_POST['name'],
							'phone'=> $_POST['phone'],
							'email'=> $emailtemp,
							'username'=>$emailtemp,
							'password'=>md5('123456'),
							'created' =>$today,
							'status'=>1,
							'trash'=>1
						);
						$this->Mcustomer->customer_insert($datacustomer);
						$rowdta=$this->Mcustomer->customer_detail_email($_POST['email']);
						$this->session->set_userdata('info-customer',$rowdta);
						$info=$this->session->userdata('info-customer');
						if($info['id']){
							$idCustomer=$info['id'];
							$this->session->set_userdata('id-info-customer',$idCustomer);
						}
					}
					//kt ma giam gia
					if($this->session->userdata('coupon_price'))
					{
						$coupon =$this->session->userdata('coupon_price');
						$idcoupon =$this->session->userdata('id_coupon_price');
						$amount_number_used = $this->Mconfig->get_amount_number_used($idcoupon);
						$mycoupon=array(
							'number_used' => $amount_number_used+1,
						);
						$this->Mconfig->coupon_update($mycoupon, $idcoupon);
					}
					else{
						$coupon = 0;
					}

					$provinceId = $_POST['city'];
					$districtId = $_POST['DistrictId'];
					$orderCode = random_string('alnum', 8);
					$orderDes = $idCustomer.$todayDes;
                    if($row['price_sale'] > 0){
						$price = $row['price_sale'];
					}else{
						$price = $row['price'];
					}
					$mydata=array(
						'orderCode' => $orderCode,
						'customerid' => $idCustomer,
						'orderdate' => $today,
						'fullname' => $_POST['name'],
						'phone' => $_POST['phone'],
						'address' => $_POST['address'],
						'money' => $total + $priceShip -$coupon,
						'price_ship' => $priceShip,
						'coupon' => $coupon,
						'province' => $provinceId,
						'district' => $districtId,
						'trash' => 1,
						'status' => 0,
						'orderDes'=> $orderDes,
                        'productid' => $key,
						'price' => $price,
						'count' => $value,
					);

					//Insert to db_order
					$this->Morder->order_insert($mydata);


					// lưu tt đơn hàng và xóa session coupon
					$this->session->set_userdata('orderDes',$orderDes);
					$this->session->unset_userdata('id_coupon_price');
					$this->session->unset_userdata('coupon_price');
                     //Insert to db_orderdetail
					$order_detail = $this->Morder->order_detail_customerid_orderCode($idCustomer,$orderCode);
					$orderid = $order_detail['id'];
					$data=[];
					$data = array(
						'orderid' => $orderid,
						'productid' => $key,
						'price' => $price,
						'count' => $value,
						'trash' => 1,
						'status' => 1
					);
					$this->Morderdetail->orderdetail_insert($data);
                }
            }

            $array_items = array('cart');
            $this->session->unset_userdata($array_items);
            redirect('/thankyou','refresh');

        }else{
            $this->data['title']='TEMPO - Thông tin đơn hàng';
            $this->data['view']='info-order';
            $this->load->view('frontend/layout',$this->data);
        }
    }

    public function thankyou(){
        if($this->session->userdata('info-customer')||$this->session->userdata('sessionKhachHang')){
            if($this->session->userdata('sessionKhachHang')){
                $val = $this->session->userdata('sessionKhachHang');
            }else{
                $val = $this->session->userdata('info-customer');
            }

			$orderDes = $this->session->userdata('orderDes');
			//TODO CHECK
			//xem tiep cho nay ->  lay het snh sach dua vao mail
            $list = $this->Morder->order_detail_orderDes($orderDes);

            $data = array(
                'order' => $list,
                'customer' => $val,
                'orderDetail' => $this->Morder->order_order_join_product($orderDes),
                'province' => $this->Mprovince->province_name($list['province']),
                'district' => $this->Mdistrict->district_name($list['district']),
                'priceShip' => $this->Mconfig->config_price_ship(),
                'coupon' => $list['coupon'],
            );
			$config_data = $this->Mconfig->get_config();
            $this->data['customer']=$val;
            $this->data['get']=$list;
            $this->load->library('email');
            $this->load->library('parser');
            $this->email->clear();
            $config['protocol']    = 'smtp';
            $config['smtp_host']    = 'ssl://smtp.gmail.com';
            $config['smtp_port']    = '465';
            $config['smtp_timeout'] = '7';
			$config['smtp_user']    = $config_data['mail_smtp'];
            $config['smtp_pass']    = $config_data['mail_smtp_password'];
            // mk trên la mat khau dung dung cua gmail, có thể dùng gmail hoac mat khau. Tao mat khau ung dung de bao mat tai khoan
            $config['charset']    = 'utf-8';
            $config['newline']    = "\r\n";
            $config['wordwrap'] = TRUE;
            $config['mailtype'] = 'html';
            $config['validation'] = TRUE;
            $this->email->initialize($config);
            $this->email->from($config_data['mail_smtp'], 'TEMPO ');
            $list = array($val['email']);
            $this->email->to($list);
            $this->email->subject('Hệ thống TEMPO ');
            $body = $this->load->view('frontend/modules/email',$data,TRUE);
            $this->email->message($body);
            $this->email->send();

            $datax = array('email' => '');
            $idx= $this->session->userdata('id-info-customer');
            $this->Mcustomer->customer_update($datax,$idx);
            $this->session->unset_userdata('id-info-customer','money_check_coupon');
        }
        $this->data['title']='TEMPO  - Kết quả đơn hàng';
        $this->data['view']='thankyou';
        $this->load->view('frontend/layout',$this->data);
    }

    public function district(){
        $this->load->library('session');
        $id=$_POST['provinceid'];
        $list = $this->Mdistrict->district_provinceid($id);
        $html="<option value =''>--- Chọn quận huyện ---</option>";
        foreach ($list as $row)
        {
            $html.='<option value = '.$row["id"].'>'.$row["name"].'</option>';
        }
        echo json_encode($html);
    }
    public function coupon(){
        $d=getdate();
        $today=$d['year']."-".$d['mon']."-".$d['mday'];
        $html='';
        if($this->session->userdata('coupon_price')){
         $html.='<p>Mỗi đơn hàng chỉ áp dụng 1 Mã giảm giá !!</p>';
     }else{
        if(empty($_POST['code']))
        {
            $html.='<p>Vui lòng nhập Mã giảm giá nếu có !!</p>';
        }
        else
        {
            // KIỂM TRA SỐ TIỀN TRONG GIỎ HÀNG
            $money=0;
            if($this->session->userdata('cart')){
                $data=$this->session->userdata('cart');
                foreach ($data as $key => $value) {
                    $row = $this->Mproduct->product_detail_id($key);
                    $total=0;
                    if($row['price_sale'] > 0){
                        $total=$row['price_sale']*$value;
                    }else{
                        $total=$row['price'] * $value;
                    }
                    $money+=$total;
                }
            }
            //
            // KIỂM TRA MÃ GIẢM GIÁ CÓ TỒN TẠI KO
            $coupon = $_POST['code'];
            $getcoupon = $this->Mconfig->get_config_coupon_discount($coupon);
            if(empty($getcoupon)) {
               $html.='<p>Mã giảm giá không tồn tại!</p>';
           }
           foreach ($getcoupon as $value) {
            if($value['code'] == $coupon)
            {
                if (strtotime($value['expiration_date']) <= strtotime($today)){
                    $html.='<p>Mã giảm giá '.$value['code'].' đã hết hạn sử dụng từ ngày '.$value['expiration_date'].' !</p>';
                }else if($value['limit_number'] -$value['number_used'] == 0){
                    $html.='<p>Mã giảm giá '.$value['code'].' đã hết số lần nhập !</p>';
                }else if($value['payment_limit'] >= $money ){
                    $html.='<p> Mã giảm giá này chỉ áp dụng cho đơn hàng từ '.number_format($value['payment_limit']).' đ trở lên !</p>';
                }else{
                    $html.='<script>window.location.reload();</script> <p>Mã giảm giá '.$value['code'].' đã được kích hoạt !</p>';
                    $this->session->set_userdata('coupon_price',$value['discount']);
                    $this->session->set_userdata('id_coupon_price',$value['id']);
                }
            }
        }
    }

}
echo json_encode($html);
}
public function removecoupon(){
    $html='<script>window.location.reload();</script>';
    $this->session->unset_userdata('coupon_price');
    $this->session->unset_userdata('id_coupon_price');
    echo json_encode($html);
}
}
// email trang thankyou bị sai
