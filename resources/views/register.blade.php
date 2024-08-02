@extends('master')

@section('register')
    <div class="conatiner Brand-Logo d-flex justify-content-center m-5">
        <i class="fa-brands fa-laravel display-1"></i>
    </div>
    <div class="container form-container border  rounded-4 w-50">
        <form action="{{ route('store') }}" method="post" class="m-3">
            @csrf
            <div class="mb-3 mt-3">
              <label for="name" class="form-label">Name:</label>
              <input type="text" class="form-control @error('name') is-invalid @enderror" id="name" placeholder="Enter name" value="{{ old('name') }}" name="name">
            </div>
            @error('name')
                <span class="text-danger">{{ $message }}</span>
            @enderror
            <div class="mb-3 mt-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control @error('email') is-invalid @enderror" id="email" placeholder="Enter email" value="{{ old('email') }}" name="email">
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
            <div class="mb-3">
                <label for="password_confirmation" class="form-label">Confirm Password:</label>
                <input type="password" class="form-control @error('password_confirmation') is-invalid @enderror" id="password_confirmation" placeholder="Confirm password" name="password_confirmation">
            </div>
            @error('password_confirmation')
                <span class="text-danger">{{ $message }}</span>
            @enderror
            <div class="text-center">
                <button type="submit" class="btn btn-danger">Register</button>
            </div>
        </form>
    </div>
@endsection
