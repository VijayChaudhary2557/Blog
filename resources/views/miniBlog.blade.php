@extends('master')
@php

@endphp
@section('post')
@if($l>0)
<div class="container post-container">

    @foreach ($post as $p)
    <div class="my-post mt-3 " style="letter-spacing: 1px; word-spacing: 2px;">
        <h4 class="text-center post-title"><a href="Mini-Blog/{{ $p->slug }}" style="text-decoration:none; font-family: Alkatra; color: #990033;" class="">{{ $p->title }}</a></h4>
        <hr>
    @php
        $body = $p->body;
        // Find the position of <figure> tag in the content
        $startPos = strpos($body, '<figure class="image image-style-side">');
        $endPos = strpos($body, '</figure>', $startPos);
        if ($startPos !== false && $endPos !== false) {
            // Remove the <figure> element including its content
            $body = substr_replace($body, '', $startPos, $endPos - $startPos + strlen('</figure>'));
        }
        $truncatedBody = (function($text, $limit = 100) {
            if (strlen($text) > $limit) {
                return substr($text, 0, $limit) . '...';
            } else {
                return $text;
            }
        })(strip_tags($body), 250);
        // Output or use $body as needed (now without the <figure> element)
    @endphp
    <p>{{ $truncatedBody }}</p>
    <br>
    <button class="btn btn-danger"><a href="Mini-Blog/{{ $p->slug }}" class="text-light">Continue Reading</a></button>
    </div>
    @endforeach
    <div class="container my-page">
        <p class="bg-success">{{ $post->links() }}</p>
    </div>
</div>
@endif
@endsection
