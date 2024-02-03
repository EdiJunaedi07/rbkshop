<?php

namespace App\Models;

use CodeIgniter\Model;

class ModelAdmin extends Model
{
    public function DetailData()
    {
        return $this->db->table('setting')
        ->where('id', '1')
        ->get()
        ->getRowArray();
    }

    public function UpdateData($data)
    {
        $this->db->table('setting')
        ->where('id', $data['id'])
        ->update($data);
    }

    public function Grafik()
    {
        return $this->db->table('rinci_jual')
        ->join('jual', 'jual.no_faktur=rinci_jual.no_faktur')
        ->where('month(jual.tgl_jual)', date('m'))
        ->where('year(jual.tgl_jual)', date('Y'))
        ->select('jual.tgl_jual')
        ->groupBy('jual.tgl_jual')
        ->selectSum('rinci_jual.total_harga')
        ->selectSum('rinci_jual.untung')
        ->get()
        ->getResultArray();
    }

    public function PendapatanHariIni()
    {
        $result = $this->db->table('rinci_jual')
        ->join('jual', 'jual.no_faktur=rinci_jual.no_faktur')
        ->where('jual.tgl_jual', date('Y-m-d'))
        ->groupBy('jual.tgl_jual')
        ->selectSum('rinci_jual.total_harga')
        ->get()
        ->getRowArray();

        if ($result === null) {
            return ['total_harga' => 0];
        }
    
        return $result;
    }

    public function PendapatanBulanIni()
    {
        return $this->db->table('rinci_jual')
        ->join('jual', 'jual.no_faktur=rinci_jual.no_faktur')
        ->where('month(jual.tgl_jual)', date('m'))
        ->where('year(jual.tgl_jual)', date('Y'))
        ->groupBy('month(jual.tgl_jual)')
        ->selectSum('rinci_jual.total_harga')
        ->get()->getRowArray();
    }

    public function PendapatanTahunIni()
    {
        return $this->db->table('rinci_jual')
        ->join('jual', 'jual.no_faktur=rinci_jual.no_faktur')
        ->where('year(jual.tgl_jual)', date('Y'))
        ->groupBy('year(jual.tgl_jual)')
        ->selectSum('rinci_jual.total_harga')
        ->get()->getRowArray();
    }

    public function JumlahProduk()
    {
        return $this->db->table('produk')->countAll();
    }

    public function JumlahKategori()
    {
        return $this->db->table('kategori')->countAll();
    }


    public function JumlahSatuan()
    {
        return $this->db->table('satuan')->countAll();
    }


    public function JumlahUser()
    {
        return $this->db->table('user')->countAll();
    }

}