@extends('dashboard.layouts.app')

@section('title', __('site.' . $module_name_plural))


@section('content')

    <div class="content-wrapper">

        <section class="content-header">

            <h1>@lang('site.'.$module_name_plural)</h1>

            <ol class="breadcrumb">
                <li> <a href="{{ route('dashboard.home') }}"><i class="fa fa-dashboard"></i> @lang('site.dashboard')</a>
                </li>
                <li class="active"><i class="fa fa-user-md"></i> @lang('site.'.$module_name_plural)</li>
            </ol>
        </section>

        <section class="content">

            <div class="box box-primary">

                <div class="box-header with-border">
                    <h1 class="box-title"> @lang('site.'.$module_name_plural)</h1>


                        <div class="row">

                            <div class="col-md-4">
                                <input type="text" name="search" value="{{ request()->search }}" class="form-control"
                                   id="data-table-search" placeholder="@lang('site.search')">
                                   <input type="hidden" class="data">
                            </div>

                            <div class="col-md-4">
                                <button class="btn btn-primary" type="submit" id="search"><i class="fa fa-search"></i>
                                    @lang('site.search')</button>
                                    @if (auth()->user()->hasPermission('create-'.$module_name_plural))
                                    <a href="{{ route('dashboard.' . $module_name_plural . '.create') }}"
                                    class="btn btn-primary"><i class="fa fa-plus"></i> @lang('site.add')</a>
                                    @else
                                        <button class="btn btn-primary" disabled>@lang('site.add') </button>
                                    @endif
                                    @if (auth()->user()->hasPermission('delete-'.$module_name_plural))
                            <form method="post" action="{{ route('dashboard.'.$module_name_plural.'.bulk_delete') }}" style="display: inline-block;">
                                @csrf
                                @method('delete')
                                <input type="hidden" name="record_ids" id="record-ids">
                                <button type="submit" class="btn btn-danger delete" id="bulk-delete" disabled="true"><i class="fa fa-trash"></i> @lang('site.bulk_delete')</button>
                            </form><!-- end of form -->
                        @endif


                            </div>
                        </div>
                    
                </div> {{-- end of box header --}}

                <div class="box-body">

                    {{-- @if ($rows->count() > 0) --}}

            <div class="table-responsive">          
               
                <table class="table table-hover datatable" id="{{$module_name_plural}}-table" style="width: 100% !important;">

                    <thead class="thead-dark">
                                <tr>
                                    <th>
                                        <div class="animated-checkbox">
                                            <label class="m-0" style="margin: 0px !important;">
                                                <input type="checkbox" id="record__select-all" style="margin: 0px !important;">
                                                <span class="label-text"></span>
                                            </label>
                                        </div>
                                    </th>
                                    <th>@lang('site.name')</th>
                                    <th>@lang('site.email')</th>
                                    <th>@lang('site.address')</th>
                                    <th>@lang('site.phone')</th>
                                    <th>@lang('site.active')</th>
                                    <th>@lang('site.action')</th>
                                   
                                </tr>
                            </thead>

                            <tbody>
                              

                            </tbody>

                        </table> {{-- end of table --}}
                        </div>


                </div> {{-- end of box body --}}

            </div> {{-- end of box --}}

        </section><!-- end of content -->

    </div><!-- end of content wrapper -->

@endsection
@push('script')
<script>
let rolesTable = $(`#{{$module_name_plural}}-table`).DataTable({
    dom: "tiplr",
    serverSide: true,
    processing: true,
    "language": {
        "url": "{{ asset('dashboard_files/datatable-lang/' . app()->getLocale() . '.json') }}"
    },
    ajax: {
        url: '{{ route('dashboard.'.$module_name_plural.'.data') }}',
       
    },
    columns: [
        {data: 'record_select', name: 'record_select', searchable: false, sortable: false},
        {data: 'name', name: 'name',searchable: true, sortable: true},
        {data: 'email', name: 'email',searchable: true, sortable: true},
        {data: 'address', name: 'address',searchable: true, sortable: true},
        {data: 'phone', name: 'phone',searchable: true, sortable: true},
        {data: 'active', name: 'active',searchable: true, sortable: true},
        {data: 'actions', name: 'actions', searchable: false, sortable: false, width: '20%'},
    ],
    order: [[1, 'desc']],
    drawCallback: function (settings) {
        $('.record__select').prop('checked', false);
        $('#record__select-all').prop('checked', false);
        $('#record-ids').val();
        $('#bulk-delete').attr('disabled', true);
    },
    
});
$('button#search').click(function (e) {
    e.preventDefault();
    let value = $('#data-table-search').val();
    rolesTable.search(value).draw();
});

</script>
@endpush