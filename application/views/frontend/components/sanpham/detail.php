<section id="product-detail">
	<div class="container">
		<div class="products-wrap">
			<form action="" method="post" id="ProductDetailsForm">
				<?php if ($row) : ?>
					<div class="breadcrumbs">
						<ul>
							<li class="home">
								<a href="trang-chu" title="Go to Home Page">Trang chủ</a>
								<i class="fa fa-angle-right"></i>
							</li>
							<li class="category3">
								<a href="<?php echo base_url() ?>/san-pham/<?php $link = $this->Mcategory->category_link($row['catid']);
																			echo $link; ?>" title=""><?php $name = $this->Mcategory->category_name($row['catid']);
																																								echo $name; ?></a>
								<i class="fa fa-angle-right"></i>
							</li>
							<li class="product"><?php echo $row['name'] ?></li>
						</ul>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 listimg-desc-product">
						<?php $this->load->view('frontend/modules/jcarousel'); ?>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<div class="product-view-content">
							<div class="product-view-name">
								<h1><?php echo $row['name'] ?></h1>
							</div>
							<div class="lt-product-star-2">
								<?php if ($avg <= 1 ) : ?>
									<span class="fa fa-star"></span>
								<?php elseif ($avg > 1 && $avg <= 2) : ?>
									<span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
								<?php elseif ($avg > 2 && $avg <= 3) : ?>
									<span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
								<?php elseif ($avg > 3 && $avg <= 4) : ?>
									<span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
								<?php elseif ($avg > 4 && $avg <= 5) : ?>
									<span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
									<span class="fa fa-star"></span>
								<?php endif; ?>
							</div>
							<div class="product-view-price">
								<div class="pull-left">
									<span class="price-label">Giá bán:</span>
									<span class="price"><?php echo number_format($row['price_sale']) ?>₫</span>
								</div>
								<?php if ($row['price_sale'] > 0 && $row['sale'] > 0) : ?>
									<div class="product-view-price-old">
										<span class="price"><?php echo $row['price'] ?>₫</span>
										<span class="sale-flag">-<?php echo $row['sale'] ?>%</span>
									</div>
								<?php endif; ?>
							</div>
							<div class="product-status" style="margin-top:0 !important;height: 22px;">
								<div class="pull-left">
									<span class="price-label">Doanh nghiệp sản xuất:</span>
									<a href="<?php echo base_url() ?>doanhngiep/detail/<?php $producer = $this->Muser->user_detail_id_fg($row['userId']);
																						echo $producer['id'] ?>" title=""><strong><span style="color:red"><?php $producer = $this->Muser->user_detail_id_fg($row['userId']);
																																																							echo $producer['fullname'] ?></span></strong></a>
								</div>
							</div>
							<div class="product-status">
								<p style=" float: left;margin-right: 10px;">Thương hiệu: <?php $name = $this->Mcategory->category_name($row['catid']);
																							echo $name; ?></p>
								<p>| Tình trạng: <?php if ($row['number'] - $row['number_buy'] == 0 || $row['status'] == 0) echo 'Hết hàng';
													else echo 'Còn hàng' ?></p>
							</div>
							<div class="product-view-desc">
								<h4>Mô tả:</h4>
								<p><?php echo $row['sortDesc'] ?></p>
							</div>
							<div class="actions-qty">
								<?php
								if ($row['number'] - $row['number_buy'] == 0 || $row['status'] == 0) {
									echo '<h2 style="color:red;">Ngừng kinh doanh</h2>';
								} else {
									echo '<div class="actions-qty__button">
									<button class="button btn-cart add_to_cart_detail detail-button" title="Mua ngay" type="button" aria-label="Mua ngay" class="fa fa-shopping-cart" onclick="onAddCart(' . $row['id'] . ')"> Mua ngay</button>
								</div>';
								}
								?>
							</div>
							<div class="fk-boxs" id="km-all" data-comt="False">
								<div id="km-detail">
									<p class="fk-tit">Khuyến mại đặc biệt (SL có hạn)</p>
									<div class="fk-main">
										<div class="fk-sales">
											</ul>
											<ul>
												<li>Đặt online giao tận nhà <strong>ĐÚNG GIỜ </strong></li>
											</ul>
											<ul>
												<li>Đổi, trả sản phẩm trong 72 giờ</li>
											</ul>
											<ul>
												<li>Khuyến mãi chỉ áp dụng mua Online</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<!-- <div style="margin-top: 20px;">
								<b>Tình trạng</b>
								<br>
								<span>Nguyên hộp. Đầy đủ phụ kiện từ nhà sản xuất, gồm: Sạc, cáp, tai nghe, que lấy SIM, sách hướng dẫn</span>
							</div>
							<div style="margin-top: 20px;">
								<b>Bảo hành</b>
								<br>
								<span>Bảo hành 12 tháng tại trung tâm bảo hành Chính hãng. 1 đổi 1 trong 30 ngày nếu có lỗi nhà sản xuất.</span><a href="#" style="color:red"> (Chi tiết)</a>
							</div> -->
						</div>
					</div>
					<div class="product-v-desc col-md-10 col-12 col-xs-12">
						<h3>Đặc điểm nổi bật</h3>
						<?php echo $row['detail'] ?>
					</div>
					<div class="product-comment product-v-desc">
						<h3>Bình luận</h3>
						<div class="col-sm-12 col-xs-12 col-md-4 col-lg-4">
							<?php if ($star5 == 0) : ?>
								<div class="row">
									<div class="side">
										<div class="star-col">5 ★</div>
									</div>
									<div class="middle">
										<div class="bar-container">
											<div class="bar-5"></div>
										</div>
									</div>
									<div class="side right-ct">
										<div>0</div>
									</div>
								</div>
							<?php else : ?>
								<div class="row">
									<div class="side">
										<div class="star-col">5 ★</div>
									</div>
									<div class="middle">
										<div class="bar-container">
											<div class="bar-5"></div>
										</div>
									</div>
									<div class="side right-ct">
										<div><?php echo $total5 ?></div>
									</div>
								</div>
							<?php endif; ?>

							<?php if ($star4 == 0) : ?>
								<div class="row">
									<div class="side">
										<div class="star-col">4 ★</div>
									</div>
									<div class="middle">
										<div class="bar-container">
											<div class="bar-4"></div>
										</div>
									</div>
									<div class="side right-ct">
										<div>0</div>
									</div>
								</div>
							<?php else : ?>
								<div class="row">
									<div class="side">
										<div class="star-col">4 ★</div>
									</div>
									<div class="middle">
										<div class="bar-container">
											<div class="bar-4"></div>
										</div>
									</div>
									<div class="side right-ct">
										<div><?php echo $total4 ?></div>
									</div>
								</div>
							<?php endif; ?>
							<?php if ($star3 == 0) : ?>
								<div class="row">
									<div class="side">
										<div class="star-col">3 ★</div>
									</div>
									<div class="middle">
										<div class="bar-container">
											<div class="bar-3"></div>
										</div>
									</div>
									<div class="side right-ct">
										<div>0</div>
									</div>
								</div>
							<?php else : ?>
								<div class="row">
									<div class="side">
										<div class="star-col">3 ★</div>
									</div>
									<div class="middle">
										<div class="bar-container">
											<div class="bar-3"></div>
										</div>
									</div>
									<div class="side right-ct">
										<div><?php echo $total3 ?></div>
									</div>
								</div>
							<?php endif; ?>
							<?php if ($star2 == 0) : ?>
								<div class="row">
									<div class="side">
										<div class="star-col">2 ★</div>
									</div>
									<div class="middle">
										<div class="bar-container">
											<div class="bar-2"></div>
										</div>
									</div>
									<div class="side right-ct">
										<div>0</div>
									</div>
								</div>
							<?php else : ?>
								<div class="row">
									<div class="side">
										<div class="star-col">2★</div>
									</div>
									<div class="middle">
										<div class="bar-container">
											<div class="bar-2"></div>
										</div>
									</div>
									<div class="side right-ct">
										<div><?php echo $total2 ?></div>
									</div>
								</div>
							<?php endif; ?>
							<?php if ($star1 == 0) : ?>
								<div class="row">
									<div class="side">
										<div class="star-col">1 ★</div>
									</div>
									<div class="middle">
										<div class="bar-container">
											<div class="bar-1"></div>
										</div>
									</div>
									<div class="side right-ct">
										<div>0</div>
									</div>
								</div>
							<?php else : ?>
								<div class="row">
									<div class="side">
										<div class="star-col">1 ★</div>
									</div>
									<div class="middle">
										<div class="bar-container">
											<div class="bar-1"></div>
										</div>
									</div>
									<div class="side right-ct">
										<div><?php echo $total1 ?></div>
									</div>
								</div>
							<?php endif; ?>
						</div>
					</div>
					<div class="col-sm-12 col-xs-12 col-md-6 col-lg-6 rating">
						<label>
							<input type="radio" name="starsrt" value="1" />
							<span class="icon">★</span>
						</label>
						<label>
							<input type="radio" name="starsrt" value="2" />
							<span class="icon">★</span>
							<span class="icon">★</span>
						</label>
						<label>
							<input type="radio" name="starsrt" value="3" />
							<span class="icon">★</span>
							<span class="icon">★</span>
							<span class="icon">★</span>
						</label>
						<label>
							<input type="radio" name="starsrt" value="4" />
							<span class="icon">★</span>
							<span class="icon">★</span>
							<span class="icon">★</span>
							<span class="icon">★</span>
						</label>
						<label>
							<input type="radio" name="starsrt" value="5" />
							<span class="icon">★</span>
							<span class="icon">★</span>
							<span class="icon">★</span>
							<span class="icon">★</span>
							<span class="icon">★</span>
						</label>
					</div>

					<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 mg-sp">
						<textarea class="textarea-sp" id="commentContent" placeholder="Mời bạn đánh giá về sản phẩm..."></textarea>
					</div>

					<!-- <div class="col-sm-12 col-xs-12 col-md-4 col-lg-4 mg-sp">
						<input type="text" id="nguoi_gui" class="form-control" placeholder="Nhập tên">
					</div>

					<div class="col-sm-12 col-xs-12 col-md-4 col-lg-4 mg-sp" style="margin-left:20px">
						<input type="text" id="sdt" class="form-control" placeholder="Nhập Số điện thoại">
					</div> -->

					<div class="col-sm-12 col-xs-12 col-md-6 col-lg-6">
						<?php if ($this->session->userdata('sessionKhachHang')) : ?>
							<button class="btn btn-primary" type="button" onclick="submitComment(<?php echo $row['id'] ?>)">Gửi</button>
						<?php else : ?>
							<a class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Bạn cần đăng nhập để gửi câu hỏi !">Gửi</a>
						<?php endif; ?>

					</div>

					<!-- Hiện comment tại đây -->
					<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12">
						<div class="fb-comments" data-href="<?php echo base_url() ?><?php echo $row['alias'] ?>" data-numposts="5">
							<?php $list_comment = $this->Mevaluate->comment_productid($row['id']); ?>
							<?php
							if (count($list_comment) > 0) : ?>
								<?php foreach ($list_comment as $comment) : ?>
									<div class="col-12 col-md-12 comment-item" style="border-top: 2px solid #e6e6e6; margin-top:10px">
										<h4><?php echo $comment['user_name'] ?>
											&nbsp; &nbsp;
											<span class="<?php if ($comment['star'] >= 1) {
																echo 'fa fa-star';
															} else {
																echo 'fa fa-star no';
															} ?>"></span>
											<span class="<?php if ($comment['star'] >= 2) {
																echo 'fa fa-star';
															} else {
																echo 'fa fa-star no';
															} ?>"></span>
											<span class="<?php if ($comment['star'] >= 3) {
																echo 'fa fa-star';
															} else {
																echo 'fa fa-star no';
															} ?>"></span>
											<span class="<?php if ($comment['star'] >= 4) {
																echo 'fa fa-star';
															} else {
																echo 'fa fa-star no';
															} ?>"></span>
											<span class="<?php if ($comment['star'] >= 5) {
																echo 'fa fa-star';
															} else {
																echo 'fa fa-star no';
															} ?>"></span>
											<input type="hidden" name="whatever1" class="rating-value" value="2.56">
										</h4>
									</div>
									<div class="col-12 col-md-12" style="margin-bottom: 10px;">
										<span><?php echo $comment['content'] ?> &nbsp; &nbsp; <?php echo $comment['comment_time'] ?></span>
									</div>
								<?php endforeach; ?>
							<?php else : ?>
								<h4>Chưa có bình luận về sản phẩm</h4>
							<?php endif; ?>
						</div>
					</div>
		</div>
		<!-- Hỏi đáp -->
		<div class="product-comment product-v-desc">
			<h3>Hỏi đáp</h3>
			<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12">
				<textarea class="textarea-sp" id="questionPContent" placeholder="Mời bạn đặt câu hỏi..."></textarea>
			</div>
			<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12" style="margin-bottom:15px">
				<?php if ($this->session->userdata('sessionKhachHang')) : ?>
					<button class="btn btn-primary" type="button" onclick="submitAnswer(<?php echo $row['id'] ?>)">Gửi</button>
				<?php else : ?>
					<a class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Bạn cần đăng nhập để gửi câu hỏi !" >Gửi</a>
				<?php endif; ?>
			</div>
			<?php if(count($listhd)==0): ?>
				<p  style="font-style:italic; color:darkgoldenrod">Hiện chưa có câu hỏi nào !</p>
			<?php else : ?>
            <?php foreach ($listhd as $sphd) :?>
				<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12" style="border-bottom:1px solid #bbb;   margin-bottom: 10px;">
					<p class="aq-text"><?php echo $sphd['question_by']; ?>: <?php echo $sphd['question']; ?></p>
					<?php if (empty($sphd['answer'])) : ?>
						<p class="aq-text" style="font-style:italic; color:darkgoldenrod">Nhà sản xuất chưa trả lời</p>
					<?php else : ?>
						<p class="aq-text"  style="padding-left:10px"><?php echo $sphd['answer_by']; ?>: <?php echo $sphd['answer']; ?></p>
					<?php endif; ?>
				</div>
            <?php endforeach; ?>
            <?php endif; ?>
		</div>
		<!-- Sản phẩm liên quan -->
		<div class="product-comment product-v-desc product">
			<h3>Sản phẩm liên quan</h3>
			<?php
				$list_spcungloai = $this->Mproduct->product_cungloai($row['catid'], $row['id'], 5); ?>
			<?php
				if (count($list_spcungloai) > 0) : ?>
				<div class="product-container">
					<div class="owl-carousel-product-cl owl-carousel owl-theme">
						<?php foreach ($list_spcungloai as $sp) : ?>
							<div class="item">
								<div class="product-lt">
									<div class="lt-product-group-image">
										<a href="<?php echo $sp['alias'] ?>" title="<?php echo $sp['name'] ?>">
											<img class="img-p" src="public/images/products/<?php echo $sp['avatar'] ?>" alt="">
										</a>

										<?php if ($sp['sale'] > 0) : ?>
											<div class="giam-percent">
												<span class="text-giam-percent">Giảm <?php echo $sp['sale'] ?>%</span>
											</div>
										<?php endif; ?>
									</div>

									<div class="lt-product-group-info">
										<a href="<?php echo $sp['alias'] ?>" title="<?php echo $sp['name'] ?>" style="text-align: left;">
											<h3><?php echo $sp['name'] ?></h3>
										</a>
										<div class="price-box">
											<?php if ($sp['sale'] > 0) : ?>

												<p class="old-price">
													<span class="price"><?php echo (number_format($sp['price'])); ?>₫</span>
												</p>
												<p class="special-price">
													<span class="price"><?php echo (number_format($sp['price_sale'])); ?>₫</span>
												</p>
											<?php else : ?>
												<!-- <p class="old-price">
													<span class="price" style="color: #fff"><?php echo (number_format($sp['price'])); ?>₫</span>
												</p> -->
												<p class="special-price">
													<span class="price"><?php echo (number_format($sp['price'])); ?>₫</span>
												</p>
											<?php endif; ?>
										</div>
										<div class="clear"></div>
									</div>
								</div>
							</div>
						<?php endforeach; ?>
					</div>
				<?php else : ?>
					<h4>Chưa có sản phẩm cùng loại</h4>
				<?php endif; ?>
				</div>
			<?php endif; ?>
			</form>

		</div>
		<div class="modal fade custom-modal" id="myModal">
		<div class="modal-dialog modal-sm" style="top:100px">
			<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">Thông báo</h4>
			</div>
			<div class="modal-body">
				<strong><p>Sản phẩm đã được thêm thành công&hellip;</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" onclick="reLoad()">Ok</button>
			</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	</div>
</section>
<script>
	function reLoad(){
		$('#myModal').modal('hide');
		window.location.reload();
	}
	function onAddCart(id) {
		var strurl = "<?php echo base_url(); ?>" + '/sanpham/addcart';
		jQuery.ajax({
			url: strurl,
			type: 'POST',
			dataType: 'json',
			data: {
				id: id
			},
			success: function(data) {
				$('#myModal').modal('show');
			}
		});
	}

	function submitComment(id) {
		var strurl = "<?php echo base_url(); ?>" + 'sanpham/insertCmt';
		var comment = $("#commentContent").val();
		// var userComment = $("#nguoi_gui").val();
		// var sdt = $("#sdt").val();
		var star = $("input[name='starsrt']:checked").val();
		var validate = false;
		if (comment === "" ) {
			$("#commentContent").focus();
		} else {
			validate = true;
		}
		if (validate) {
			jQuery.ajax({
				url: strurl,
				type: 'POST',
				dataType: 'json',
				data: {
					id: id,
					comment: comment,
					userComment: '<?php $info = $this->session->userdata('sessionKhachHang');echo $info['username'] ?>',
					sdt: '<?php $info = $this->session->userdata('sessionKhachHang');echo $info['phone'] ?>',
					star: star
				},
				success: function(data) {
					window.location.reload(true);
				}
			});
		}
	};

	$( document ).ready(function() {
		var total1 =<?php echo $total1 ?>;
		var total2 =<?php echo $total2 ?>;
		var total3 =<?php echo $total3 ?>;
		var total4 =<?php echo $total4 ?>;
		var total5 =<?php echo $total5 ?>;

		var tong = total1 + total2 + total3 + total4 + total5;
		$(".bar-1").css({ width: (total1/tong)*100+'%' });
		$(".bar-2").css({ width: (total2/tong)*100+'%'});
		$(".bar-3").css({ width: (total3/tong)*100+'%'});
		$(".bar-4").css({ width: (total4/tong)*100+'%'});
		$(".bar-5").css({ width: (total5/tong)*100+'%'});
	});

	function submitAnswer(id) {

	var strurl = "<?php echo base_url(); ?>" + 'doanhngiep/insertQuestion';
	var comment = $("#questionPContent").val();
	var validate = false;
	if (comment === "") {
		$("#questionPContent").focus();
	} else {
		validate = true;
	}
	if (validate) {
		jQuery.ajax({
			url: strurl,
			type: 'POST',
			dataType: 'json',
			data: {
				id: id,
				question: comment,
				type:2,
				question_by: '<?php $info = $this->session->userdata('sessionKhachHang');echo $info['username'] ?>',
			},
			success: function(data) {
				window.location.reload(true);
			}
		});
	}
	};
</script>