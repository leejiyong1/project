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

        /* 추가된 부분 */
        #postContent {
            resize: vertical; /* 수직 크기 조절 허용 */
        }
    </style>
</head>
<body>
	<div class="container">
        <div class="board">
            <div class="write-post">
                <h3>새로운 글쓰기</h3>
                <form enctype="multipart/form-data" method="post" action="board_write.do">
                    <div class="form-group">
                        <label for="postTitle">제목</label>
                        <input type="text" class="form-control" id="postTitle" placeholder="글 제목을 입력하세요">
                    </div>
                    <div class="form-group">
                        <label for="postContent">내용</label>
                        <textarea class="form-control" id="postContent" rows="5" placeholder="글 내용을 입력하세요"></textarea>
                    </div>
                    <!-- 사진 업로드 추가 -->
                    <div class="form-group">
                        <label for="postImage">사진 업로드</label>
                        <input type="file" class="form-control-file" id="postImage" multiple="multiple">
                    </div>
                    <button type="submit" class="btn btn-primary">글쓰기</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>