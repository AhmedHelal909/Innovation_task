{{ csrf_field() }}
<div class="row" style="margin: 0 !important;">

    <div class="col-md-12">
        <div class="form-group">
            <label>@lang('site.name')</label>
            <input type="name" class="form-control  @error('name') is-invalid @enderror" name="name"
                value="{{ isset($row) ? $row->name : old('name') }}">
            @error('name')
                <small class=" text text-danger" role="alert">
                    <strong>{{ $message }}</strong>
                </small>
            @enderror
        </div>
    </div>
</div>

<div class="row" style="margin: 0 !important;">

    <div class="col-md-6">
        <div class="form-group">
            <label>@lang('site.active')</label>
            <select name="active" class='form-control'>
                <option value="1" @if (isset($row) && $row->active == '1') selected @endif>@lang('site.active')</option>
                <option value="0" @if (isset($row) && $row->active == '0') selected @endif>@lang('site.deActive')</option>
            </select>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label>@lang('site.image')</label>
            <input type="file" name="image" class="form-control image @error('image') is-invalid @enderror">
            @error('image')
                <small class=" text text-danger" role="alert">
                    <strong>{{ $message }}</strong>
                </small>
            @enderror
        </div>
    </div>



</div>
