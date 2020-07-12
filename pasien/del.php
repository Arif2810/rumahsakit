<?php
require_once"../_config/config.php";

mysqli_query($con, "DELETE FROM tb_pasien WHERE id_pasien = '$_GET[id]'") or die(mysqli_error($con));
echo "<script>alert('Data berhasil dihapus'); window.location='data.php';</script>";