<div class="row">
<div class="col-12 text-center">
    <address>
        <i class="fas fa-shopping-cart fa-3x text-primary"></i>
        <font size=9 class="text-primary"><?= $web['nama_toko'] ?></font><br>
        <b><?= $web['slogan'] ?></b><br>
        <strong><?= $web['alamat'] ?></strong><br>
        <strong><?= $web['no_telpon'] ?></strong><br>
        </address>
    </div>

    <div class="col-12 text-center">
    <hr>
    <b><h4><?= $judul ?></h4></b>
    </div>

    <div class="col-12">
        <b>Bulan : </b><?= $bulan ?> <b>Tahun : </b><?= $tahun ?>
    <table class="table table-bordered table-striped">
    <tr class="text-center bg-gray">
        <th>NO</th>
        <th>Tanggal</th>
        <th>Total</th>
        <th>Untung</th>
    </tr>
    <?php $no = 1; 
    foreach ($databulanan as $key => $value) {
        $grandtotal[] = $value['total_harga'];
        $granduntung[] = $value['untung'];
        ?>
    <tr>
        <td class="text-center"><?= $no++ ?></td>
        <td class="text-center"><?= $value['tgl_jual'] ?></td>
        <td class="text-right">Rp. <?= number_format($value['total_harga'], 0) ?></td>
        <td class="text-right">Rp. <?= number_format($value['untung'], 0) ?></td>
    </tr>
    <?php } ?>
    <tr class="text-center bg-gray" >
        <td colspan="2">
            <h5><b>Grand Total</b></h4>
        </td>
        <td class="text-right">
            Rp. <?= $databulanan == null ? '' : number_format(array_sum($grandtotal), 0) ?>
        </td>
        <td class="text-right">
        Rp. <?= $databulanan == null ? '' : number_format(array_sum($granduntung), 0) ?>
        </td>
    </tr>
</table>
    </div>
</div>