function validateLogin(){

    // var mailformat = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;

    if ($('#exampleInputEmail1').val().trim() === '') {
        $('#userErrDivId').html('please enter username');
        return false;

    }else if($('#exampleInputPassword1').val().trim() === ''){
        $('#userErrDivId').html('');
        $('#passwordErrDivId').html('please enter password');
        return false;
    }else{
        return true;
    }

}