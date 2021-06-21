@extends('admin_layout')
@section('admin_content')
<div class="row">
    <div class="col-lg-12">
        <section class="panel">
            <header class="panel-heading">
                    THÊM NHÂN VIÊN
            </header>
            <div class="panel-body">
                <?php
                    $msg = Session::get('msg');
                    if($msg) {
                        echo "<h3 style='color:red; padding-left:500px;'>".$msg."</h3>";
                        Session::put('msg',null);
                    }
                ?>
                <div class="position-center">
                    <form role="form" action="{{URL::to('/add_staff')}}" method="post">
                            @csrf
                        <div class="form-group">
                            <label for="exampleInputEmail1">Họ Tên</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" min="3" max="50" name="name" required>
                        </div>
                        <span style="color: red;">{{$errors->first('typeName')}}</span>

                        <div class="form-group">
                            <label for="exampleInputEmail1">Email</label>
                            <input type="email" class="form-control" id="exampleInputEmail1"  min="3" max="50" name="email" placeholder="nguoinaodo@gmail.com" required>
                        </div>
                        <span style="color: red;">{{$errors->first('typeName')}}</span>

                        <div class="form-group">
                            <label for="exampleInputEmail1">số điện thoại</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" min="3" max="50" name="phone" required="">
                        </div>
                        <span style="color: red;">{{$errors->first('typeName')}}</span>

                        <div class="form-group">
                            <label for="exampleInputEmail1">địa chỉ </label>
                            <input type="text" class="form-control" id="exampleInputEmail1" min="3" max="50" name="address">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputEmail1">mật khẩu</label>
                            <input type="password" class="form-control" id="exampleInputEmail1" min="3" max="50" name="password">
                        </div>
                        <span style="color: red;">{{$errors->first('typeName')}}</span>

                        <div class="form-group">
                            <label for="exampleInputEmail1">nhập lại mật khẩu</label>
                            <input type="password" class="form-control" id="exampleInputEmail1" min="3" max="50" name="repassword">
                        </div>
                        <span style="color: red;">{{$errors->first('typeName')}}</span>

                        <button type="submit" class="btn btn-info" name="addType">Submit</button>
                    </form>

                    
                </div>
            </div>
        </section>

    </div>
</div>
@endsection