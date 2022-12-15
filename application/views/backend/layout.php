<!DOCTYPE html>
<html>

<head>
	<base href="<?php echo base_url(); ?>">
	</base>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title><?php echo $title ?></title>
	<link rel="icon" type="image/x-icon" href="public/images/favicon.png">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<!-- Bootstrap 3.3.7 -->
	<link rel="stylesheet" href="public/css/bootstrap.min.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" href="public/css/fontawesome.css">
	<link rel="stylesheet" href="public/css/fontawesome.min.css">
	<!-- Ionicons -->
	<link rel="stylesheet" href="public/css/ionicons.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="public/css/AdminLTE.css">
	<link rel="stylesheet" href="public/css/ionicons.min.css">
	<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
	<meta property="fb:app_id" content="659513967881060">

	<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
	<link rel="stylesheet" href="public/css/_all-skins.min.css">


	<script src="public/js/loader.js"></script>
	<script src="public/ckeditor/ckeditor.js"></script>
	<style>
		.content-header h1,
		th,
		label {
			color: #333;
		}

		label {
			font-weight: 600 !important;
		}

		.maudo {
			color: red
		}

		.mauxanh18 {
			color: green;
		}
	</style>
</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- Vung Header -->
		<?php $this->load->view('backend/modules/header'); ?>


		<!-- ./Vung Header -->
		<?php $this->load->view('backend/modules/menu'); ?>
		<?php
		if (isset($com, $view)) {
			$this->load->view('backend/components/' . $com . '/' . $view);
		}

		?>

	</div><!-- ./wrapper -->
	<!-- jQuery 2.2.3 -->
	<script src="public/js/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="public/js/bootstrap.js"></script>
	<!-- AdminLTE App -->
	<script src="public/js/app.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
	<script>

		$(document).ready(function() {
			let getTime = (m) => {
				return m.minutes() + m.hours() * 60;
			}
			function tmTotalHrsOnSite() {
				if ($("#startTime") && $("#endTime")) {
					let timeFrom = $("#startTime").val(),
						timeTo = $("#endTime").val();
					timeFrom = moment(timeFrom, 'hh:mm a');
					timeTo = moment(timeTo, 'hh:mm a');
					if (getTime(timeFrom) >= getTime(timeTo)) {
						alert('Giờ kết thúc phải lớn hơn giờ bắt đầu');
					}
				}
				};
			$('#endTime').timepicker({
				timeFormat: 'HH:mm',
				interval: 30,
				minTime: '7:00',
				maxTime: '21:00',
				startTime: '7:00',
				defaultTime: 'value',
				showMeridian: false,
				change: tmTotalHrsOnSite
			});
			$('#startTime').timepicker({
				timeFormat: 'HH:mm',
				interval: 30,
				minTime: '7:00',
				maxTime: '21:00',
				startTime: '7:00',
				defaultTime: 'value',
				change: tmTotalHrsOnSite
			});


			$("#loaivanban").change(function() {
				$("#loaivanban_name").val($("#loaivanban").find(":selected").text());
			});
			$('#doanhnghiep').val(
				<?php
				if (!empty($doanhnghiep)) {
					echo $doanhnghiep;
				} else {
					echo "";
				}
				?>);
			$('#loaisp').val(
				<?php
				if (!empty($loaisp)) {
					echo $loaisp;
				} else {
					echo "";
				}
				?>);
		});
	</script>

</body>

</html>