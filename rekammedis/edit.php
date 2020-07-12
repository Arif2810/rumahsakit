<?php
include_once('../_header.php');
?>

<div class="box">
	<h1>Rekam Medis</h1>
	<a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle Menu</a>
	<h4>
		<small>Edit Data Rekam Medis</small>
		<div class="pull-right">
			<a href="data.php" class="btn btn-warning btn-xs"><i class="glyphicon glyphicon-chevron-left"></i> Kembali</a>
		</div>
	</h4>
	<div class="row">
		<div class="col-lg-6 col-lg-offset-3">
			<?php
			$id = @$_GET['id'];
			$sql_rekammedis = mysqli_query($con, "SELECT * FROM tb_rekammedis INNER JOIN tb_poliklinik ON tb_rekammedis.id_poli = tb_poliklinik.id_poli INNER JOIN tb_pasien ON tb_rekammedis.id_pasien = tb_pasien.id_pasien INNER JOIN tb_dokter ON tb_rekammedis.id_dokter = tb_dokter.id_dokter WHERE id_rm ='$id'") or die(mysqli_error($con));
			$data = mysqli_fetch_array($sql_rekammedis);
			?>
			<form action="proses.php" method="post">
				<input type="hidden" name="id" value="<?= $data['id_rm'] ?>">
				<div class="form-group">
					<label for="tgl">Tanggal Periksa</label>
					<input type="date" name="tgl" id="tgl" class="form-control" value="<?= $data['tgl_periksa'] ?>" required="" autofocus="">
				</div>
				<div class="form-group">
					<label for="poli">Poli</label>
					<select name="poli" id="poli" class="form-control" required="">
						<option value="">- Pilih -</option>
						<?php
						$sql_poli = mysqli_query($con, "SELECT * FROM tb_poliklinik ORDER BY nama_poli ASC") or die(mysqli_error($con));
						while($data_poli = mysqli_fetch_array($sql_poli)){
							if($data['id_poli'] == $data_poli['id_poli']){
								$select = "selected";
							}
							else{
								$select = "";
							}
							echo '<option '.$select.' value="'.$data_poli['id_poli'].'">'.$data_poli['nama_poli'].'</option>';
						} ?>
					</select>
				</div>
				<div class="form-group">
					<label for="pasien">Nama Pasien</label>
					<select name="pasien" id="pasien" class="form-control" required="">
						<option value="">- Pilih -</option>
						<?php
						$sql_pasien = mysqli_query($con, "SELECT * FROM tb_pasien") or die(mysqli_error($con));
						while($data_pasien = mysqli_fetch_array($sql_pasien)){
							if($data['id_pasien'] == $data_pasien['id_pasien']){
								$select = "selected";
							}
							else{
								$select = "";
							}
							echo '<option '.$select.' value="'.$data_pasien['id_pasien'].'">'.$data_pasien['nama_pasien'].'</option>';
						}
						?>
					</select>
				</div>
				<div class="form-group">
					<label for="keluhan">Keluhan</label>
					<textarea name="keluhan" id="keluhan" class="form-control" required=""><?= $data['keluhan']; ?></textarea>
				</div>
				<div class="form-group">
					<label for="dokter">Nama Dokter</label>
					<select name="dokter" id="dokter" class="form-control" required="">
						<option value="">- Pilih -</option>
						<?php
						$sql_dokter = mysqli_query($con, "SELECT * FROM tb_dokter") or die(mysqli_error($con));
						while($data_dokter = mysqli_fetch_array($sql_dokter)){
							if($data['id_dokter'] == $data_dokter['id_dokter']){
								$select = "selected";
							}
							else{
								$select = "";
							}
							echo '<option '.$select.' value="'.$data_dokter['id_dokter'].'">'.$data_dokter['nama_dokter'].'</option>';
						} ?>
					</select>
				</div>
				<div class="form-group">
					<label for="diagnosa">Diagnosa</label>
					<textarea name="diagnosa" id="diagnosa" class="form-control" required="" rows="4"><?= $data['diagnosa']; ?></textarea>
				</div>
				<div class="form-group">
					<label for="obat">Obat</label>

					<?php
						$sql_rm_obat = mysqli_query($con, "SELECT * FROM tb_rm_obat WHERE id_rm='$id'") or die(mysqli_error($con));
						while($data_rm_obat = mysqli_fetch_array($sql_rm_obat)){
							$selected_obat[] = $data_rm_obat['id_obat'];
						}
					?>
					
					<select multiple="" size="7" name="obat[]" id="obat" class="form-control" required="">

						<?php
							$sql_obat = mysqli_query($con, "SELECT * FROM tb_obat") or die(mysqli_error($con));
							while($data_obat = mysqli_fetch_array($sql_obat)){ ?>

								<option value="<?= $data_obat['id_obat']; ?>" <?php for($i = 0; $i < count($selected_obat); $i++){
									if($data_obat['id_obat'] == $selected_obat[$i]){
										echo "selected";
									}
								} ?>>
								<?= $data_obat['nama_obat']; ?>
								</option>

							<?php
							}
						?>

					</select>
				</div>
				<div class="form-group">
					<input type="reset" name="reset" value="Reset" class="btn btn-default">
					<input type="submit" name="edit" value="Simpan" class="btn btn-success">
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	CKEDITOR.replace( 'keluhan' );
</script>



<?php include_once('../_footer.php'); ?>
