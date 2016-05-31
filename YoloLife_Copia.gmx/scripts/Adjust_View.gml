globalvar display_w, display_h, gray_alpha;
display_w = display_get_width();
display_h = display_get_height();
if (os_type == os_android || os_type == os_ios) {
    w = display_w;
    h = display_h;
    view_wview = w;
    view_hview = h;
    view_wport = w;
    view_hport = h;
}
