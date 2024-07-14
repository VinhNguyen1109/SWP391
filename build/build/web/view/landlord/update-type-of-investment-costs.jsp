


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Thêm sản phẩm | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <!--  <link rel="stylesheet" type="text/css" href="../Resource/doc/css/main.css">-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Resource/doc/css/main.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script type="text/javascript" src="/admin/ckeditor/ckeditor.js"></script>
        <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
        <script>

            function readURL(input, thumbimage) {
                if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#thumbimage").attr('src', e.target.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                } else { // Sử dụng cho IE
                    $("#thumbimage").attr('src', input.value);

                }
                $("#thumbimage").show();
                $('.filename').text($("#uploadfile").val());
                $('.Choicefile').css('background', '#14142B');
                $('.Choicefile').css('cursor', 'default');
                $(".removeimg").show();
                $(".Choicefile").unbind('click');

            }
            $(document).ready(function () {
                $(".Choicefile").bind('click', function () {
                    $("#uploadfile").click();

                });
                $(".removeimg").click(function () {
                    $("#thumbimage").attr('src', '').hide();
                    $("#myfileupload").html('<input type="file" id="uploadfile"  onchange="readURL(this);" />');
                    $(".removeimg").hide();
                    $(".Choicefile").bind('click', function () {
                        $("#uploadfile").click();
                    });
                    $('.Choicefile').css('background', '#14142B');
                    $('.Choicefile').css('cursor', 'pointer');
                    $(".filename").text("");
                });
            })
        </script>
    </head>

    <body class="app sidebar-mini rtl">
        <style>
            .Choicefile {
                display: block;
                background: #14142B;
                border: 1px solid #fff;
                color: #fff;
                width: 150px;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                padding: 5px 0px;
                border-radius: 5px;
                font-weight: 500;
                align-items: center;
                justify-content: center;
            }

            .Choicefile:hover {
                text-decoration: none;
                color: white;
            }

            #uploadfile,
            .removeimg {
                display: none;
            }

            #thumbbox {
                position: relative;
                width: 100%;
                margin-bottom: 20px;
            }

            .removeimg {
                height: 25px;
                position: absolute;
                background-repeat: no-repeat;
                top: 5px;
                left: 5px;
                background-size: 25px;
                width: 25px;
                /* border: 3px solid red; */
                border-radius: 50%;

            }

            .removeimg::before {
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
                content: '';
                border: 1px solid red;
                background: red;
                text-align: center;
                display: block;
                margin-top: 11px;
                transform: rotate(45deg);
            }

            .removeimg::after {
                /* color: #FFF; */
                /* background-color: #DC403B; */
                content: '';
                background: red;
                border: 1px solid red;
                text-align: center;
                display: block;
                transform: rotate(-45deg);
                margin-top: -2px;
            }

            .hidden {
                display: none;
            }

            .error {
                border: 2px solid red;
            }

            #errorMessage {
                color: red;
                margin-top: 5px;
            }
        </style>
        <!-- Navbar-->
        <header class="app-header">
            <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                            aria-label="Hide Sidebar"></a>
            <!-- Navbar Right Menu-->
            <ul class="app-nav">
                <!-- User Menu-->
                <li><a class="app-nav__item" href="/index.html"><i class='bx bx-log-out bx-rotate-180'></i> </a>
                </li>
            </ul>
        </header>
        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="/images/hay.jpg" width="50px"
                                                alt="User Image">
                <div>
                    <p class="app-sidebar__user-name"><b>${sessionScope.account.getFullName()}</b></p>
                    <p class="app-sidebar__user-designation">Chào mừng bạn trở lại</p>
                </div>
            </div>
            <hr>
            <ul class="app-menu">
                <li><a class="app-menu__item active" href="home-controller"><i class='app-menu__icon bx bx-tachometer'></i><span class="app-menu__label">Quản lí trọ</span></a></li>
                <li><a class="app-menu__item" href="management-lodging-houses"><i class='app-menu__icon bx bx-id-card'></i><span class="app-menu__label">Quản lí thu chi</span></a></li>             
                <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-user-voice'></i><span class="app-menu__label">Chỉ số điện</span></a></li>
                <li><a class="app-menu__item" href="table-data-product.html"><i class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản phẩm</span></a></li>
                <li><a class="app-menu__item" href="table-data-oder.html"><i class='app-menu__icon bx bx-task'></i><span class="app-menu__label">Chỉ số nước</span></a></li>             
                <li><a class="app-menu__item active" href="${pageContext.request.contextPath}/type-of-investment-costs-servlet"><i class='app-menu__icon bx bx-id-card'></i>
                        <span class="app-menu__label">Quản lý loại phí đầu tư</span></a></li>           
                <li><a class="app-menu__item" href="account?service=showProfile"><i
                            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Thông tin cá nhân</span></a>
                </li> 
                <li><a class="app-menu__item" href="#"><i class='app-menu__icon bx bx-cog'></i><span class="app-menu__label">Cài đặt hệ thống</span></a></li>
            </ul>
        </aside>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item">Danh sách loại chi phí đầu tư</li>
                    <li class="breadcrumb-item"><a href="#">Sửa chi phí đầu tư</a></li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Sửa loại chi phí đầu tư</h3>
                        <div class="tile-body">
                            <form class="row" action="update-type-of-investment-costs-servlet" method="post" id="form-1">
                                <div class="form-group col-md-12">
                                    <label class="control-label">Tên loại chi phí đầu tư</label>
                                    <input class="form-control" type="text" placeholder="Tên loại phí đầu tư" name="name" id="inputField" value="${requestScope.typeOfInvestmentCost.getName()}" required>
                                    <div id="duplicate" class="hidden">Loại phí đầu tư này đã có</div>
                                    <div id="errorMessage" class="hidden">Nhập đúng theo quy tắc (Không để toàn khoảng trắng, phần từ đầu và cuối không là khoảng trắng, giữa 2 chữ không có nhiều hơn 1 khoảng trắng,không có kí tự đặc biệt ...)</div>                 
                                    <input type="hidden" name="id" value="${requestScope.typeOfInvestmentCost.getId()}">
                                </div>
                                <button class="btn btn-save" type="submit" id="submitButton" style="margin-right: 10px">Lưu lại</button>
                                <a class="btn btn-cancel" href="type-of-investment-costs-servlet">Hủy bỏ</a>
                            </form>
                        </div>
                    </div>
                    </main>
                    <script src="js/jquery-3.2.1.min.js"></script>
                    <script src="js/popper.min.js"></script>
                    <script src="js/bootstrap.min.js"></script>
                    <script src="/admin/js/main.js"></script>
                    <script src="js/plugins/pace.min.js"></script>

                    <script>
            var isDuplicate = false;
            function validateInput(inputElement) {
                // Lấy giá trị từ thẻ input
                const inputValue = inputElement.value;
                // Kiểm tra nếu giá trị chỉ toàn khoảng trắng
                if (inputValue.trim() === '') {
                    return false;
                }
                // Kiểm tra nếu phần tử đầu tiên hoặc phần tử cuối cùng là khoảng trắng
                if (inputValue[0] === ' ' || inputValue[inputValue.length - 1] === ' ') {
                    return false;
                }

                const specialCharPattern = /[^a-zA-Z0-9\s\u00C0-\u024F\u1E00-\u1EFF]/;
                if (specialCharPattern.test(inputValue)) {
                    return false;
                }
                const parts = inputValue.split(' ');
                let spaceCount = 0;

                for (let i = 0; i < parts.length; i++) {
                    if (parts[i] === '') {
                        spaceCount++;
                        if (spaceCount > 0) {
                            return false;
                        }
                    } else {
                        spaceCount = 0;
                    }
                }
                var investmentCosts = '<%= request.getAttribute("jsonListTypeOfInvestmentCosts") %>';
                var investmentCostsArray = JSON.parse(investmentCosts);

                for (let i = 0; i < investmentCostsArray.length; i++) {
                    if (investmentCostsArray[i].trim() === inputValue.trim()) {
                        isDuplicate = true;
                        return false;
                    } else {
                        isDuplicate = false;
                    }
                }
                return true;
            }
            function updateSubmitButtonState() {
                const inputField = document.getElementById('inputField');
                const isValid = validateInput(inputField);
                const errorMessage = document.getElementById('errorMessage');
                const duplicateMessage = document.getElementById('duplicate');
                const submitButton = document.getElementById('submitButton');

                // Ẩn cả hai thông báo lỗi trước khi xác định điều kiện
                errorMessage.classList.add('hidden');
                duplicateMessage.classList.add('hidden');

                if (!isValid) {
                    // Nếu dữ liệu không hợp lệ (rỗng hoặc chỉ chứa khoảng trắng)
                    inputField.classList.add('error');

                    // Kiểm tra xem dữ liệu trùng tên hay không
                    if (isDuplicate) {
                        duplicateMessage.classList.remove('hidden');
                        errorMessage.classList.add('hidden');
                    } else {
                        errorMessage.classList.remove('hidden');
                        duplicateMessage.classList.add('hidden');
                    }

                    submitButton.disabled = true; // Vô hiệu hóa nút submit
                } else {
                    // Nếu dữ liệu hợp lệ
                    inputField.classList.remove('error');
                    errorMessage.classList.add('hidden');
                    duplicateMessage.classList.add('hidden');
                    submitButton.disabled = false; // Kích hoạt nút submit
                }
            }
            document.getElementById('inputField').addEventListener('blur', function () {
                updateSubmitButtonState();
            });

            document.getElementById('inputField').addEventListener('input', function () {
                updateSubmitButtonState(); // Cập nhật trạng thái nút submit khi có sự kiện input
            });
            document.getElementById('submitButton').addEventListener('click', function (event) {
                const inputField = document.getElementById('inputField');
                const isValid = validateInput(inputField);
                const errorMessage = document.getElementById('errorMessage');
                const form = document.getElementById('form-1');
                const submitButton = document.getElementById('submitButton');

                if (!isValid) {
                    event.preventDefault(); // Ngăn chặn việc gửi form nếu có lỗi
                    inputField.classList.add('error');
                    errorMessage.classList.remove('hidden');
                    submitButton.disabled = true; // Khóa nút submit nếu nhập liệu không hợp lệ
                }
            });
                    </script>
                    </body>

                    </html>