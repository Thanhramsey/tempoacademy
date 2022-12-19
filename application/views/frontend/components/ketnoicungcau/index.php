<?php
$user = $this->session->userdata('sessionKhachHang');
?>

<section>
	<div class="container">
		<div class="container">
			<div class="buy-center">
				<div class="box-mark">
					<div class="row wrap-box-mark">
						<div class="col-md-4 col-xs-4">
							<div class="col-mark">
								<a href="ketnoicungcau/cung">
									<img src="public/images/ketnoicungcau/mua.png" class="cursorsHover" style="width:100%;height:100%">
									<div class="headingmark cursorsHover">Cần mua</div>
								</a>
							</div>
						</div>
						<div class="col-md-4 col-xs-4">
							<div class="col-mark">
								<a href="ketnoicungcau/cau">
									<img src="public/images/ketnoicungcau/ban.png" class="cursorsHover" style="width:100%;height:100%">
									<div class="headingmark cursorsHover">Cần bán</div>
								</a>
							</div>
						</div>
						<div class="col-md-4 col-xs-4">
							<div class="col-mark">
								<a href="ketnoicungcau/doitac">
									<img src="public/images/ketnoicungcau/lienket.png" style="width:100%;height:100%">
									<div class="headingmark">Tìm đối tác</div>
								</a>
							</div>
						</div>
					</div>
				</div>


				<!-- Search form -->
				<div class="search-kncc">
					<div class=""></div>
					<div class="form-inline">
					<form style="width:100%" action="<?php echo base_url() ?>ketnoicungcau/timkiem" method="POST" accept-charset="utf-8">
						<div class="clearfix"></div>
						<div class="col-md-3 col-100">
							<div class="form-group" style="width: 100%">
								<div class="input-group" style="width: 100%">
									<select name="loaicungcau" id="loaicungcau" class="form-control">
										<option value="">[--Chọn loại--]</option>
										<option value="1">Cần mua</option>
										<option value="2">Cần bán</option>
										<option value="3">Tìm đối tác</option>
									</select>
								</div>
							</div>
						</div>

						<div class="col-md-4 col-100">
							<div class="form-group" style="width: 100%">
								<div class="input-group" style="width: 100%">
									<select name="loaisp" id="loaisp" class="form-control">
										<option value="">[--Chọn loại sản phẩm--]</option>
										<?php
										$listCat=$this->Mcategory->category_all();
										$option_parentid = "";
										foreach ($listCat as $r) {
											$option_parentid .= "<option value='" . $r['id'] . "'>" . $r['name'] . "</option>";
										}
										echo $option_parentid;
										?>
									</select>
								</div>
							</div>
						</div>
						<div class="col-md-3 col-100">
							<div class="form-group" style="width: 100%">
								<div class="input-group" style="width: 100%">
									<input style="width: 100%" value="" type="text" class="form-control" name="keyword" id="keyword" placeholder="Bạn cần tìm gì">
								</div>
							</div>
						</div>
						<div class="col-md-2 col-100">
							<div class="form-group" style="width: 100%">
								<div class="input-group" style="width: 100%">
									<button type="submit" class="btn-grid-search cursorsHover" id="btn-search-ads">Tìm kiếm</button>
								</div>
							</div>
						</div>
					</form>
					</div>
				</div>
				<!-- list ket noi -->
				<div class="row">
					<!-- list cung cầu -->
					<div class="col-md-8">
						<div class="row heading-page- ">
							<div class="col-md-6  col-xs-12  block-h1 results-typeAds">
								<h1>TIN ĐĂNG MỚI NHẤT :</h1>
								<h4 name="results-count"> <?php echo count($list) ?> kết quả</h4>
							</div>

							<div class="col-md-6  col-xs-12  block-h1" style="padding-right:15px !important">
								<?php if($this->session->userdata('sessionKhachHang')) :?>
									<button class="button-dangtin" data-toggle="modal" data-target="#cungcau_modal"><i class="fa fa-pencil" aria-hidden="true" style="margin-right: 10px;"></i>Đăng tin cung cầu</button>
								<?php else :?>
									<button class="button-dangtin" data-toggle="tooltip" data-placement="top" title="Bạn cần đăng nhập để có thể đăng tin cung cầu !"><i class="fa fa-pencil" aria-hidden="true" style="margin-right: 10px;"></i>Đăng tin cung cầu</button>
								<?php endif; ?>
							</div>
						</div>
						<div class="buy-center-linked-list ">
							<ul class="buy-center-linked-list-columns">
								<?php if (count($list) == 0) : ?>
									<p>Chưa có tin nào !</p>
								<?php else : ?>
									<?php foreach ($list as $sp) : ?>
										<li class="buy-li">
											<div class="col-md-9 col-sm-9 buy-left">
												<div class="news-buy">
													<div class="icon-buy-li">
														<a>
															<img style="width: 100%;height: 100%;" src="public/images/ketnoicungcau/<?php echo $sp['hinhanh'] ?>" alt="">
														</a>
													</div>
													<div class="wrap-buy-li">
														<h4><a class="help-center-link" href="#detail_modal" data-toggle="modal" data-detalhes='<?= json_encode($sp); ?>' data-id="<?php echo $sp['id'] ?>"><?php echo $sp['tieude'] ?>"</a></h4>
														<div class="info-buy">
															<span class="userport">
																<span><i class="glyphicon glyphicon-user" aria-hidden="true"></i><a href="#" class="cursorsHover"><?php echo $sp['nguoidang'] ?></a></span>
															</span>
															<span style="margin-left: 5px;margin-right: 5px">|</span>
															<span class="port-time">
																<span><i class="glyphicon glyphicon-time" aria-hidden="true"></i> <?php echo $sp['ngaydang'] ?></span>
															</span>
															<span style="margin-left: 5px;margin-right: 5px">|</span>
															<span class="port-time">
																<?php if ($sp['type'] == 1) : ?>
																	<span><i class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></i> Cần mua</span>
																<?php elseif ($sp['type'] == 2) : ?>
																	<span><i class="glyphicon glyphicon-leaf" aria-hidden="true"></i> Cần bán</span>
																<?php else : ?>
																	<span><i class="glyphicon glyphicon-lock" aria-hidden="true"></i> Tìm đối tác</span>
																<?php endif; ?>
															</span>
															<span style="margin-left: 5px;margin-right: 5px">|</span>
															<span class="port-time">
																<span><i class="glyphicon glyphicon-eye-open" aria-hidden="true"></i><?php echo $sp['luotxem'] ?> lượt xem</span>
															</span>
														</div>
														<div class="post-desc">
															<?php echo $sp['tieude'] ?>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-3 col-sm-3 text-l">
												<div class="post-area">
													<i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>
													<?php echo $sp['address'] ?>
												</div>
											</div>
											<div class="clearfix"></div>
										</li>
									<?php endforeach; ?>
							</ul>
							<div class="text-center pull-right">
								<ul class="pagination">
									<?php echo $strphantrang; ?>
								</ul>
							</div>
						<?php endif; ?>

						</div>
					</div>
					<!-- list nhà cung cấp -->
					<div class="col-md-4">
						<div class="ncc-center-topic">
							<div class="block-h1">
								<h1>Nhà cung cấp tiêu biểu</h1>
							</div>
							<div class="wrap-ncc-r match-my-cols is-flex1">
								<?php if (count($listShop) == 0) : ?>
									<p>Không có nhà cung cấp !</p>
								<?php else : ?>
									<?php foreach ($listShop as $ls) : ?>
										<div class="ncc-rightlist media">
											<a class="pull-left" href="doanhngiep/detail/<?php echo $ls['id'] ?>">
												<img style="width: 100%;height: 100%;" class="img-ncc-right-list" title="" alt="" src="public/images/admin/<?php echo $ls['img'] ?>">
											</a>
											<div class="media-body">
												<h4 class="media-heading"><a href="doanhngiep/detail/<?php echo $ls['id'] ?>"><?php echo $ls['fullname'] ?></a></h4>
												<p style="margin-bottom: 0"><b>Địa chỉ: <?php echo $ls['address'] ?></p>
											</div>
										</div>
									<?php endforeach; ?>
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

	<!--Detail modal  -->
	<div class="modal" id="detail_modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background: #262144;color: #fff">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 id="detail_title" class="modal-title">Modal header</h4>
				</div>
				<div class="modal-body">

						<div class="cungcau-row  row">
							<div class="col-lg-4">
								<label>Tiêu đề:</label>
							</div>
							<div class="col-lg-8" style="padding-left:50px">
								<span type="text" name="tieude"></span>
							</div>
						</div>

						<div class="cungcau-row  row">
							<div class="col-lg-4">
								<label>Người đăng:</label>
							</div>
							<div class="col-lg-8" style="padding-left:50px">
								<span type="text" name="nguoidang"></span>
							</div>
						</div>

						<div class="cungcau-row  row">
							<div class="col-lg-4">
								<label>Số liên lạc:</label>
							</div>
							<div class="col-lg-8" style="padding-left:50px">
								<span type="text" name="sdt"></span>
							</div>
						</div>


						<div class="cungcau-row  row">
							<div class="col-lg-4">
								<label>Địa chỉ:</label>
							</div>
							<div class="col-lg-8" style="padding-left:50px">
								<span type="text" name="address"></span>
							</div>
						</div>

						<div class="cungcau-row  row">
							<div class="col-lg-4">
								<label>Ngày đăng:</label>
							</div>
							<div class="col-lg-8" style="padding-left:50px">
								<span type="text" name="ngaydang"></span>
							</div>
						</div>

						<div class="cungcau-row  row">
							<div class="col-lg-4">
								<label>Chi tiết:</label>
							</div>
							<div class="col-lg-8" style="padding-left:50px">
								<span type="text" name="detail"></span>
							</div>
						</div>

						<div class="cungcau-row  row">
							<div class="col-lg-4">
								<label>Gía muốn mua:</label>
							</div>
							<div class="col-lg-8" style="padding-left:50px">
								<span type="text" name="price"></span>
							</div>
						</div>

						<div class="cungcau-row  row">
							<div class="col-lg-4">
								<label>Hình ảnh:</label>
							</div>
							<div class="col-lg-8" style="padding-left:50px">
								<div style="width:200px;height: 200px">
									<img style="width: 100%;height: 100%;" class="img-ncc-right-list" title="" name="hinhanh">
								</div>
							</div>
						</div>

				</div>
				<div class="modal-footer" style="border-top:1px solid #ff6300">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!--Cung cầu modal  -->
	<div class="modal" id="cungcau_modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background: #262144;color: #fff">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 id="detail_title" class="modal-title">Modal header</h4>
				</div>
				<form action="<?php echo base_url() ?>ketnoicungcau/dangtincungcau" enctype="multipart/form-data" method="POST" accept-charset="utf-8">
				<div class="modal-body">

						<div class="cungcau-row  row">
							<div class="col-lg-2">
								<label style="height:29px;padding-top:5px">Chọn loại<span style="color:red;font-size:10px"> (*)</span></label>
							</div>
							<div class="col-lg-5" style="padding-left:50px">
								<select name="type" id="type" class="form-control" required autofocus>
									<option value="">[--Chọn loại--]</option>
									<option value="1">Cần mua</option>
									<option value="2">Cần bán</option>
									<option value="3">Tìm đối tác</option>
								</select>
							</div>
							<div class="col-lg-5" style="padding-left:10px !important">
								<select name="catid" id="catid" class="form-control" required autofocus>
									<option value="">[--Chọn loại sản phẩm--]</option>
									<?php
									 $listCat=$this->Mcategory->category_all();
									$option_parentid = "";
									foreach ($listCat as $r) {
										$option_parentid .= "<option value='" . $r['id'] . "'>" . $r['name'] . "</option>";
									}
									echo $option_parentid;
									?>
								</select>
							</div>
						</div>

						<div class="cungcau-row  row">
							<div class="col-lg-2">
								<label style="height:29px;padding-top:5px">Người đăng<span style="color:red;font-size:10px"> (*)</span></label>
							</div>
							<div class="col-lg-10" style="padding-left:50px">
								<input type="text" class="form-control" placeholder="Người đăng" name="name" id="name" required autofocus  value="<?php if (empty($user['fullname'])) {
																																			echo "";
																																		} else {
																																			echo $user['fullname'];
																																		} ?>" <?php if ($this->session->userdata('sessionKhachHang')) echo 'readonly' ?> >
							</div>
						</div>

						<div class="cungcau-row  row">
							<div class="col-lg-2">
								<label style="height:29px;padding-top:5px">Tiêu đề<span style="color:red;font-size:10px"> (*)</span></label>
							</div>
							<div class="col-lg-10" style="padding-left:50px">
								<input type="text" class="form-control" placeholder="Tiêu đề" name="title" id="title" required autofocus >
							</div>
						</div>

						<div class="cungcau-row  row">
							<div class="col-lg-2">
								<label style="height:29px;padding-top:5px">SĐT<span style="color:red;font-size:10px"> (*)</span></label>
							</div>
							<div class="col-lg-10" style="padding-left:50px">
								<input type="text" class="form-control" placeholder="Số điện thoại" name="phone" id="phone" required autofocus value="<?php if (empty($user['phone'])) {
																																			echo "";
																																		} else {
																																			echo $user['phone'];
																																		} ?>">
							</div>
						</div>

						<div class="cungcau-row  row">
							<div class="col-lg-2">
								<label style="height:29px;padding-top:5px">Địa chỉ<span style="color:red;font-size:10px"> (*)</span></label>
							</div>
							<div class="col-lg-10" style="padding-left:50px">
								<input type="text" class="form-control" placeholder="Địa chỉ" name="address" id="address" required autofocus value="<?php if (empty($user['address'])) {
																																			echo "";
																																		} else {
																																			echo $user['address'];
																																		} ?>">
							</div>
						</div>

						<div class="cungcau-row  row">
							<div class="col-lg-2">
								<label style="height:29px;padding-top:5px">Gía</label>
							</div>
							<div class="col-lg-10" style="padding-left:50px">
								<input type="text" class="form-control" placeholder="Gía" name="price" id="price" >
							</div>
						</div>

						<div class="cungcau-row  row">
							<div class="col-lg-2">
								<label style="height:29px;padding-top:5px">Chi tiết</label>
							</div>
							<div class="col-lg-10" style="padding-left:50px">
								<textarea name="detail" id="detail" class="form-control"></textarea>
							</div>
						</div>

						<div class="cungcau-row  row">
							<div class="col-lg-2">
								<label style="height:29px;padding-top:5px">Hình ảnh</label>
							</div>
							<div class="col-lg-10" style="padding-left:50px">
								<input type="file" id="image_list" name="image" style="width: 100%">
							</div>
						</div>
				</div>
				<div class="modal-footer" style="border-top:1px solid #ff6300">
					<button type="submit" class="btn btn-primary">Lên</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
			</form>
		</div>
	</div>

</section>

<script>
	$(document).ready(function() {
		$('#detail_modal').on('show.bs.modal', function(e) {
			var cungcau_detail = $(e.relatedTarget).data('detalhes');
			if (cungcau_detail.type == 1) {
				$("#detail_title").text("Cần mua");
			} else if (cungcau_detail.type == 2) {
				$("#detail_title").text("Cần bán");
			} else {
				$("#detail_title").text("Tìm đối tác");
			}
			$(e.currentTarget).find('span[name="tieude"]').text(cungcau_detail.tieude);
			$(e.currentTarget).find('span[name="nguoidang"]').text(cungcau_detail.nguoidang);
			$(e.currentTarget).find('span[name="address"]').text(cungcau_detail.address);
			$(e.currentTarget).find('span[name="ngaydang"]').text(cungcau_detail.ngaydang);
			$(e.currentTarget).find('span[name="sdt"]').text(cungcau_detail.phone);
			$(e.currentTarget).find('span[name="detail"]').text(cungcau_detail.detail);
			$(e.currentTarget).find('span[name="price"]').text(cungcau_detail.price);
			$(e.currentTarget).find('img[name="hinhanh"]').attr("src", "public/images/ketnoicungcau/" + cungcau_detail.hinhanh);


			var strurl = "<?php echo base_url(); ?>" + 'ketnoicungcau/tangview';
			jQuery.ajax({
				url: strurl,
				type: 'POST',
				dataType: 'json',
				data: {
					'id': cungcau_detail.id,
					'view': cungcau_detail.luotxem
				},
				success: function(data) {
					console.log(data);
				}
			});
		});

		$('#cungcau_modal').on('hidden.bs.modal', function(){
    		$(this).find('form')[0].reset();
		});
	});



</script>