<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

/**
 * SETTING ROUTE PATH TO MANAGER APPLICATION
 */
$router->group([
  'namespace' => 'Manager',
  'prefix'    => 'manager'
], function() {
  require_once __DIR__ . '/Routes/Manager/routes.php';
});


/**
 * SETTING ROUTE PATH TO CLIENT / USER APPLICATION
 */
$router->group([
  'namespace' => 'Client',
  'prefix'    => 'client'
], function() {
  require_once __DIR__ . '/Routes/Client/routes.php';
});


/**
 * SETTING ROUTE PATH TO SITE APPLICATION
 */
$router->group([
  'namespace' => 'Site'
], function() {
  require_once __DIR__ . '/Routes/Site/routes.php';
});