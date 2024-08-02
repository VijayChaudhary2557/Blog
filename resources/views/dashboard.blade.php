@extends('user')
@php
    function truncateText($text, $limit = 100) {
                if (strlen($text) > $limit) {
                    return substr($text, 0, $limit) . '..............';
                } else {
                    return $text;
                }
            }
@endphp
@section('title')
Dashboard
@endsection
@section('dashboard')

@if(session()->has('msg'))
    <div class="alert alert-success mt-5">{{ session('msg') }}</div>
@endif
@if(isset($err))
    <div class="alert alert-danger mt-5">{{ $err }}</div>
@elseif(isset($data))
<table class="table table-striped table-danger mt-4 table-bordered rounded">
    <thead>
      <tr>
        <th scope="col" class="col-2">Name</th>
        <th scope="col" class="col-2">Title</th>
        <th scope="col" class="col-5">Body</th>
        <th scope="col" class="col-3">Action</th>
      </tr>
    </thead>
    <tbody>
    @foreach ($data as $post)
    <tr>
        <th scope="row">{{ $post->user->name }}</th>
        <td>{{ $post->title }}</td>


        @php
            $body = $post->body;

            // Find the position of <figure> tag in the content
            $startPos = strpos($body, '<figure class="image image-style-side">');
            $endPos = strpos($body, '</figure>', $startPos);

            if ($startPos !== false && $endPos !== false) {
                // Remove the <figure> element including its content
                $body = substr_replace($body, '', $startPos, $endPos - $startPos + strlen('</figure>'));
            }



            $truncatedBody = truncateText(strip_tags($body), 150);

            // Output or use $body as needed (now without the <figure> element)
        @endphp


        <td><p>{{ $truncatedBody }}</p></td>
        <td>
            <a href="{{ url('/post/edit',$post->id) }}" class="btn btn-primary ms-3 me-3">Edit</a>
            <a href="{{ url('/post/delete',$post->id) }}" class="btn btn-danger ">Delete</a>
        </td>
    </tr>
    @endforeach
</tbody>
</table>
@else
    <div class="alert alert-success">Welcome New User</div>
@endif




@endsection

