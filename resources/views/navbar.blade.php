@extends('user')

@section('navbar')

<div class="container mt-3">
    <h3 class=""><u>Add Categories in Navbar Menu:-</u></h3>
    @if(count($add)!=0)
    <table class="table table-success table-striped text-center border border-5 border-dark rounded" style="width: 600px;">
        <thead>
          <tr>
            <th scope="col"><h4>Category</h4></th>
            <th scope="col"><h4>Add</h4></th>
          </tr>
        </thead>
        <tbody>
            @foreach ($add as $a)
                <tr>
                    <td>{{ $a->category_name }}</td>
                    <td><button class="btn btn-success"><a href="/add/category/{{ $a->id }}/{{ $a->category_name }}" class="text-light">Add</a></button></td>
                </tr>
            @endforeach
        </tbody>
    </table>
    @else
        <div class="alert alert-danger"><p>There have no category to Add in Navbar Menu</p></div>
    @endif
</div>

<div class="container mt-5">
    <h3 class=""><u>Remove Categories From Navbar Menu:-</u></h3>
    @if(count($data)!=0)
    <table class="table table-success table-striped text-center border border-5 border-dark rounded" style="width: 600px;">
        <thead>
          <tr>
            <th scope="col"><h4>Category</h4></th>
            <th scope="col"><h4>Remove</h4></th>
          </tr>
        </thead>
        <tbody>
                @foreach ($data as $r)
                    <tr>
                        <td>{{ $r->category_name }}</td>
                        <td><button class="btn btn-success"><a href="/remove/category/{{ $r->id }}/{{ $r->category_name }}" class="text-light">Remove</a></button></td>
                    </tr>
                @endforeach
        </tbody>
    </table>
    @else
        <div class="alert alert-danger"><p>There have no category to remove in Navbar Menu</p></div>
    @endif
</div>

@endsection
