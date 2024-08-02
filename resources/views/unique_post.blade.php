@php
    
@endphp
@extends('master')

@section('unique_post')

<div class="container unique_post mt-5">
    <h1 style="color: #990033;"><u>{{ $post->title }}</u></h1>
    <br>
    <h6 class="d-flex">{{ $post->created_at }} <li class="ms-5">{{ $post->user->name }}</li></h6>
    <br>
    @php echo "$post->body" @endphp
</div>

@endsection
