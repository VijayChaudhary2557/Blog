<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Mini Blog</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <style>
        nav {
            background-color: #990033;
        }

        body {
            background-color: #9900330e;

            font-family: Alkatra;

            letter-spacing: 1px;

            word-spacing: 2px;
        }

        a {
            text-decoration: none;
        }


        .active {
            font-weight: bold;
        }
        .form-container {
            background-color: white;
            box-shadow: rgb(247, 245, 245) 0px 2px 40px 1px;
        }

        .my-post {
            background-color: white;
            width: 700px;
            margin: 10px auto;
            box-shadow: 0px 4px 8px -2px rgba(9, 30, 66, 0.25), 0px 0px 0px 1px rgba(9, 30, 66, 0.08);
            padding: 20px

        }

        .text-muted {
            margin: 5px 5px;
        }

        .pagination {
            margin: 5px 5px;

        }

        .pagination-container {
    background-color: white;
    padding: 10px;
    border-radius: 5px;
}
        .pagination {
    background-color: #212529;
    padding: 10px;
    border-radius: 5px;
}

/* Ensure the individual page items also have a white background */
.pagination .page-item .page-link {
    background-color: white;
    color: #007bff;
    border: 1px solid #dee2e6;
}

/* Customize the active page item */
.pagination .page-item.active .page-link {
    background-color: #007bff;
    border-color: #007bff;
    color: white; Active link text color
}

/* Customize the hover state */
.pagination .page-item .page-link:hover {
    background-color: #e9ecef;
    color: #0056b3;
}

.align-items-sm-center  {
    background-color: #212529;
}

.my-brand {
    text-decoration: none;
}

img {
    width: 300px;
    height: auto;
    border: 1px solid black;
    border-radius: 20px;
    margin: 10px;
}


.unique_post {
    width: 800px;
    background-color: white;
    padding: 20px;
    box-shadow: 0px 4px 8px -2px rgba(9, 30, 66, 0.25), 0px 0px 0px 1px rgba(9, 30, 66, 0.08);
}

/* div:has(> .pagination) {
    background-color: ;
} */

.pagination {
    background-color: transparent;

}
/* nav.d-flex.justify-items-center {
    background-color: yellow;
} */

div.d-none.flex-sm-fill.d-sm-flex.align-items-sm-center.justify-content-sm-between {
    /* background-color: yellow; */
    background-color: #fffffff0;
}

    </style>
</head>
@php
    use App\Models\NavbarMenu;

    $category = NavbarMenu::with('category_navbar')->get();
@endphp
<body>
    <nav class="navbar navbar-expand-lg ">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">
                <i class="fa-brands fa-laravel display-6 text-light"></i>
                <span class="h2 text-light"><a href="/" class="h2 text-light my-brand">Mini Blog</a></span>
            </a>
            <ul class="navbar-nav"></ul>
            <button class="navbar-toggler text-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon "></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    @if($category!=null)
                        @foreach ($category as $c)
                            <li class="nav-item">
                                <a class="nav-link text-light me-2" href="/category/{{ $c->category_id }}"><span class="glyphicon glyphicon-user">{{ $c->category->category_name }}</span></a>
                            </li>
                        @endforeach
                    @endif
                    @if(Auth::check())
                        <li class="nav-item">
                            <a class="nav-link text-light" href="{{ route('dashboard') }}"><span class="glyphicon glyphicon-user"></span>Admin</a>
                        </li>
                    @else
                        <li class="nav-item">
                            <a class="nav-link text-light {{ request()->is('login') ? 'active ' : '' }}" href="{{ route('login') }}"><span class="glyphicon glyphicon-user"></span> Login</a>
                        </li>
                    @endif
                    <li class="nav-item">
                        <a class="nav-link text-light {{ request()->is('register') ? 'active ' : '' }}" href="{{ route('register') }}"><span class="glyphicon glyphicon-log-in"></span> Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        @yield('register')
        @yield('login')
        @yield('post')
        @yield('unique_post')
        @yield('category')
    </div>
    <footer>

    </footer>
</body>
</html>
