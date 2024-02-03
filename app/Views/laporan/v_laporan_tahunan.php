<div class="col-md-12">
    <div class="card card-primary">
        <div class="card-header">
            <h3 class="card-title"><?= $subjudul ?></h3>
            <!-- /.card-tools -->
        </div>
        <!-- /.card-header -->
        <div class="card-body">
        <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <label>Tahun</label>
                    <div class="col-10 input-group">
                    <select name="tahun" id="tahun" class="form-control">
                        <option value="">--Tahun--</option>
                        <option value="2021">2021</option>
                        <option value="2022">2022</option>
                        <option value="2023">2023</option>
                        <option value="2024">2024</option>
                    </select>                        
                    <span class="input-group-append">
                            <button onclick="ViewTabelLaporan()" class="btn btn-primary" data-toggle="modal" data-target="#cari-produk">
                                <i class="fas fa-file-alt"></i> View Laporan
                            </button>
                            <button onclick="PrintLaporan()" class="btn btn-success">
                                <i class="fas fa-print"></i> Print Laporan
                            </button>
                        </span>                
                    </div>
                </div>
            </div>
            
            <div class="col-sm-12">
                <hr>
                <div class="Tabel">
                </div>
            </div>
        </div>
    </div>
    <!-- /.card-body -->
</div>
<!-- /.card -->
</div>

<script>
    function ViewTabelLaporan()
    {
        let tahun = $('#tahun').val();
        if(tahun == "") {
            Swal.fire('Tahun Belum Dipilih !!!');
        }else {
$.ajax({
    type: "POST",
    url: "<?= base_url('Laporan/ViewLaporanTahunan') ?>",
    data: {
        tahun: tahun,
    },
    dataType: "JSON",
    success: function (response) {
        if (response.data) {
            $('.Tabel').html(response.data)
        }
    }
});
}
    }

    function PrintLaporan() {
        let tahun = $('#tahun').val();
        if(tahun == "") {
            Swal.fire('Tahun Belum Dipilih !!!');
        }else {
            NewWin = window.open('<?= base_url('Laporan/PrintLaporanTahunan') ?>/' + tahun, 'NewWin', 'toolbar=no, width=1150, height=550, scrollbar=yes',);
        }
    }
</script>