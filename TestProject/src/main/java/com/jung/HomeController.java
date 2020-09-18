package com.jung;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping(value = "/")
    public String index() {
        return "index";
    }

    @RequestMapping(value = "left_frame")
    public String left_frame() {
        return "left_frame";
    }

    @RequestMapping(value = "main_frame")
    public String main_frame() {
        return "main_frame";
    }

    @RequestMapping(value = "Error")
    public String Error() {
        return "JSP/Error";
    }

    @RequestMapping(value = "delete")
    public String delete() {
        return "JSP/delete";
    }

    @RequestMapping(value = "/login_process")
    public String login_process() {
        return "JSP/Register_Login/login_process";
    }

    @RequestMapping(value = "/logout")
    public String logout() {
        return "JSP/Register_Login/logout";
    }

    @RequestMapping(value = "personal_info")
    public String personal_info() {
        return "JSP/Register_Login/personal_info";
    }

    @RequestMapping(value = "/admin")
    public String admin() {
        return "JSP/Register_Login/admin";
    }

    public String ckeck_all() {return "JSP/Register_Login/ckeck";}

    @RequestMapping(value = "/userid_ck")
    public String userid_ck() {
        return ckeck_all() + "/userid_ck";
    }

    @RequestMapping(value = "/register_form")
    public String register_h() {
        return "HTML/Register_Login/register";
    }

    @RequestMapping(value = "/register_ck")
    public String register_ck() {
        return ckeck_all()+"/insert_ck";
    }
    @RequestMapping(value = "/zipcode_sr")
    public String zipcode_sr() {
        return ckeck_all()+"/zipcode_sr";
    }

    @RequestMapping(value = "/security_ck")
    public String security_ck() {
        return ckeck_all()+"/security_ck";
    }

    public String modify_select() {
        return "JSP/Register_Login/Modify";
    }

    @RequestMapping(value = "/modify")
    public String modify_list () {
        return modify_select()+"/modi_list";
    }

    @RequestMapping(value = "/modify_process")
    public String modi_process () { return modify_select()+ "/modi_process";}

    @RequestMapping(value = "/modify/modi_addr")
    public String modify_addr() {
        return modify_select()+"/modify_addr";
    }


    @RequestMapping(value = "/admin/show")
    public String admin_show () { return "JSP/Register_Login/admin_show";}

    /*----------------------------------------------------------*/
    //blog

    public String blog () { return "JSP/blog";}

    @RequestMapping(value = "/blog")
    public String b_list() {return blog()+"/list_b";}

    @RequestMapping(value = "/blog/write")
    public String b_write () { return blog()+"/write_b";}

    @RequestMapping(value = "/blog/save")
    public String b_save () { return blog()+"/save_b";}


    // Free Board

    public String FB () {return "JSP/Free_board";}

    @RequestMapping(value = "/Free_b_w")
    public String FB_w() {return FB()+"/FB_w";}

    @RequestMapping(value = "/Free_b_s")
    public String FB_s() {return FB()+"/FB_s";}

    @RequestMapping(value = "/Free_b_l")
    public String FB_list() {return FB()+"/FB_list";}

    @RequestMapping(value = "/Free_b_r")
    public String FB_read() {return FB()+"/FB_r";}

}
