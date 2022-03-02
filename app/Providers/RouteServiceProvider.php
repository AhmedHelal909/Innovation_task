<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Route;

class RouteServiceProvider extends ServiceProvider
{
    /**
     * This namespace is applied to your controller routes.
     *
     * In addition, it is set as the URL generator's root namespace.
     *
     * @var string
     */
    protected $namespaceapi = 'App\Http\Controllers\Api';
    protected $namespace = 'App\Http\Controllers';
    protected $namespaceemployee = 'App\Http\Controllers\Api\Employee';
    protected $namespaceclient = 'App\Http\Controllers\Api\Client';


    /**
     * The path to the "home" route for your application.
     *
     * @var string
     */
    public const HOME = '/dashboard/home';

    /**
     * Define your route model bindings, pattern filters, etc.
     *
     * @return void
     */
    public function boot()
    {
        //

        parent::boot();
    }

    /**
     * Define the routes for the application.
     *
     * @return void
     */
    public function map()
    {
        $this->mapApiRoutes();

        $this->mapWebRoutes();
        $this->mapEmployeeRoutes();
        $this->mapClientRoutes();
        

        
    }

    /**
     * Define the "web" routes for the application.
     *
     * These routes all receive session state, CSRF protection, etc.
     *
     * @return void
     */
    protected function mapWebRoutes()
    {
        Route::middleware('web')
            ->namespace($this->namespace)
            ->group(base_path('routes/web.php'));
    }

    /**
     * Define the "api" routes for the application.
     *
     * These routes are typically stateless.
     *
     * @return void
     */
    protected function mapApiRoutes()
    {
        Route::prefix('api')
            ->middleware('api')
            ->namespace($this->namespaceapi)
            ->group(base_path('routes/api.php'));
    }
    protected function mapEmployeeRoutes()
    {
        Route::prefix('employee')
            ->middleware('api')
            ->namespace($this->namespaceemployee)
            ->group(base_path('routes/employee.php'));
    }
    protected function mapClientRoutes()
    {
        Route::prefix('client')
            ->middleware('api')
            ->namespace($this->namespaceclient)
            ->group(base_path('routes/client.php'));
    }
}
