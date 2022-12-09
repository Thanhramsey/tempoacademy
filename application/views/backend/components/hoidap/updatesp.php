<?php echo form_open_multipart('admin/hoidap/updatesp/'.$row['id']); ?>
<div class="content-wrapper">
    <form action="<?php echo base_url() ?>admin/hoidap/updatesp.html" enctype="multipart/form-data" method="POST" accept-charset="utf-8">
        <section class="content-header">
            <h1><i class="glyphicon glyphicon-plus glyphicon"></i> Trả lời</h1>
            <div class="breadcrumb">
                <button type = "submit" class="btn btn-primary btn-sm">
                    <span class="glyphicon glyphicon-floppy-save"></span>
                    Lưu[Sửa]
                </button>
				<a class="btn btn-primary btn-sm" href='admin/product' role="button">
                   	<span class="glyphicon glyphicon-remove do_nos"></span> Thoát
               	</a>
            </div>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-md-12">
                    <div class="box" id="view">
                        <div class="box-body">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Câu hỏi </label>
                                    <input type="text" class="form-control" value="<?php echo $row['question'] ?>" disabled>
                                </div>
                                <div class="form-group">
                                    <label>Người hỏi </label>
                                    <input class="form-control" value="<?php echo $row['question_by'] ?>" disabled>
                                </div>
                                <div class="form-group">
                                    <label>Hỏi lúc </label>
                                    <input  class="form-control" value="<?php echo $row['question_time']?>" disabled>
                                </div>
								<div class="form-group">
									<label>Nhập câu trả lời</label>
									<textarea name="answer" id="answer" class="form-control"><?php echo $row['answer']  ?></textarea>
								</div>

                            </div>
                        </div>
                    </div><!-- /.box -->
                </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->
        </section>
    </form>
<!-- /.content -->
</div><!-- /.content-wrapper -->