@extends('user')
@section('title', 'Post')

@section('post')
    <div class="container">
        @if(session('msg'))
            <div class="alert alert-success m-5 mb-0">{{ session('msg') }}</div>
        @endif
        <div class="create-post-form m-5  rounded form-shadow">
            <h3 class="p-3 border-bottom">Create Post</h3>
            <form method="POST" class="p-3" action="{{ route('postCreate') }}">
                @csrf
                <div class="form-group">
                    <label for="title" class="form-label">Title</label>
                    <input type="text" class="form-control" id="title" name="title" required>
                </div>
                <div class="form-group">
                    <label for="slug" class="form-label">Slug</label>
                    <input type="text" class="form-control" id="slug" name="slug" required>
                </div>
                @if(session('err'))
                    <div class="text-danger">
                        {{ session('err') }}
                    </div>
                @endif
                <br>

                <div class="form-group" >
                    <label for="body" class="form-label">Body</label>
                    <textarea class="form-control" id="content" name="body" rows="4"></textarea>
                </div>                <br>
                <div class="form-group">
                    <label class="form-label" for="category">Category</label>
                    <div class="category">
                        @if(isset($category) && $category != null)
                            @foreach ($category as $c)
                                <input type="radio" name="category_name" value="{{ $c['category_name'] }}"><label class="ms-3">{{ $c['category_name'] }}</label>
                                <br>
                            @endforeach
                        @endif
                    </div>

                    <input type="text" placeholder="Add New Category" class="ms-3"><input type="button" class="btn btn-success ms-3" onclick="addCategory(this)" value="Add">
                    
                </div>
                <button type="submit" class="btn btn-success mt-3">Post</button>
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

    <script>
        function addCategory(ele) {
            let category = ele.previousElementSibling;
            let new_category = category.value;
            if (new_category != "") {
                let checkbox = document.createElement("input");
                checkbox.value = new_category;
                checkbox.setAttribute('type', 'radio');
                checkbox.setAttribute('name', 'category_name');

                let label = document.createElement("label");
                label.textContent = new_category;
                label.setAttribute('class', 'ms-3');

                category.previousElementSibling.appendChild(checkbox);
                category.previousElementSibling.appendChild(label);
                category.previousElementSibling.appendChild(document.createElement("br"));
                category.value = "";
            }
        }
    </script>
@endsection
