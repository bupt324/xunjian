package com.wp.service.sendtask;

import com.wp.dao.DaoSupport;
import com.wp.util.PageData;
import org.springframework.stereotype.Service;
import com.wp.service.house.HouseService;
import javax.annotation.Resource;

/**
 * Created by wp on 2018/1/13.
 */
@Service("sendTaskService")
public class SendTaskService
{
    @Resource(name = "daoSupport")
    private DaoSupport dao;
    @Resource(name = "HouseService")
    private HouseService houseService;

    /*
   * 新增
   */
    public void save(PageData pd)throws Exception{
        dao.save("SendTaskMapper.save", pd);
        houseService.editStatus2(pd);
    }

    //    修改图片
    public void editPic(PageData pd)throws Exception{
        dao.update("SendTaskMapper.editpic", pd);
    }

    public PageData count(PageData pd)throws Exception{
        return (PageData)dao.findForObject("SendTaskMapper.count", pd);
    }
}
