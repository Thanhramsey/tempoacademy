<?php echo form_open( base_url()."lien-he"); ?>
<section class="lien_he">
	<div class="container">
	<div class="row" style="margin-top:20px">
			<div class="col-md-12">
				<div class="box" id="view">
					<!-- /.box-header -->
					<div class="box-body">
						<?php if ($this->session->flashdata('success')) : ?>
							<div class="row">
								<div class="alert alert-success">
									<?php echo $this->session->flashdata('success'); ?>
									<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
								</div>
							</div>
						<?php endif; ?>
						<?php if ($this->session->flashdata('error')) : ?>
							<div class="row">
								<div class="alert alert-error">
									<?php echo $this->session->flashdata('error'); ?>
									<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
								</div>
							</div>
						<?php endif; ?>
					</div>
				</div>
			</div>
	</div>
		<div class="col-md-7 col-12">
			<div class="section-article contactpage" style="  padding-left: 20px;">
				<?php
				echo validation_errors();

				?>
				<form accept-charset="UTF-8" action="<?php echo base_url() ?>lien-he" id="contact" method="post">
					<input name="FormType" type="hidden" value="contact">
					<input name="utf8" type="hidden" value="true">
					<h1 style="color: black">Liên hệ với chúng tôi</h1>
					<div class="form-comment">
						<div class="row" style="padding-left: 14px;">
							<div class="col-md-4 col-12">
								<div class="form-group" style="width: 200px;">
									<label for="name"><em> Họ tên</em><span class="required">*</span></label>
									<input id="name" name="fullname" type="text" value="" class="form-control">
								</div>
							</div>
							<div class="col-md-4 col-12">
								<div class="form-group" style="width: 200px;">
									<label for="email"><em> Email</em><span class="required">*</span></label>
									<input id="email" name="email" class="form-control" type="email" value="">
								</div>
							</div>
							<div class="col-md-4 col-12">
								<div class="form-group" style="width: 200px;">
									<label for="phone"><em> Số điện thoại</em><span class="required">*</span></label>
									<input type="number" id="phone" class="form-control" name="phone">

								</div>
							</div>
						</div>
						<div class="row" style="padding-left: 14px;">
							<div class="col-md-6 col-12">
							<div class="form-group"  style="width: 250px;">
							<label for="monId"><em> Môn</em><span class="required"></span></label>
								<select name="monId" id="loaisp" class="form-control" onchange="loadCahoc()">
									<option value="">[--Chọn môn--]
										<?php
										$monhoc_list = $this->Mmonhoc->monhoc_list();
										$option_parentid = "";
										foreach ($monhoc_list as $r) {
											$option_parentid .= "<option value='" . $r['id'] . "'>" . $r['name'] . "</option>";
										}
										echo $option_parentid;
										?>
									</option>
								</select>
							</div>
							</div>
							<div class="col-md-6 col-12">
							<div class="form-group"  style="width: 250px;">
							<label for="caId"><em> Ca</em><span class="required"></span></label>
								<select name="caId" id="caId" class="form-control">
								</select>
							</div>
							</div>
						</div>
						<div class="form-group">
							<label for="message"><em> Tiêu đề</em><span class="required">*</span></label>
							<textarea id="message" name="title" class="form-control custom-control" rows="2"></textarea>
						</div>
						<div class="form-group">
							<label for="message"><em> Lời nhắn</em><span class="required">*</span></label>
							<textarea id="message" name="content" class="form-control custom-control" rows="5"></textarea>
						</div>
						<button type="submit" class="btn-update-order" >Gửi nhận xét</button>

					</div>
				</form>
			</div>
		</div>
		<div class="col-md-5 col-12">
			<div class="f-contact" style="
			padding-left: 32px;
			">
			<h1 style="color: black">Thông tin liên hệ</h1>
			<ul class="list-unstyled">
				<li class="clearfix">
					<i class="fa fa-map-marker fa-1x" style="color:#262144; padding: 20px; "></i>
					<span style="color: black"> 89 Phạm Văn Đồng, TP.Pleiku , Tỉnh Gia Lai</span><br>
				</li>
				<li class="clearfix">
					<i class="fa fa-phone fa-1x" style="color:#262144;padding: 20px;  "></i>
					<span style="color: black">0979.190.303 - 0349.303.368</span>
				</li>
				<li class="clearfix">
					<i class="fa fa-envelope fa-1x " style="color:#262144; padding: 20px; "></i>
					<span style="color: black"><a href="mailto:tempomusic0403@gmail.com">tempomusic0403@gmail.com</a></span>
				</li>
			</ul>
		</div>

	</div>
	<div class="col-md-12 col-lg-12 col-xs-12 col-12">

		<div style="margin-top: 15px;">
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3871.4770338558756!2d108.00258391414552!3d13.989705095506688!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316c1f9f19191601%3A0x24f94e84cfedae13!2zODkgUGjhuqFtIFbEg24gxJDhu5NuZywgUC4gSG9hIEzGsCwgVGjDoG5oIHBo4buRIFBsZWlrdSwgR2lhIExhaSA2MDAwMDAsIFZpZXRuYW0!5e0!3m2!1sen!2s!4v1671433027388!5m2!1sen!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
		</div>
	</div>
</div>

</section>

<script type="text/javascript">
	function loadCahoc() {
		var strurl = "<?php echo base_url(); ?>" + '/admin/cahoc/listCaHoc/' + $("#loaisp").val();
		jQuery.ajax({
			url: strurl,
			type: 'GET',
			dataType: 'json',
			success: function(data) {
				if (data) {
					$("#caId").html(data.message);
				} else {
					$("#caId").html("");
				}

			}
		});
	}
</script>