function chat_popup() {

    var width = 350;
    var height = 700;

    var top = -115;

    var windowStatus = 'width=' + width + ', height=' + height + ', top=' + top + ', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';

    const url = "./chatting.html"

    window.open(url, "1:1 popup", windowStatus);
};