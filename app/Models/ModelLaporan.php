<?php

namespace App\Models;

use CodeIgniter\Model;

class ModelLaporan extends Model
{
    public function DataHarian($tgl)
    {
        return $this->db->table('rinci_jual')
        ->join('produk', 'produk.kode_produk=rinci_jual.kode_produk')
        ->join('jual', 'jual.no_faktur=rinci_jual.no_faktur')
        ->where('jual.tgl_jual', $tgl)
        ->select('rinci_jual.kode_produk')
        ->select('produk.nama_produk')
        ->select('rinci_jual.modal')
        ->select('rinci_jual.harga')
        ->groupBy('rinci_jual.kode_produk')
        ->selectSum('rinci_jual.qty')
        ->selectSum('rinci_jual.total_harga')
        ->selectSum('rinci_jual.untung')

        ->get()
        ->getResultArray();
    }

    public function DataBulanan($bulan,$tahun)
    {
        return $this->db->table('rinci_jual')
        ->join('jual', 'jual.no_faktur=rinci_jual.no_faktur')
        ->where('month(jual.tgl_jual)', $bulan)
        ->where('year(jual.tgl_jual)', $tahun)
        ->select('jual.tgl_jual')
        ->groupBy('jual.tgl_jual')
        ->selectSum('rinci_jual.total_harga')
        ->selectSum('rinci_jual.untung')

        ->get()
        ->getResultArray();
    }

    public function DataTahunan($tahun)
    {
        return $this->db->table('rinci_jual')
        ->join('jual', 'jual.no_faktur=rinci_jual.no_faktur')
        ->where('year(jual.tgl_jual)', $tahun)
        ->select('month(jual.tgl_jual) as bulan')
        ->groupBy('month(jual.tgl_jual)')
        ->selectSum('rinci_jual.total_harga')
        ->selectSum('rinci_jual.untung')

        ->get()
        ->getResultArray();
    }

}
