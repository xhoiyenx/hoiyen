<?php
namespace App\Repositories\Products;
use App\Model\Product;

class ProductRepository
{
  public function getProducts()
  {
    return Product::get();
  }
}