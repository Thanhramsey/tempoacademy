<?php echo form_open(base_url()."van-ban"); ?>
<section>
	<div class="container">
		<div class="col-md-12 col-12">
			<div class="row" style='padding:0px; margin:10px;'>
				<!--ND-->
				<div class="table-responsive">
					<table class="table table-hover table-bordered tb-vanban">
						<thead>
							<tr>
								<th class="text-center">id</th>
								<th class="text-center">Tên văn bản</th>
								<th class="text-center">Số hiệu</th>
								<th class="text-center">Loại văn bản</th>
								<th class="text-center">Cơ quan ban hành</th>
								<th class="text-center">Lĩnh vực</th>
								<th class="text-center">Download</th>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($list as $row) : ?>
								<tr>
									<td class="text-center"><?php echo $row['id'] ?></td>
									<td><?php echo $row['name'] ?></td>
									<td><?php echo $row['sohieu'] ?></td>
									<td><?php echo $row['loaivanban_name'] ?></td>
									<td><?php echo $row['coquanbanhanh'] ?></td>
									<td><?php echo $row['linhvuc'] ?></td>
									<td class="text-center">
										<a href="<?php echo base_url() ?>public/images/chinhsach/<?php echo $row['file'] ?>">
											Download
										</a>
									</td>
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
				<!-- /.ND -->
			</div>
		</div>
	</div>

</section>