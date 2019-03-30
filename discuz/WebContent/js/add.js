window.onload = function () {
    //提交时检查
    document.getElementById("submit").onclick = function () {
        var title = document.getElementById("title").value;
        var content = document.getElementById("content").value
        if(title == "" || content == ""){
            document.getElementById("checktitle").innerHTML = "标题不能为空";
            document.getElementById("checktitle").style.backgroundColor = "red";
            document.getElementById("checkcontent").innerHTML = "内容不能空";
            document.getElementById("checkcontent").style.backgroundColor = "red";
            return false;
        }
    };
    //输入时检查标题
    document.getElementById("title").onfocus = function () {
        var title = document.getElementById("title").value;
        if(title == "") {
            document.getElementById("checktitle").innerHTML = "请输入标题";
            document.getElementById("checktitle").style.backgroundColor = "red";
        }
    };
    document.getElementById("title").onblur = function () {
        var title = document.getElementById("title").value;
        if(title == ""){
            document.getElementById("checktitle").innerHTML = "标题不能为空";
            document.getElementById("checktitle").style.backgroundColor = "red";
        }else{
            document.getElementById("checktitle").innerHTML = "ok";
            document.getElementById("checktitle").style.backgroundColor = "green";
        }
    };
    //输入时检查内容
    document.getElementById("content").onfocus = function () {
        var content = document.getElementById("content").value;
        if(content == "") {
            document.getElementById("checkcontent").innerHTML = "请输入内容";
            document.getElementById("checkcontent").style.backgroundColor = "red";
        }
    };
    document.getElementById("content").onblur = function () {
        var content = document.getElementById("content").value;
        if(content == ""){
            document.getElementById("checkcontent").innerHTML = "内容不能空";
            document.getElementById("checkcontent").style.backgroundColor = "red";
        }else{
            document.getElementById("checkcontent").innerHTML = "ok";
            document.getElementById("checkcontent").style.backgroundColor = "green";
        }
    };
};