<?php
namespace App\Http\Controllers\Site;
use App\Http\Controllers\Controller;

# LOAD REPOSITORY
use App\Repositories\Products\ProductRepository;

class HomeController extends Controller
{
  protected $product;

  public function __construct(ProductRepository $product)
  {
    $this->product = $product;
  }

  public function index()
  {
    dump($this->product->getProducts());
  }
}