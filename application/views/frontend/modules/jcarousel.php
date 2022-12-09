<script>
	//FlexSlider-->
	$(document).ready(function() {
		$('.ex1').zoom({
			on: 'click'
		});;
	});
	$(window).on('load', function() {
		$('.flexslider').flexslider({
			animation: "slide",
			controlNav: "thumbnails",
			animationLoop: true,
		});
	});
</script>

<div class="flexslider">
	<ul class="slides" id="start">
		<?php
		$avatar = $row['avatar'];
		$img = $row['img'];
		$img2 = $row['img2'];
		$img3 = $row['img3'];
		$img4 = $row['img4'];
		?>
		<?php if (!empty($avatar)) : ?>
			<li data-thumb="public/images/products/<?php echo $avatar; ?>" id="pop">
				<div class="thumb-image ex1"> <img src="public/images/products/<?php echo $avatar; ?>" class="img-responsive"> </div>
			</li>
		<?php endif; ?>
		<?php if (!empty($img)) : ?>
			<li data-thumb="public/images/products/<?php echo $img; ?>" id="pop1">
				<div class="thumb-image ex1"> <img src="public/images/products/<?php echo $img; ?>" class="img-responsive"> </div>
			</li>
		<?php endif; ?>
		<?php if (!empty($img2)) : ?>

			<li data-thumb="public/images/products/<?php echo $img2; ?>">
				<div class="thumb-image ex1"> <img src="public/images/products/<?php echo $img2; ?>" class="img-responsive"> </div>
			</li>
		<?php endif; ?>
		<?php if (!empty($img3)) : ?>
			<li data-thumb="public/images/products/<?php echo $img3; ?>">
				<div class="thumb-image ex1"> <img src="public/images/products/<?php echo $img3; ?>" class="img-responsive"> </div>
			</li>
		<?php endif; ?>
		<?php if (!empty($img4)) : ?>
			<li data-thumb="public/images/products/<?php echo $img4; ?>">
				<div class="thumb-image ex1"> <img src="public/images/products/<?php echo $img4; ?>" class="img-responsive"> </div>
			</li>
		<?php endif; ?>
	</ul>
	<div class="clearfix"></div>
</div>

<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#productModal" style="margin-bottom:5px">Chi tiết</button>

<!-- Modal -->
<div class="modal fade" id="productModal" role="dialog" >
	<div class="modal-dialog" style="width:70%">

		<!-- Modal content-->
		<div class="modal-header" style="    background: #262144;color: #fff;border-radius: 6px 6px 0px 0px;">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="modal-title">Ảnh sản phẩm</h4>
      	</div>
		<div class="modal-content" style="border-radius: 0px;">
			<div class="modal-body">
			 <?php
				$avatar = $row['avatar'];
				$img = $row['img'];
				$img2 = $row['img2'];
				$img3 = $row['img3'];
				$img4 = $row['img4'];
				?>
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<?php if (!empty($img)) : ?>
						<li data-target="#myCarousel" data-slide-to="1"></li>
					<?php endif; ?>
					<?php if (!empty($img2)) : ?>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					<?php endif; ?>
					<?php if (!empty($img3)) : ?>
						<li data-target="#myCarousel" data-slide-to="3"></li>
					<?php endif; ?>
					<?php if (!empty($img4)) : ?>
						<li data-target="#myCarousel" data-slide-to="4"></li>
					<?php endif; ?>
				</ol>
				<!-- Wrapper for slides -->
				<div class="carousel-inner" style="height:600px;">
					<?php if (!empty($avatar)) : ?>
						<div class="item active">
							<img class="img-product-dt"  src="public/images/products/<?php echo $avatar; ?>" >
						</div>
					<?php endif; ?>
					<?php if (!empty($img)) : ?>
						<div class="item">
							<img class="img-product-dt"  src="public/images/products/<?php echo $img; ?>" >
						</div>
					<?php endif; ?>
					<?php if (!empty($img2)) : ?>

						<div class="item">
							<img class="img-product-dt" src="public/images/products/<?php echo $img2; ?>" >
						</div>
					<?php endif; ?>
					<?php if (!empty($img3)) : ?>
						<div class="item">
							<img class="img-product-dt" src="public/images/products/<?php echo $img3; ?>" >
						</div>
					<?php endif; ?>
					<?php if (!empty($img4)) : ?>
						<div class="item">
							<img class="img-product-dt"  src="public/images/products/<?php echo $img4; ?>" >
						</div>
					<?php endif; ?>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#myCarousel" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right"></span>
					<span class="sr-only">Next</span>
				</a>
				</div>
			</div>
		</div>
	</div>
</div>