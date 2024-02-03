<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\ModelUser;

class User extends BaseController
{
    protected $ModelUser;

    public function __construct()
    {
        $this->ModelUser = new ModelUser();
    }

    public function index()
    {
        $data = [
            'judul' => 'User',
            'subjudul' => 'User',
            'menu' => 'masterdata',
            'submenu' => 'user',
            'page' => 'v_user',
            'user' => $this->ModelUser->getAllData(),
        ];
        return view('v_template', $data);
    }

    public function insertData()
    {
        if ($this->request->getMethod() === 'post' && $this->validate([
                'nama_user' => 'required',
                'email' => 'required|valid_email',
                'password' => 'required',
                'level' => 'required'
            ])) {
            $data = [
                'nama_user' => $this->request->getPost('nama_user'),
                'email' => $this->request->getPost('email'),
                'password' => sha1($this->request->getPost('password')),
                'level' => $this->request->getPost('level'),
            ];
            $result = $this->ModelUser->insertData($data);
            if ($result) {
                session()->setFlashdata('pesan', 'Data Berhasil Ditambahkan!!');
                return redirect()->to('User');
            } else {
                session()->setFlashdata('pesan', 'Data Gagal Ditambahkan. Silakan coba lagi.');
                return redirect()->to('User');
            }
        } else {
            session()->setFlashdata('pesan', 'Data Gagal Ditambahkan. Form harus diisi dengan benar.');
            return redirect()->to('User');
        }
    }

    public function updateData($id_user)
    {
        $data = [
            'id_user' => $id_user,
            'nama_user' => $this->request->getPost('nama_user'),
            'email' => $this->request->getPost('email'),
            'level' => $this->request->getPost('level'),
        ];

        $password = $this->request->getPost('password');

        if (!empty($password)) {
            $data['password'] = sha1.($password);
        }

        $result = $this->ModelUser->updateData($data);
        if ($result) {
            session()->setFlashdata('pesan', 'Data Berhasil Diupdate!!');
            return redirect()->to('User');
        } else {
            session()->setFlashdata('pesan', 'Data Gagal Diupdate. Silakan coba lagi.');
            return redirect()->to('User');
        }
    }

    public function deleteData($id_user)
    {
        $data = [
            'id_user' => $id_user,
        ];
        $this->ModelUser->deleteData($data);
        session()->setFlashdata('pesan', 'Data Berhasil Dihapus!!');
        return redirect()->to('User');
    }
}
