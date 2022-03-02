<?php

namespace App\Imports;

use App\Models\Category;
use App\Models\Product;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class ProductsImport implements ToModel,WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Product([
            'name'     => $row['name'],
            'price'    => $row['price'], 
            'description'    => $row['description'], 
            'cat_id'    => $row['cat_id'], 
            'active'    => $row['active'], 
            'image'    => $row['image'], 
        ]);
    }
}
