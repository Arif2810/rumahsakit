<?php include_once('../_header.php'); ?>

<div class="box">
	<h1>Poliklinik</h1>
	<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle Menu</a>
	<h4>
		<small>Tambah Data Poliklinik</small>
		<div class="pull-right">
			<a href="data.php" class="btn btn-info btn-xs"> Data</a>
			<a href="generate.php" class="btn btn-info btn-xs"> Tambah data lagi</a>
		</div>
	</h4>
	<div class="row">
		<div class="col-lg-8 col-lg-offset-2">
			<form action="proses.php" method="post">
				<input type="hidden" name="total" value="<?= @$_POST['count_add']; ?>">
				<table class="table">
					<tr>
						<th>#</th>
						<th>Nama Poliklinik</th>
						<th>Lokasi</th>
					</tr>
					<?php
					for($i=1; $i<=$_POST['count_add']; $i++){ ?>
						<tr>
							<td><?= $i; ?></td>
							<td>
								<input type="text" name="nama-<?= $i; ?>" class="form-control" required>
							</td>
							<td>
								<input type="text" name="lokasi-<?= $i; ?>" class="form-control" required>
							</td>
						</tr>
					<?php
					}
					?>
				</table>
				<div class="form-group">
					<input type="submit" name="add" value="Simpan Semua" class="btn btn-success">
				</div>
			</form>
		</div>
	</div>
</div>

<?php include_once('../_footer.php'); ?>