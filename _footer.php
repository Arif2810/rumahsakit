			</div>
        </div>
    </div>
	<script src="<?= base_url('_assets/js/jquery.js'); ?>"></script>
    <script src="<?= base_url('_assets/js/bootstrap.min.js'); ?>"></script>

    <!-- load DataTables -->
    <script src="<?= base_url(); ?>/_assets/libs/DataTables/datatables.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>
</body>
</html>
