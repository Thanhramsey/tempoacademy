<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sanpham extends CI_Controller {
    function __construct() {
        parent::__construct();
        $this->load->model('frontend/Mproduct');
		$this->load->model('frontend/Mproducer');
        $this->load->model('frontend/Mcategory');
		$this->load->model('frontend/Mevaluate');
		$this->load->model('frontend/Mhoidapcoso');
		$this->load->model('backend/Muser');
        $this->data['com']='sanpham';
        $this->load->library('session');
        $this->load->library('phantrang');
    }

    public function index(){
        if(isset($_POST['sapxep'])){
            $dksx=$_POST['sapxep'];
            $char = explode('-', $dksx);
            $f=$char[0];
            $od=$char[1];
            $data = array('0' => $f, '1' =>$od);
            $this->session->set_userdata('sortby', $data);
        }else{
            if($this->session->userdata('sortby')){
                $data = $this->session->userdata('sortby');
                $f=$data[0];
                $od=$data[1];
            }else{
                $f='created';
                $od='desc';
            }
        }
        $this->load->library('phantrang');
        $limit=12;
        $current=$this->phantrang->PageCurrent();
        $first=$this->phantrang->PageFirst($limit, $current);
        $total=$this->Mproduct->product_sanpham_count("","");
        $this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='san-pham');
        $this->data['list']=$this->Mproduct->product_sanpham($limit,$first,$f,$od);
        $this->data['title']='OCOP CHƯPƯH - Tất cả sản phẩm';
        $this->data['view']='index';
        if(isset($_POST['sapxep'])){
            $result=$this->load->view('frontend/components/sanpham/index_order',$this->data,true);
            echo json_encode($result);
        }else{
            $this->load->view('frontend/layout',$this->data);
        }
    }

    public function category(){
        if(isset($_POST['sapxep-category'])){
            $dksx=$_POST['sapxep-category'];
            $char = explode('-', $dksx);
            $f=$char[0];
            $od=$char[1];
            $data = array('0' => $f, '1' =>$od);
            $this->session->set_userdata('sortby-category', $data);
        }else{
            if($this->session->userdata('sortby-category')){
                $data = $this->session->userdata('sortby-category');
                $f=$data[0];
                $od=$data[1];
            }else{
                $f='created';
                $od='desc';
            }
        }
		$aurl= explode('/',uri_string());
        $link=$aurl[1];
		if (!empty($_POST['link'])) {
			$link=$_POST['link'];
		}
        $catid=$this->Mcategory->category_id($link);
        $listcat=$this->Mcategory->category_listcat($catid);
        $this->data['categoryname']=$this->Mcategory->category_name($catid);
		$this->data['link']=$this->Mcategory->category_link($catid);

        $this->load->library('phantrang');
        $limit=12;
        $current=$this->phantrang->PageCurrent();
        $first=$this->phantrang->PageFirst($limit, $current);
        $total=$this->Mproduct->product_chude_count($listcat);
        $this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='san-pham/'.$link);
        $this->data['list']=$this->Mproduct->product_list_cat_limit($listcat, $limit,$first,$f,$od);
        $this->data['title']='OCOP CHƯPƯH - Sản phẩm theo từng danh mục';
        $this->data['view']='category';
        if(isset($_POST['sapxep-category'])){
			$result=$this->load->view('frontend/components/sanpham/index_order',$this->data,true);
            echo json_encode($result);
            // $html='<script>window.location.reload();</script>';
            // echo json_encode($html);

        }else{
            $this->load->view('frontend/layout',$this->data);
        }
    }

	public function diaban(){
        if(isset($_POST['sapxep-category'])){
            $dksx=$_POST['sapxep-category'];
            $char = explode('-', $dksx);
            $f=$char[0];
            $od=$char[1];
            $data = array('0' => $f, '1' =>$od);
            $this->session->set_userdata('sortby-category', $data);
        }else{
            if($this->session->userdata('sortby-category')){
                $data = $this->session->userdata('sortby-category');
                $f=$data[0];
                $od=$data[1];
            }else{
                $f='created';
                $od='desc';
            }
        }
		if (!empty($_POST['link'])) {
			$link=$_POST['link'];
		}else{
			$aurl= explode('/',uri_string());
			$link=$aurl[2];
		}
        $catid=$this->Mproducer->diaban_id($link);
        $listcat=$this->Mproducer->diaban_listcat($catid);
        $this->data['categoryname']=$this->Mproducer->diaban_name($catid);
		$this->data['link']=$this->Mproducer->diaban_link($catid);

        $this->load->library('phantrang');
        $limit=12;
        $current=$this->phantrang->PageCurrent();
        $first=$this->phantrang->PageFirst($limit, $current);
        $total=$this->Mproduct->product_diban_count($listcat);
        $this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='san-pham/db/'.$link);
        $this->data['list']=$this->Mproduct->product_list_diaban_limit($listcat, $limit,$first,$f,$od);
        $this->data['title']='OCOP CHƯPƯH - Sản phẩm theo từng danh mục';
        $this->data['view']='diaban';
        if(isset($_POST['sapxep-category'])){

            $result=$this->load->view('frontend/components/sanpham/index_order',$this->data,true);
            echo json_encode($result);
            // $html='<script>window.location.reload();</script>';
            // echo json_encode($html);

        }else{
            $this->load->view('frontend/layout',$this->data);
        }
    }
    public function detail($link){
        $row = $this->Mproduct->product_detail($link);
        $this->data['row']=$row;
		$datastar = $this->Mevaluate->comment_productid_count($row['id']);
		$star1 = 0;
		$total1 = 0;
		$star2 = 0;
		$total2 = 0;
		$star3 = 0;
		$total3 = 0;
		$star4 = 0;
		$total4 = 0;
		$star5 = 0;
		$total5 = 0;
		foreach ($datastar as $st) {
			if($st['star'] == 1){
				$star1 = 1;
				$total1 =  $st['total'];
			}else if($st['star'] == 2){
				$star2 = 1;
				$total2 = $st['total'];
			}else if($st['star'] == 3){
				$star3 = 1;
				$total3 = $st['total'];
			}else if($st['star'] == 4){
				$star4 = 1;
				$total4 = $st['total'];
			}else if($st['star'] == 5){
				$star5 = 1;
				$total5 = $st['total'];
			}
		}
		$sum = ($total1 + $total2 + $total3 + $total4 + $total5);
		if($sum >0){
			$AverageRating = (((1*$total1)+(2*$total2)+(3*$total3)+(4*$total4)+(5*$total5))/ $sum);
		}else{
			$AverageRating = 4;
		}
		$this->data['title']='OCOP CHƯPƯH - '.$row['name'];
		$this->data['view']='detail';
		$this->data['star1']=$star1;
		$this->data['star2']=$star2;
		$this->data['star3']=$star3;
		$this->data['star4']=$star4;
		$this->data['star5']=$star5;
		$this->data['total1']=$total1;
		$this->data['total2']=$total2;
		$this->data['total3']=$total3;
		$this->data['total4']=$total4;
		$this->data['total5']=$total5;
		$this->data['avg']=$AverageRating;
		$this->data['listhd'] = $this->Mhoidapcoso->hoidap_byId($row['id'],2);
		$starData = array('star' => $AverageRating);
		$this->Mproduct->product_update($starData, $row['id']);
        $this->load->view('frontend/layout',$this->data);
    }

    public function addcart(){
        $this->load->library('session');
        $id=$_POST['id'];
        if($this->session->userdata('cart')){
            $cart=$this->session->userdata('cart');
            if(array_key_exists($id, $cart)){
                $cart[$id]++;
            }else{
                $cart[$id] = 1;
            }
        }else{
            $cart[$id]=1;
        }
        $this->session->set_userdata('cart',$cart);
        echo json_encode( $cart );
    }

    public function update(){
        $this->load->library('session');
        $id=$_POST['id'];
        if($this->session->userdata('cart')){
            $cart=$this->session->userdata('cart');
            if(array_key_exists($id, $cart)){
                $cart[$id]=(int)($_POST['sl']);
            }
        }
        $this->session->set_userdata('cart',$cart);
        echo json_encode( $cart );
    }

    public function remove(){
        $this->load->library('session');
        $id=$_POST['id'];
        if($this->session->userdata('cart')){
            $cart=$this->session->userdata('cart');
            if($cart[$id]){
                unset($cart[$id]);
            }
        }
        $this->session->set_userdata('cart',$cart);
        $this->session->set_userdata('coupon_price');
        echo json_encode( $cart );

    }


	public function insertCmt(){
		$d=getdate();
		$today=$d['year']."/".$d['mon']."/".$d['mday']." ".$d['hours'].":".$d['minutes'].":".$d['seconds'];
		$id=$_POST['id'];
		$comment=$_POST['comment'];
		$userComment=$_POST['userComment'];
		$sdt=$_POST['sdt'];
		if(!empty($_POST['star'])){
			$star=$_POST['star'];
		}
		$mydata= array(
					'product_id' =>$id,
					'content' =>$comment,
					'user_name' =>$userComment,
					'sdt' =>$sdt,
					'star' =>$star,
					'comment_time' =>$today,
					'trash'=>1
				);
		$this->Mevaluate->comment_insert($mydata);
		echo json_encode( $mydata );
	}
}
