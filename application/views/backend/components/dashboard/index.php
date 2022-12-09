<?php
$d = getdate();
$year = $d['year'];
$total = 0;
$cost = 0;
for ($i = 1; $i <= 12; $i++) {
	$user_role = $this->session->userdata('sessionadmin');
	$userId = $this->session->userdata('id');
	if ($user_role['role'] == 1) {
		$list_orrders = $this->Morders->order_follow_month($year, $i);
	} else {
		$list_orrders = $this->Morders->order_follow_month_byId($year, $i, $userId);
	}
	$sum = 0;
	if (is_iterable($list_orrders)) {
		foreach ($list_orrders as $row_orrder) {
			$sum += $row_orrder['count'];
			$total += $row_orrder['money'];
		}
	}
}
?>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->

	<!-- Main content -->
	<section class="content">
		<!-- Small boxes (Stat box) -->
		<div class="row">
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-aqua">
					<div class="inner">
						<h3><?php echo $total1; ?></h3>
						<p>Sản phẩm</p>
						<div class="icon">
							<i class="ion ion-bag"></i>
						</div>
					</div>
					<a href="<?php echo base_url() ?>admin/product" class="small-box-footer">Danh sách sản phẩm</a>
				</div>
			</div>
			<!-- ./col -->
			<?php if ($user['role'] == 1) : ?>
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-green">
						<div class="inner">
							<h3><?php echo $total2; ?></h3>
							<p>Bài viết</p>
						</div>
						<div class="icon">
							<i class="ion ion-android-chat "></i>
						</div>
						<a href="<?php echo base_url() ?>admin/content" class="small-box-footer">Danh sách bài viết</a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-3 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-yellow" style="background: #9b23b5 !important">
						<div class="inner">
							<h3><?php echo $total3; ?></h3>
							<p>Liên hệ</p>
						</div>
						<div class="icon">
							<i class="ion ion-email"></i>
						</div>
						<a href="<?php echo base_url() ?>admin/customer" class="small-box-footer">Liên hệ khách hàng</a>
					</div>
				</div>
			<?php else : ?>
			<?php endif; ?>

			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-red">
					<div class="inner">
						<h3><?php echo $total4; ?></h3>
						<p>Đơn hàng</p>
					</div>
					<div class="icon">
						<i class="ion ion-cube"></i>
					</div>
					<a href="<?php echo base_url() ?>admin/orders" class="small-box-footer">Danh sách đơn hàng</a>
				</div>
			</div>
			<!-- ./col -->
		</div>
		<!-- /.row -->
	</section>
	<section class="content">
		<div class="row">
			<!-- /.col (LEFT) -->
			<div class="col-md-12">
				<!-- LINE CHART -->
				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">Bán hàng & Doanh thu</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="glyphicon glyphicon-menu-up"></i>
							</button>
						</div>
					</div>
					<div class="box-body">
						<div class="chart">
							<div id="chart_div" style="width: 100%; height: 280px;"></div>
						</div>
					</div>
					<div class="box-footer">
						<div class="row">
							<div class="col-sm-4 col-xs-6">
								<div class="description-block border-right">
									<h5 class="description-header" style="color: #e90000;"><?php echo number_format($total); ?> VNĐ</h5>
									<span class="description-text">Tổng doanh thu</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
						</div>
						<?php
						$d = getdate();
						$year = $d['year'];
						for ($i = 1; $i <= 12; $i++) {
							$user_role = $this->session->userdata('sessionadmin');
							$userId = $this->session->userdata('id');
							if ($user_role['role'] == 1) {
								$list_orrders = $this->Morders->order_follow_month($year, $i);
							} else {
								$list_orrders = $this->Morders->order_follow_month_byId($year, $i, $userId);
							}

							$total_month = 0;
							if (is_iterable($list_orrders)) {
								foreach ($list_orrders as $row_orrder) {
									$total_month += $row_orrder['money'];
								}
							}

							echo '  <div class="col-sm-4 col-xs-6  description-col">
										<div class="description-block border-right" style="display: inline-flex;">
										<span class="description-text">Doanh thu tháng ' . $i . ' :  </span>
										<h5 class="description-header" style="color: #e90000;padding-left: 10px;">' . number_format($total_month) . ' VNĐ</h5>
										</div>
									</div>';
						}
						?>
						<!-- /.row -->
					</div>
					<!-- /.box-body -->
				</div>
			</div>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->
<script>
	google.charts.load('current', {
		'packages': ['corechart']
	});
	google.charts.setOnLoadCallback(drawVisualization);

	function drawVisualization() {
		var data = google.visualization.arrayToDataTable([
			['Month', 'Bán ra', 'Đơn hàng'],
			<?php
			$d = getdate();
			$year = $d['year'];
			for ($i = 1; $i <= 12; $i++) {
				$user_role = $this->session->userdata('sessionadmin');
				$userId = $this->session->userdata('id');
				if ($user_role['role'] == 1) {
					$list_orrders = $this->Morders->order_follow_month($year, $i);
				} else {
					$list_orrders = $this->Morders->order_follow_month_byId($year, $i, $userId);
				}
				$sum = 0;
				if (is_iterable($list_orrders)) {
					foreach ($list_orrders as $row_orrder) {
						$sum += $row_orrder['count'];
					}
					if ($i >= 1 && $i <= 9) {
						echo "['0" . $i . '/' . $year . "'," . $sum . "," . count($list_orrders) . "],";
					} else {
						echo "['" . $i . '/' . $year . "'," . $sum . "," . count($list_orrders) . "],";
					}
				} else {
					if ($i >= 1 && $i <= 9) {
						echo "['0" . $i . '/' . $year . "',0,0],";
					} else {
						echo "['" . $i . '/' . $year . "',0,0],";
					}
				}
			}
			?>

		]);
		var currentTime = new Date()
		var year = currentTime.getFullYear()
		var options = {
			title: 'Số lượng bán ra từ 01/'+year+'  -> ' +'12/' +year,
			seriesType: 'bars'
		};

		var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>