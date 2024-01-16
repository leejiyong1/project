<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
   <style>
        body {
            padding-top: 56px;
        }

        @media (min-width: 768px) {
            body {
                padding-top: 70px;
            }
        }

        .container {
            max-width: 800px;
        }

        .board {
            margin-top: 20px;
        }

        .board .card {
            margin-bottom: 20px;
        }

        .write-post {
            margin-top: 20px;
        }
    </style>
</head>
<body>
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <a class="navbar-brand" href="#">게시판</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">홈 <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">게시판</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">로그인</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="board">
            <div class="write-post">
                <h3>새로운 글쓰기</h3>
                <form>
                    <div class="form-group">
                        <label for="postTitle">제목</label>
                        <input type="text" class="form-control" id="postTitle" placeholder="글 제목을 입력하세요">
                    </div>
                    <div class="form-group">
                        <label for="postContent">내용</label>
                        <textarea class="form-control" id="postContent" rows="3" placeholder="글 내용을 입력하세요"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">글쓰기</button>
                </form>
            </div>

        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>