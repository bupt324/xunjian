package com.wp.controller.event;

import com.wp.controller.base.BaseController;
import com.wp.entity.Page;
import com.wp.service.event.EventService;
import com.wp.util.Const;
import com.wp.util.PageData;
import com.wp.util.Tools;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/eventManage")
public class EventController extends BaseController{
    String menuUrl = "eventManage/list.do"; //菜单地址(权限用)
    @Resource(name = "eventService")
    private EventService eventService;

    @RequestMapping(value = "list")
    public ModelAndView listEvent(Page page) {
        ModelAndView mv = new ModelAndView();
        PageData pd = new PageData();
        try{
            pd = this.getPageData();
            String  enquiry = pd.getString("enquiry");
            if(null != enquiry && !"".equals(enquiry)){
                pd.put("enquiry", enquiry.trim());
            }else {
                pd.put("enquiry", "");
            }
            page.setPd(pd);
            List<PageData> varList = eventService.list(page);	//列出${objectName}列表
            mv.setViewName("taskManage/eventManage");
            mv.addObject("varList", varList);
            mv.addObject("pd", pd);
            mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
        } catch(Exception e){
            logger.error(e.toString(), e);
        }
        return mv;
    }

    @RequestMapping(value = "addEvent", method = {RequestMethod.GET})
    public ModelAndView addEvent() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("taskManage/addEvent");
        return mv;
    }

    @RequestMapping(value = "addEvent1")
    public ModelAndView addEvent1(PrintWriter out) throws Exception {
        ModelAndView mv = new ModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        pd.put("create_time",  Tools.date2Str(new Date()));
        eventService.save(pd);
        out.write("success");
        out.close();
        return mv;
    }

    @RequestMapping(value = "editEvent")
    public ModelAndView editEvent() throws Exception {
        ModelAndView mv = new ModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        PageData result = eventService.getEventById(pd);
        mv.setViewName("taskManage/addEvent");
        mv.addObject("pd", result);
        return mv;
    }

    @RequestMapping(value = "addWorkContent", method = {RequestMethod.GET})
    public ModelAndView addWorkContent() {
        ModelAndView mv = new ModelAndView();
        PageData pd = new PageData();
        pd = this.getPageData();
        mv.setViewName("taskManage/addWorkContent");
        mv.addObject("eventName",pd.getString("eventName"));
        return mv;
    }

    @RequestMapping(value = "addWorkContent", method = {RequestMethod.POST})
    public ModelAndView addWorkContent1(PrintWriter out) {
        ModelAndView mv = new ModelAndView();
        PageData pd = this.getPageData();

        return mv;
    }

    /* ===============================权限================================== */
    public Map<String, String> getHC(){
        Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
        Session session = currentUser.getSession();
        return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
    }
    /* ===============================权限================================== */

    @InitBinder
    public void initBinder(WebDataBinder binder){
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
    }

}
