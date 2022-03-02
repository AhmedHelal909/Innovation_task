{{ csrf_field() }}
<div class="row" style="margin: 0 !important;">

    <div class="col-md-6">
        <div class="form-group">
            <label>@lang('site.name')</label>
            <input type="text" class="form-control  @error('name') is-invalid @enderror" name="name"
                value="{{ isset($row) ? $row->name : old('name') }}">
            @error('name')
                <small class=" text text-danger" role="alert">
                    <strong>{{ $message }}</strong>
                </small>
            @enderror
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <label>@lang('site.price')</label>
            <input type="text" class="form-control  @error('price') is-invalid @enderror" name="price"
                value="{{ isset($row) ? $row->price : old('price') }}">
            @error('price')
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
            <input type="file" name="image[]" class="form-control image @error('image') is-invalid @enderror" multiple>
            @error('image')
                <small class=" text text-danger" role="alert">
                    <strong>{{ $message }}</strong>
                </small>
            @enderror
        </div>
    </div>



</div>
<div class="row" style="margin: 0 !important;">

    <div class="col-md-12">
        <div class="form-group">
            <label>@lang('site.description')</label>
            <textarea name="description"
                class='form-control'>{{ isset($row) ? $row->description : old('description') }}</textarea>
            @error('description')
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
            <label>@lang('site.category_id')</label>
            <select name="cat_id" class='form-control'>
                @foreach (\App\Models\Category::all() as $cat)
                    <option value="{{ $cat->id }}" @if (isset($row) && $row->category_id === $cat->id) selected @endif>
                        {{ $cat->name }}</option>
                @endforeach
            </select>
        </div>
    </div>
</div>
