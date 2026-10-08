function initRetinaImages() {
    if ($('.js_replace2x').css('font-size') == '1px') {
        $('img.js_replace2x').each(function() {
            $(this).attr('src', $(this).attr('rel'));
        });
    }
}
