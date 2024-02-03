<?php

namespace App\Models;

use CodeIgniter\Model;

class ModelUser extends Model
{
    public function getAllData()
    {
        return $this->db->table('user')->get()->getResultArray();
    }

    public function insertData($data)
    {
        $this->db->table('user')->insert($data);
        $result = $this->db->affectedRows() > 0;
        return $result;
    }

    public function updateData($data)
    {
        $this->db->table('user')
            ->where('id_user', $data['id_user'])
            ->update($data);
        $result = $this->db->affectedRows() > 0;
        return $result;
    }

    public function deleteData($data)
    {
        $this->db->table('user')
            ->where('id_user', $data['id_user'])
            ->delete();
    }

    public function loginUser($email, $password)
    {
        return $this->db->table('user')
            ->where([
                'email' => $email,
                'password' => $password,
            ])->get()->getRowArray();
    }
}
