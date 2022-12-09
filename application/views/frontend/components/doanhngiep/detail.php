<section id="product-all" class="collection">
	<div class="slider">
		<div class="container">
			<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
				<div class="list-menu pull-left col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<?php $this->load->view('frontend/modules/category'); ?>
				</div>
				<?php $this->load->view('frontend/modules/product-sale'); ?>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 product-content">
				<div class="container" style="color:#262144">
					<h3 style="margin-top:10px"><?php echo $row['fullname'] ?><i style="font-size:20px; margin-left:5px" class="glyphicon glyphicon-ok-circle"></i></h3>
				</div>
				<div class="container">
					<div class="flexslider">
						<div data-thumb="public/images/admin/<?php echo $row['img'] ?>">
							<div class="thumb-image"> <img style="width:30%; border-radius:6px" src="public/images/admin/<?php echo $row['img']; ?>" class="img-responsive"> </div>
						</div>
					</div>
				</div>
				<div class="container">
					<ul style="margin-bottom:15px" class="nav nav-pills mb-3 dn-detail" id="pills-tab" role="tablist">
						<li class="nav-item ">
							<a class="nav-link" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">Thông tin</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">Sản Phẩm</a>
						</li>
						<li class="nav-item active">
							<a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">Liên hệ</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-danhgia" role="tab" aria-controls="pills-danhgia" aria-selected="false">Đánh giá</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-hoidap" role="tab" aria-controls="pills-hoidap" aria-selected="false">Hỏi & Đáp</a>
						</li>
					</ul>
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane detail-dn products-grid clearfix" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab"><span><?php echo $row['detail'] ?></span></div>
						<div class="tab-pane detail-dn products-grid clearfix" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">

							<?php if (count($list) == 0) : ?>
								<p class="no-products"> Doanh nghiệp hiện chưa có sản phẩm nào !</p>
							<?php else : ?>
								<?php foreach ($list as $sp) : ?>
									<div class="col-md-4 col-lg-4 col-xs-6 col-6 detail-box">
										<div class="product-lt">
											<div class="lt-product-group-image">
												<a id="zoomOut" href="<?php echo $sp['alias'] ?>" title="<?php echo $sp['name'] ?>">
													<figure>
														<img class="img-p" src="public/images/products/<?php echo $sp['avatar'] ?>" alt="">
													</figure>
												</a>

												<?php if ($sp['sale'] > 0) : ?>
													<div class="giam-percent">
														<span class="text-giam-percent">Giảm <?php echo $sp['sale'] ?>%</span>
													</div>
												<?php endif; ?>
											</div>

											<div class="lt-product-group-info">
												<a href="<?php echo $sp['alias'] ?>" title="<?php echo $sp['name'] ?>">
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

								<div class="text-center pull-right">
									<ul class="pagination">
										<?php echo $strphantrang; ?>
									</ul>
								</div>
							<?php endif; ?>
						</div>
						<div class="tab-pane active detail-dn products-grid clearfix" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
							<table class="table table-hover">
								<thead>
									<tr>
										<th colspan="2" style="background:#262144; color:#fff">Thông tin liên hệ</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Tên cơ sở kinh doanh</td>
										<td><?php echo $row['fullname'] ?></td>
									</tr>
									<tr>
										<td>Số điện thoại</td>
										<td><?php echo $row['phone'] ?></td>
									</tr>
									<tr>
										<td>Địa chỉ</td>
										<td><?php echo $row['address'] ?></td>
									</tr>
									<tr>
										<td>email</td>
										<td><?php echo $row['email'] ?></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab-pane detail-dn products-grid clearfix" id="pills-danhgia" role="tabpanel" aria-labelledby="pills-home-tab">
							<h2 style="margin-top:0">Đánh giá nhận xét về cơ sở kinh doanh</h2>
							<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 rating" style="margin-top:10px">
								<label>
									<input type="radio" name="starpr" value="1" />
									<span class="icon">★</span>
								</label>
								<label>
									<input type="radio" name="starpr" value="2" />
									<span class="icon">★</span>
									<span class="icon">★</span>
								</label>
								<label>
									<input type="radio" name="starpr" value="3" />
									<span class="icon">★</span>
									<span class="icon">★</span>
									<span class="icon">★</span>
								</label>
								<label>
									<input type="radio" name="starpr" value="4" />
									<span class="icon">★</span>
									<span class="icon">★</span>
									<span class="icon">★</span>
									<span class="icon">★</span>
								</label>
								<label>
									<input type="radio" name="starpr" value="5" />
									<span class="icon">★</span>
									<span class="icon">★</span>
									<span class="icon">★</span>
									<span class="icon">★</span>
									<span class="icon">★</span>
								</label>
							</div>
							<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 mg-sp">
								<textarea class="textarea-sp" id="commentContent" placeholder="Mời bạn đánh giá về cơ sở..."></textarea>
							</div>
							<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 mg-sp">
								<?php if ($this->session->userdata('sessionKhachHang')) : ?>
									<button class="btn btn-primary" type="button" onclick="submitStar(<?php echo $row['id'] ?>)">Gửi</button>
								<?php else : ?>
									<button class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Bạn cần đăng nhập để đánh giá !">Gửi</button>
								<?php endif; ?>
							</div>
						</div>


						<div class="tab-pane detail-dn products-grid clearfix" id="pills-hoidap" role="tabpanel" aria-labelledby="pills-home-tab" style="max-height:300px;overflow-y:auto">
								<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 mg-sp">
									<textarea class="textarea-sp" id="questionContent" placeholder="Mời bạn đặt câu hỏi..."></textarea>
								</div>
								<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 mg-sp" style="margin-bottom:15px">
									<?php if ($this->session->userdata('sessionKhachHang')) : ?>
										<button class="btn btn-primary" type="button" onclick="submitAnswer(<?php echo $row['id'] ?>)">Gửi</button>
									<?php else : ?>
										<button class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Bạn cần đăng nhập để gửi câu hỏi !">Gửi</button>
									<?php endif; ?>
								</div>
								<hr>

								<span style="color:red">A&Q: <?php echo $row['fullname'] ?></span>
								<?php if(count($listhd)==0): ?>
									<p  style="font-style:italic; color:darkgoldenrod">Chưa có câu hỏi nào !</p>
								<?php else : ?>
                                <?php foreach ($listhd as $sphd) :?>
									<div class="col-sm-12 col-xs-12 col-md-12 col-lg-12 mg-sp" style="border-bottom:1px solid #bbb">
										<p class="aq-text">Câu hỏi: <?php echo $sphd['question']; ?></p>
										<?php if (empty($sphd['answer'])) : ?>
											<p class="aq-text" style="font-style:italic; color:darkgoldenrod">Nhà sản xuất chưa trả lời</p>
										<?php else : ?>
											<p class="aq-text">Trả lời: <?php echo $sphd['answer']; ?></p>
										<?php endif; ?>
									</div>
                                <?php endforeach; ?>
                            </div>

                            <div class = "text-center pull-right">
                                <ul class ="pagination">
                                    <?php echo $strphantrang; ?>
                                </ul>
                            </div>
                        <?php endif; ?>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	</div>
</section>
<script type="text/javascript">
	function submitStar(id) {

		var strurl = "<?php echo base_url(); ?>" + 'doanhngiep/insertCmt';
		var star = $("input[name='starpr']:checked").val();
		var comment = $("#commentContent").val();
		var validate = false;
		if (comment === "") {
			if (comment == "") {
				$("#commentContent").focus();
			}
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

	function submitAnswer(id) {

		var strurl = "<?php echo base_url(); ?>" + 'doanhngiep/insertQuestion';
		var comment = $("#questionContent").val();
		var validate = false;
		if (comment === "") {
			if (comment == "") {
				$("#questionContent").focus();
			}
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
					type:1,
					question_by: '<?php $info = $this->session->userdata('sessionKhachHang');echo $info['username'] ?>',
				},
				success: function(data) {
					window.location.reload(true);
				}
			});
		}
	};
</script>