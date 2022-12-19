<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Doanhngiep extends CI_Controller {
    function __construct() {
        parent::__construct();
        $this->load->model('frontend/Mproduct');
		$this->load->model('frontend/Mproducer');
        $this->load->model('frontend/Mcategory');
		$this->load->model('frontend/Mevaluate');
		$this->load->model('frontend/Mcosodanhgia');
		$this->load->model('frontend/Mhoidapcoso');
		$this->load->model('backend/Muser');
        $this->data['com']='doanhngiep';
        $this->load->library('session');
        $this->load->library('phantrang');
    }

    public function detail($link){
		$row = $this->Muser->user_detail_id_fg($link);
		$this->load->library('phantrang');
        $limit=10;
        $current= 1;
        $first=$this->phantrang->PageFirst($limit, $current);
        $total=$this->Mproduct->product_sanpham_id_count($row['id']);
		$this->data['strphantrang']=$this->phantrang->PagePer($total, $current, $limit, $url='doanhngiep');
		$this->data['list'] = $this->Mproduct->product_sanpham_id($limit,$first,$row['id']);
		$this->data['listhd'] = $this->Mhoidapcoso->hoidap_byId($row['id'],1);
		$this->data['row']=$row;
        $this->data['title']='TEMPO  - Giới thiệu';
        $this->data['view']='detail';
		$this->load->view('frontend/layout',$this->data);
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
					'producer_id' =>$id,
					'content' =>$comment,
					'user_name' =>$userComment,
					'sdt' =>$sdt,
					'star' =>$star,
					'comment_time' =>$today,
					'trash'=>1
				);
		$this->Mcosodanhgia->comment_insert($mydata);
		$datastar = $this->Mcosodanhgia->comment_producerid_count($id);
		$total1 = 0;
		$total2 = 0;
		$total3 = 0;
		$total4 = 0;
		$total5 = 0;
		foreach ($datastar as $st) {
			if($st['star'] == 1){
				$total1 =  $st['total'];
			}else if($st['star'] == 2){
				$total2 = $st['total'];
			}else if($st['star'] == 3){
				$total3 = $st['total'];
			}else if($st['star'] == 4){
				$total4 = $st['total'];
			}else if($st['star'] == 5){
				$total5 = $st['total'];
			}
		}
		$sum = ($total1 + $total2 + $total3 + $total4 + $total5);
		if($sum >0){
			$AverageRating = (((1*$total1)+(2*$total2)+(3*$total3)+(4*$total4)+(5*$total5))/ $sum);

		}else{
			$AverageRating = 4;
		}
		$starData = array('star' => $AverageRating);
		$this->Muser->user_update($starData, $id);
		echo json_encode( $mydata );
	}

	public function insertQuestion(){
		$d=getdate();
		$today=$d['year']."/".$d['mon']."/".$d['mday']." ".$d['hours'].":".$d['minutes'].":".$d['seconds'];
		$id=$_POST['id'];
		$question=$_POST['question'];
		$mydata= array(
					'producer_id' =>$id,
					'question' =>$question,
					'question_by' =>$_POST['question_by'],
					'question_time' =>$today,
					'type' => $_POST['type'],
					'trash'=>1
				);
		$this->Mhoidapcoso->question_insert($mydata);
		echo json_encode( $mydata );
	}
}
