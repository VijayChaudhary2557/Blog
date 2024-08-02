@extends('user')
@section('title')
Edit Post
@endsection
@section('post')
    <div class="container">
        @if(session('msg'))
            <div class="alert alert-success m-5 mb-0">{{ session('msg') }}</div>
        @endif
        <div class="create-post-form m-5 border rounded form-shadow">
            <h3 class="p-3 border-bottom ">Edit Post</h3>
            <form method="POST" class="p-3" action="{{ route('postUpdate', ['id' => $id]) }}">
                @csrf
                <div class="form-group">
                    <label for="title" class="form-label">Title</label>
                    <input type="text" class="form-control" id="title" name="title" value="{{ $post->title }}" required>
                </div>
                <div class="form-group">
                    <label for="slug" class="form-label">Slug</label>
                    <input type="text" class="form-control" id="slug" name="slug" value="{{ $post->slug }}" required>
                </div>
                <br>
                <div class="form-group">
                    <label for="body" class="form-label">Body</label>
                    <textarea class="form-control" id="content" name="body" rows="4">@php echo $post->body; @endphp</textarea>
                </div>
                <button type="submit" class="btn btn-success mt-3">Update</button>
            </form>
        </div>
    </div>
    <script>
        ClassicEditor.create(document.querySelector('#content'), {
            ckfinder: {
                uploadUrl: '{{ route('upload_image') }}?_token={{ csrf_token() }}'
            }
        })
        .catch(error => {
            console.error(error);
        });
    </script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
@endsection
