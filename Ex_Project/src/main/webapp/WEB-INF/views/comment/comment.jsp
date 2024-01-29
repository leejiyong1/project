<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .comment-box {
            margin-top: 30px;
        }

        .comment-item {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }

        .comment-item:last-child {
            border-bottom: none;
        }

        .comment-author {
            font-weight: bold;
        }

        .comment-content {
            margin-left: 20px;
        }
    </style>
</head>
<body>
<div class="container">
        <div class="row">
            <div class="col-md-12">
                <!-- 댓글 목록 -->
                <div class="comment-box">
                    <h5>댓글</h5>
                    <div class="comment-item">
                        <span class="comment-author">사용자1</span>
                        <p class="comment-content">이것은 댓글 예시입니다.</p>
                    </div>
                    <div class="comment-item">
                        <span class="comment-author">사용자2</span>
                        <p class="comment-content">또 다른 댓글 예시입니다.</p>
                    </div>
                    <!-- 기타 댓글 아이템들... -->
                </div>

                <!-- 댓글 작성 폼 -->
                <div class="write-comment-box mt-4">
                    <h5>댓글 작성</h5>
                    <form>
                        <textarea class="form-control" rows="3" placeholder="댓글을 입력하세요..."></textarea>
                        <button type="submit" class="btn btn-primary mt-2">댓글 작성</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 부트스트랩 JS 파일 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>