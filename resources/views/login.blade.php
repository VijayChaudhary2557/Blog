@extends('master')

@section('login')
<div class="conatiner Brand-Logo d-flex justify-content-center m-5">
    <i class="fa-brands fa-laravel display-1 "></i>
</div>
<div class="container form-container border  rounded-4 w-50">
    <form action="{{ route('show') }}" method="post" class="m-3">
        @csrf
        @if(session('error'))
            <div class="alert alert-danger text-center">
                {{ session('error') }}
            </div>
        @endif
        <div class="mb-3 mt-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" class="form-control @error('email') is-invalid @enderror" id="email" placeholder="Enter email" value="{{ old('name') }}" name="email">
        </div>
        @error('email')
                <span class="text-danger">{{ $message }}</span>
        @enderror
        <div class="mb-3">
          <label for="password" class="form-label">Password:</label>
          <input type="password" class="form-control @error('password') is-invalid @enderror" id="password" placeholder="Enter password" name="password">
        </div>
        @error('password')
            <span class="text-danger">{{ $message }}</span>
        @enderror
        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" id='remember', name="remember">
            <label class="form-check-label" for="remember"> Remember me</label>
        </div>
        <div class="mb-3 form-check text-center">
            <a href="" >Forgot Your Password?</a>
            <button type="submit" class="btn btn-danger m-3 ">Login</button>
        </div>
      </form>
</div>
@endsection
