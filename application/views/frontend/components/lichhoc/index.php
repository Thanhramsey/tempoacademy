<?php
$user = $this->session->userdata('sessionKhachHang');
?>
<?php echo form_open_multipart('lichhoc/index'); ?>
<form action="<?php echo base_url() ?>lichhoc/index.html" enctype="multipart/form-data" method="POST" accept-charset="utf-8">
	<section>
		<div class="container">
			<div class="container" style="margin-top:50px">
				<div class="row" style='padding:0px; margin:0px;'>
					<div class="col-md-9">
						<div class="col-md-4"  style='padding:0px 15px 0px 0px !important;'>
							<div class="form-group">
								<label>Môn</label>
								<select name="loaisp" id="loaisp" class="form-control" onchange="loadCahoc()">
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
						<div class="col-md-4" style='padding:0px 15px 0px 0px !important;'>
							<div class="form-group">
								<label>Ca</label>
								<select name="caId" id="caId" class="form-control">
								</select>
							</div>
						</div>
						<div class="col-md-3" style="padding-top: 25px;">
							<button type="submit" class="btn btn-primary btn-sm">
								<span class="glyphicon glyphicon-search"></span>
								Tìm kiếm
							</button>
							<a href="lien-he" style="margin-left:5px">Đăng kí học thử</a>
						</div>
					</div>
					<div class="col-md-2">
					</div>
				</div>
			</div>
			<div class="container" style="margin-top:20px">
				<div class="row" style='padding:0px; margin:0px;'>
					<!--ND-->
					<div class="table-responsive">
						<table class="table table-hover table-bordered">
							<thead>
								<tr>
									<th class="text-center">ID</th>
									<th class="text-center">Tên học viên</th>
									<th class="text-center">Năm sinh</th>
									<th class="text-center">Giới tính</th>
									<th class="text-center">SĐT</th>
									<th class="text-center">Môn học</th>
									<th class="text-center">Ca học</th>
								</tr>
							</thead>
							<tbody>
								<?php foreach ($list as $row) : ?>
									<tr>
										<td class="text-center"><?php echo $row['id'] ?></td>
										<td class="text-center"><?php echo $row['name'] ?></td>
										<td class="text-center"><?php echo $row['ngaysinh'] ?></td>
										<td class="text-center"><?php
																if ($row['gioitinh'] != 0) {
																	echo "Nam";
																} else {
																	echo "Nữ";
																}
																?></td>
										<td class="text-center"><?php echo $row['phone'] ?></td>
										<td class="text-center"><?php
																$monhoc = $this->Mmonhoc->monhoc_detail($row['monId']);
																echo $monhoc['name'];
																?></td>
										<td class="text-center"><?php
																if ($row['cahocId'] != 0) {
																	$cahoc = $this->Mcahoc->cahoc_detail($row['cahocId']);
																	echo $cahoc['name'];
																} else {
																	echo "Chưa xếp ca";
																}
																?></td>
									</tr>
								<?php endforeach; ?>
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-md-12 text-center">
							<ul class="pagination">
								<?php echo $strphantrang ?>
							</ul>
						</div>
					</div>
				</div>
			</div>
	</section>
</form>

<!--Cung cầu modal  -->
<script type="text/javascript">
	function loadCahoc() {
		var strurl = "<?php echo base_url(); ?>" + '/lichhoc/listCaHoc/' + $("#loaisp").val();
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