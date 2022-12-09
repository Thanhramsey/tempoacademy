<section id="product-all" class="collection">
	<!-- <div class="banner-product">
		<div class="container">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<img src="public/images/sp.png">
			</div>
		</div>
	</div> -->
	<div class="slider">
		<div class="container">
			<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 list-menu pull-left">
					<?php $this->load->view('frontend/modules/category'); ?>
				</div>
				<?php $this->load->view('frontend/modules/product-sale'); ?>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 product-content">
				<div class="product-wrap">
					<div class="collection__title">
						<?php
						echo '<h3>Tìm được ' . $count . ' ' . $search_name . ' với từ khóa : <span style="color: red;">' . $key . '</span></h3>';
						?>
						<div class="collection-filter" id="list-product">
							<div class="category-products clearfix">
								<div class="products-grid clearfix">
									<?php if (count($list) == 0) : ?>
										<p>Không có sản phẩm !</p>
									<?php else : ?>
										<?php if ($option == 0) : ?>
											<?php foreach ($list as $sp) : ?>
												<div class="col-md-4 col-lg-4 col-xs-6 col-6 detail-box">
													<div class="product-lt">
														<div class="lt-product-search-image">
															<a href="<?php echo $sp['alias'] ?>" title="<?php echo $sp['name'] ?>">
																<img width="225" height="210" class="img-t" src="public/images/products/<?php echo $sp['avatar'] ?>" alt="">
															</a>
															<div>
															<?php if ($sp['sale'] > 0) : ?>
																<div class="giam-percent">
																	<span class="text-giam-percent">Giảm <?php echo $sp['sale'] ?>%</span>
																</div>
															<?php endif; ?>
														</div>

														<div style="text-align:left; margin-top:10px">
															<a href="<?php echo $sp['alias'] ?>" title="<?php echo $sp['name'] ?>">
																<h3><?php echo $sp['name'] ?></h3>
															</a>
															<div class="lt-product-star-3" >
																	<?php if ($sp["star"] <= 1 ) : ?>
																		<span class="fa fa-star"></span>
																	<?php elseif ($sp["star"] > 1 && $sp["star"] <= 2) : ?>
																		<span class="fa fa-star"></span>
																		<span class="fa fa-star"></span>
																	<?php elseif ($sp["star"] > 2 && $sp["star"] <= 3) : ?>
																		<span class="fa fa-star"></span>
																		<span class="fa fa-star"></span>
																		<span class="fa fa-star"></span>
																	<?php elseif ($sp["star"] > 3 && $sp["star"] <= 4) : ?>
																		<span class="fa fa-star"></span>
																		<span class="fa fa-star"></span>
																		<span class="fa fa-star"></span>
																		<span class="fa fa-star"></span>
																	<?php elseif ($sp["star"] > 4 && $sp["star"] <= 5) : ?>
																		<span class="fa fa-star"></span>
																		<span class="fa fa-star"></span>
																		<span class="fa fa-star"></span>
																		<span class="fa fa-star"></span>
																		<span class="fa fa-star"></span>
																	<?php endif; ?>
																	<span class="sell_num">| Đã bán <?php echo(number_format($sp['number_buy'])); ?></span>
																</div>
															</div>
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
																<div class="lienhe">
																	<a href="<?php echo base_url() ?>doanhngiep/detail/<?php $producer = $this->Muser->user_detail_id_fg($sp['userId']);echo $producer['id'] ?>" title="">
																		<h3>Liên hệ</h3>
																	</a>
																</div>
															</div>
															<div class="clear"></div>
														</div>
													</div>
												</div>
											<?php endforeach; ?>
										<?php elseif ($option == 1) : ?>
											<!--Doanh nghieps  -->
											<?php foreach ($list as $sp) : ?>
												<div class="col-md-4 col-lg-4 col-xs-6 col-6 detail-box">
													<div class="product-lt">
														<div class="lt-product-search-image">
															<a href="doanhngiep/detail/<?php echo $sp['id'] ?>" title="<?php echo $sp['fullname'] ?>">
																<img width="225" height="210" class="img-t" src="public/images/admin/<?php echo $sp['img'] ?>" alt="">
															</a>
														</div>
														<div class="lt-product-star">
															<?php if ($sp['star'] == 1) : ?>
																<span class="fa fa-star"></span>
															<?php elseif ($sp['star'] == 2) : ?>
																<span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
															<?php elseif ($sp['star'] == 3) : ?>
																<span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
															<?php elseif ($sp['star'] == 4) : ?>
																<span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
															<?php elseif ($sp['star'] == 5) : ?>
																<span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
																<span class="fa fa-star"></span>
															<?php endif; ?>
														</div>

														<div class="lt-product-group-info" style="text-align:center">
															<a href="doanhngiep/detail/<?php echo $sp['id'] ?>" title="<?php echo $sp['fullname'] ?>">
																<h3><?php echo $sp['fullname'] ?></h3>
															</a>
															<div class="clear"></div>
														</div>
													</div>
												</div>
											<?php endforeach; ?>
											<!-- Doanh nghiep end -->
										<?php elseif ($option == 2) : ?>
											<!-- Dia Phuong-->
											<?php foreach ($list as $sp) : ?>
												<div class="col-md-4 col-lg-4 col-xs-6 col-6 detail-box">
													<div class="product-lt">
														<div class="lt-product-search-image">
															<a href="diaphuong/detail/<?php echo $sp['id'] ?>" title="<?php echo $sp['name'] ?>">
																<img  width="225" height="210" class="img-t" src="public/images/xa/<?php echo $sp['img'] ?>" alt="">
															</a>
														</div>

														<div class="lt-product-group-info" style="text-align:center">
															<a href="diaphuong/detail/<?php echo $sp['id'] ?>" title="<?php echo $sp['name'] ?>">
																<h3><?php echo $sp['name'] ?></h3>
															</a>
															<div class="clear"></div>
														</div>
													</div>
												</div>
											<?php endforeach; ?>
											<!-- Dia phương end -->
										<?php endif; ?>
								</div>
								<div class="text-center pull-right">
									<ul class="pagination">
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
</section>
<script>
	$(document).ready(function() {
		$('#search_by').val(<?php echo $option ?>);
		$('#search_text').val('<?php echo $key ?>');
		console.log($('#search_by').val());
	});

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
				alert('Thêm sản phẩm vào giỏ hàng thành công !');
				window.location.reload();
			}
		});
	}

	function sortby(option) {
		var strurl = "<?php echo base_url(); ?>" + '/sanpham/index';
		jQuery.ajax({
			url: strurl,
			type: 'POST',
			dataType: 'json',
			data: {
				'sapxep': option
			},
			success: function(data) {
				$('#list-product').html(data);
			}
		});
	}
</script>