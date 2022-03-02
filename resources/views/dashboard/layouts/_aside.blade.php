<aside class="main-sidebar">

    <section class="sidebar">

        <div class="user-panel">
            <div class="pull-left image">
                <img src="{{auth()->user()->image_path}}" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>{{auth()->user()->name }}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> @lang('site.statue')</a>
            </div>
        </div>

        <ul class="sidebar-menu" data-widget="tree">
            

            <li class="{{Route::is('dashboard.home*')? 'active':''}}"><a href="{{ route('dashboard.home') }}" ><i
                        class="fa fa-dashboard"></i><span>@lang('site.dashboard')</span></a></li>

           
            @if (auth()->user()->hasPermission('read-users'))
            <li class="{{Route::is('dashboard.users*')? 'active':''}}"><a href="{{ route('dashboard.users.index') }}"><i
                        class="fa fa-users"></i><span>@lang('site.users')</span></a></li>
            @endif
            
            @if (auth()->user()->hasPermission('read-roles'))
                   <li class="{{Route::is('dashboard.roles*')? 'active':''}}"><a href="{{ route('dashboard.roles.index') }}"><i
                        class="fa fa-hourglass-half"></i><span>@lang('site.roles')</span></a></li>
            @endif
            @if (auth()->user()->hasPermission('read-categories'))
                   <li class="{{Route::is('dashboard.categories*')? 'active':''}}"><a href="{{ route('dashboard.categories.index') }}"><i
                        class="fa fa-hourglass-half"></i><span>@lang('site.categories')</span></a></li>
            @endif
            @if (auth()->user()->hasPermission('read-products'))
                   <li class="{{Route::is('dashboard.products*')? 'active':''}}"><a href="{{ route('dashboard.products.index') }}"><i
                        class="fa fa-hourglass-half"></i><span>@lang('site.products')</span></a></li>
            @endif
            @if (auth()->user()->hasPermission('read-clients'))
                   <li class="{{Route::is('dashboard.clients*')? 'active':''}}"><a href="{{ route('dashboard.clients.index') }}"><i
                        class="fa fa-hourglass-half"></i><span>@lang('site.clients')</span></a></li>
            @endif
            @if (auth()->user()->hasPermission('read-employees'))
                   <li class="{{Route::is('dashboard.employees*')? 'active':''}}"><a href="{{ route('dashboard.employees.index') }}"><i
                        class="fa fa-hourglass-half"></i><span>@lang('site.employees')</span></a></li>
            @endif
         
        
          





        </ul>

    </section>

</aside>
