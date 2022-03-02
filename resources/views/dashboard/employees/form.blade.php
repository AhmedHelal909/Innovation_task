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
        <label>@lang('site.email')</label>
        <input type="email" class="form-control  @error('email') is-invalid @enderror" name="email"
            value="{{ isset($row) ? $row->email : old('email') }}">
        @error('email')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>


<div class="col-md-6">
    <div class="form-group">
        <label>@lang('site.password')</label>
        <input type="password" class="form-control  @error('password') is-invalid @enderror" name="password" value="">
        @error('password')
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
        <label>@lang('site.password_confirmation')</label>
        <input type="password" class="form-control  @error('confirmPassword') is-invalid @enderror"
            name="confirmPassword" value="">
        @error('confirmPassword')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
<div class="col-md-6">
    <div class="form-group">
        <label>@lang('site.active')</label>
        <select name="active" class='form-control'>
            <option value="1" @if (isset($row) && $row->active == '1') selected @endif>@lang('site.active')</option>
            <option value="0" @if (isset($row) && $row->active == '0') selected @endif>@lang('site.deActive')</option>
        </select>
    </div>
</div>
</div>
<div class="row" style="margin: 0 !important;">
<div class="col-md-12">
    <div class="form-group">
        <label>@lang('site.phone')</label>
        <input type="tel" pattern="(01)[0-2]{1}[0-9]{8}" required
            class="form-control  @error('phone') is-invalid @enderror" name="phone" value="{{ isset($row) ? $row->phone : old('phone') }}">
        @error('phone')
            <small class=" text text-danger" role="alert">
                <strong>{{ $message }}</strong>
            </small>
        @enderror
    </div>
</div>
</div>


