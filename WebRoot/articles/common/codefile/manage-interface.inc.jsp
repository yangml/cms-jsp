<%@ page import = "jtbc.*" %>
<%@ page import = "jtbc.dbc.*" %>
<%
class module extends jpage
{
  private admin admin;
  private upfiles upfiles;
  private category category;

  private String Module_Action_Add()
  {
    String tmpstr = "";
    String tdatabase = cls.getString(conf.jt.itake("config.ndatabase", "cfg"));
    String tfpre = cls.getString(conf.jt.itake("config.nfpre", "cfg"));
    String tidfield = cls.cfnames(tfpre, "id");
    String tsqlstr = "insert into " + tdatabase + " (";
    tsqlstr += cls.cfnames(tfpre, "topic") + ",";
    tsqlstr += cls.cfnames(tfpre, "class") + ",";
    tsqlstr += cls.cfnames(tfpre, "content") + ",";
    tsqlstr += cls.cfnames(tfpre, "content_images") + ",";
    tsqlstr += cls.cfnames(tfpre, "commendatory") + ",";
    tsqlstr += cls.cfnames(tfpre, "hidden") + ",";
    tsqlstr += cls.cfnames(tfpre, "time") + ",";
    tsqlstr += cls.cfnames(tfpre, "lng");
    tsqlstr += ") values (";
    tsqlstr += "'" + cls.getLeft(encode.addslashes(conf.getRequestUsParameter("topic")), 50) + "',";
    tsqlstr += cls.getNum(conf.getRequestUsParameter("class"), 0) + ",";
    tsqlstr += "'" + cls.getLeft(encode.addslashes(conf.common.repathencode(conf.getRequestUsParameter("content"))), 100000) + "',";
    tsqlstr += "'" + cls.getLeft(encode.addslashes(conf.getRequestUsParameter("content_images")), 10000) + "',";
    tsqlstr += cls.getNum(conf.getRequestUsParameter("commendatory"), 0) + ",";
    tsqlstr += cls.getNum(conf.getRequestUsParameter("hidden"), 0) + ",";
    tsqlstr += "'" + cls.getDate() + "',";
    tsqlstr += admin.slng;
    tsqlstr += ")";
    dbc tDbc = db.newInstance(conf);
    int tstateNum = tDbc.Executes(tsqlstr);
    if (tstateNum != -101)
    {
      int tTopID = conf.common.getTopID(tdatabase, tidfield);
      upfiles.UpdateDatabaseNote(conf.getNGenre(), conf.getRequestUsParameter("content_images"), "content_images", tTopID);
      tmpstr = conf.jt.itake("global.lng_common.add-succeed", "lng");
    }
    else tmpstr = conf.jt.itake("global.lng_common.add-failed", "lng");
    tmpstr = conf.ajaxPreContent + tmpstr;
    return tmpstr;
  }

  private String Module_Action_Edit()
  {
    String tmpstr = "";
    Integer tid = cls.getNum(conf.getRequestUsParameter("id"));
    String tdatabase = cls.getString(conf.jt.itake("config.ndatabase", "cfg"));
    String tfpre = cls.getString(conf.jt.itake("config.nfpre", "cfg"));
    String tidfield = cls.cfnames(tfpre, "id");
    String tsqlstr = "update " + tdatabase + " set ";
    tsqlstr += cls.cfnames(tfpre, "topic") + "='" + cls.getLeft(encode.addslashes(conf.getRequestUsParameter("topic")), 50) + "',";
    tsqlstr += cls.cfnames(tfpre, "class") + "=" + cls.getNum(conf.getRequestUsParameter("class"), 0) + ",";
    tsqlstr += cls.cfnames(tfpre, "content") + "='" + cls.getLeft(encode.addslashes(conf.common.repathencode(conf.getRequestUsParameter("content"))), 100000) + "',";
    tsqlstr += cls.cfnames(tfpre, "content_images") + "='" + cls.getLeft(encode.addslashes(conf.getRequestUsParameter("content_images")), 10000) + "',";
    tsqlstr += cls.cfnames(tfpre, "commendatory") + "=" + cls.getNum(conf.getRequestUsParameter("commendatory"), 0) + ",";
    tsqlstr += cls.cfnames(tfpre, "hidden") + "=" + cls.getNum(conf.getRequestUsParameter("hidden"), 0) + ",";
    tsqlstr += cls.cfnames(tfpre, "time") + "='" + cls.getDate(conf.getRequestUsParameter("time")) + "',";
    tsqlstr += cls.cfnames(tfpre, "count") + "=" + cls.getNum(conf.getRequestUsParameter("count"), 0) + ",";
    tsqlstr += cls.cfnames(tfpre, "lng") + "=" + admin.slng;
    tsqlstr += " where " + tidfield + "=" + tid;
    dbc tDbc = db.newInstance(conf);
    int tstateNum = tDbc.Executes(tsqlstr);
    if (tstateNum != -101)
    {
      upfiles.UpdateDatabaseNote(conf.getNGenre(), conf.getRequestUsParameter("content_images"), "content_images", tid);
      tmpstr = conf.jt.itake("global.lng_common.edit-succeed", "lng");
    }
    else tmpstr = conf.jt.itake("global.lng_common.edit-failed", "lng");
    tmpstr = conf.ajaxPreContent + tmpstr;
    return tmpstr;
  }

  private String Module_Action_Delete()
  {
    String tstate = "200";
    Integer tid = cls.getNum(conf.getRequestUsParameter("id"));
    String tdatabase = cls.getString(conf.jt.itake("config.ndatabase", "cfg"));
    String tfpre = cls.getString(conf.jt.itake("config.nfpre", "cfg"));
    String tidfield = cls.cfnames(tfpre, "id");
    Integer tstateNum = conf.common.dataDelete(tdatabase, tidfield, cls.toString(tid));
    if (tstateNum == -101) tstate = "-101";
    else upfiles.DeleteDatabaseNote(conf.getNGenre(), cls.toString(tid));
    return tstate;
  }

  private String Module_Action_Switch()
  {
    String tstate = "200";
    String tids = cls.getString(conf.getRequestUsParameter("ids"));
    String tswtype = cls.getString(conf.getRequestUsParameter("swtype"));
    String tdatabase = cls.getString(conf.jt.itake("config.ndatabase", "cfg"));
    String tfpre = cls.getString(conf.jt.itake("config.nfpre", "cfg"));
    String tidfield = cls.cfnames(tfpre, "id");
    Integer tstateNum = 0;
    if (tswtype.equals("commendatory")) tstateNum = conf.common.dataSwitch(tdatabase, cls.cfnames(tfpre, "commendatory"), tidfield, tids);
    else if (tswtype.equals("hidden")) tstateNum = conf.common.dataSwitch(tdatabase, cls.cfnames(tfpre, "hidden"), tidfield, tids);
    else if (tswtype.equals("delete")) tstateNum = conf.common.dataDelete(tdatabase, tidfield, tids);
    if (tstateNum == -101) tstate = "-101";
    else
    {
      if (tswtype.equals("delete")) upfiles.DeleteDatabaseNote(conf.getNGenre(), tids);
    }
    return tstate;
  }

  private String Module_Action_Selslng()
  {
    String tmpstr = "";
    String tlng = cls.getString(conf.getRequestUsParameter("lng"));
    if (!cls.isEmpty(tlng))
    {
      tmpstr = "200";
      cookies.setAttribute(conf, conf.getAppKey("admin-slng"), tlng);
    }
    else
    {
      tmpstr = admin.selslng();
      tmpstr = conf.ajaxPreContent + tmpstr;
    }
    return tmpstr;
  }

  private String Module_Action()
  {
    String tmpstr = "";
    String tAtype = cls.getString(conf.getRequestUsParameter("atype"));
    if (tAtype.equals("add")) tmpstr = Module_Action_Add();
    else if (tAtype.equals("edit")) tmpstr = Module_Action_Edit();
    else if (tAtype.equals("delete")) tmpstr = Module_Action_Delete();
    else if (tAtype.equals("switch")) tmpstr = Module_Action_Switch();
    else if (tAtype.equals("selslng")) tmpstr = Module_Action_Selslng();
    else if (tAtype.equals("upload")) tmpstr = upfiles.uploadFiles("file1", 0, admin.username);
    return tmpstr;
  }

  private String Module_Category()
  {
    String tmpstr = "";
    String tNGenre = conf.getNGenre();
    Integer tClass = cls.getNum(conf.getRequestUsParameter("class"), 0);
    String tMyClass = admin.getPopedomCategory(admin.popedom, tNGenre);
    String tmpSortStr = conf.common.isort("tpl=manage-interface.data_category;genre=" + tNGenre + ";lng=" + admin.slng + ";fid=" + tClass + ";valids=" + tMyClass + ";");
    if (tmpSortStr.indexOf("manages") == -1) tmpSortStr = conf.jt.itake("manage.nav_category_message-1", "lng");
    tmpstr = conf.jt.itake("manage-interface.category", "tpl");
    tmpstr = tmpstr.replace("{$-category}", tmpSortStr);
    tmpstr = conf.jt.creplace(tmpstr);
    tmpstr = conf.ajaxPreContent + tmpstr;
    return tmpstr;
  }

  private String Module_Add()
  {
    String tmpstr = "";
    String tNGenre = conf.getNGenre();
    tmpstr = conf.jt.itake("manage-interface.add", "tpl");
    tmpstr = tmpstr.replace("{$-genre}", tNGenre);
    tmpstr = tmpstr.replace("{$-lng}", cls.toString(admin.slng));
    tmpstr = tmpstr.replace("{$-myclass}", admin.getPopedomCategory(admin.popedom, tNGenre));
    tmpstr = conf.jt.creplace(tmpstr);
    tmpstr = conf.ajaxPreContent + tmpstr;
    return tmpstr;
  }

  private String Module_Edit()
  {
    String tmpstr = "";
    String tNGenre = conf.getNGenre();
    Integer tId = cls.getNum(conf.getRequestUsParameter("id"), 0);
    String tdatabase = cls.getString(conf.jt.itake("config.ndatabase", "cfg"));
    String tfpre = cls.getString(conf.jt.itake("config.nfpre", "cfg"));
    String tidfield = cls.cfnames(tfpre, "id");
    String tsqlstr = "select * from " + tdatabase + " where " + tidfield + "=" + tId;
    dbc tDbc = db.newInstance(conf);
    Object[] tArys = tDbc.getDataAry(tsqlstr);
    if (tArys != null)
    {
      Object[][] tAry = (Object[][])tArys[0];
      tmpstr = conf.jt.itake("manage-interface.edit", "tpl");
      for (int ti = 0; ti < tAry.length; ti ++)
      {
        tAry[ti][0] = (Object)cls.getLRStr((String)tAry[ti][0], tfpre, "rightr");
        tmpstr = tmpstr.replace("{$" + cls.toString(tAry[ti][0]) + "}", encode.htmlencode(cls.toString(tAry[ti][1])));
      }
      conf.rsAry = tAry;
      tmpstr = tmpstr.replace("{$-genre}", tNGenre);
      tmpstr = tmpstr.replace("{$-lng}", cls.toString(admin.slng));
      tmpstr = tmpstr.replace("{$-myclass}", admin.getPopedomCategory(admin.popedom, tNGenre));
      tmpstr = conf.jt.creplace(tmpstr);
    }
    else tmpstr = conf.jt.itake("global.lng_common.edit-404", "lng");
    tmpstr = conf.ajaxPreContent + tmpstr;
    return tmpstr;
  }

  private String Module_List()
  {
    String tmpstr = "";
    String tmpastr, tmprstr, tmptstr;
    String tNGenre = conf.getNGenre();
    Integer tpage = cls.getNum(conf.getRequestUsParameter("page"));
    Integer tnclstype = cls.getNum(conf.jt.itake("config.nclstype", "cfg"), 0);
    Integer tClass = cls.getNum(conf.getRequestUsParameter("class"), -1);
    String tClassIn = admin.getMyClassIn(tNGenre, admin.slng, tnclstype, tClass);
    String tfield = cls.getSafeString(conf.getRequestUsParameter("field"));
    String tkeyword = cls.getSafeString(conf.getRequestUsParameter("keyword"));
    tmpstr = conf.jt.itake("manage-interface.list", "tpl");
    tmprstr = "";
    tmpastr = cls.ctemplate(tmpstr, "{@}");
    String tdatabase = cls.getString(conf.jt.itake("config.ndatabase", "cfg"));
    String tfpre = cls.getString(conf.jt.itake("config.nfpre", "cfg"));
    String tsqlstr = "select * from " + tdatabase + " where " + cls.cfnames(tfpre, "lng") + "=" + admin.slng;
    if (tfield.equals("topic")) tsqlstr += " and " + cls.cfnames(tfpre, "topic") + " like '%" + tkeyword + "%'";
    if (tfield.equals("commendatory")) tsqlstr += " and " + cls.cfnames(tfpre, "commendatory") + "=" + cls.getNum(tkeyword);
    if (tfield.equals("hidden")) tsqlstr += " and " + cls.cfnames(tfpre, "hidden") + "=" + cls.getNum(tkeyword);
    if (tfield.equals("id")) tsqlstr += " and " + cls.cfnames(tfpre, "id") + "=" + cls.getNum(tkeyword);
    if (!cls.isEmpty(tClassIn)) tsqlstr += " and " + cls.cfnames(tfpre, "class") + " in (" + tClassIn + ")";
    tsqlstr += " order by " + cls.cfnames(tfpre, "time") + " desc";
    pagi pagi;
    pagi = new pagi(conf);
    pagi.sqlstr = tsqlstr;
    pagi.pagenum = tpage.longValue();
    pagi.rslimit = cls.getNum64(conf.jt.itake("config.nlisttopx", "cfg"));
    pagi.pagesize = cls.getNum64(conf.jt.itake("config.npagesize", "cfg"));
    pagi.Init();
    Object[] tArys = pagi.getDataAry();
    if (tArys != null)
    {
      for (int tis = 0; tis < tArys.length; tis ++)
      {
        tmptstr = tmpastr;
        Object[][] tAry = (Object[][])tArys[tis];
        for (int ti = 0; ti < tAry.length; ti ++)
        {
          tAry[ti][0] = (Object)cls.getLRStr((String)tAry[ti][0], tfpre, "rightr");
          tmptstr = tmptstr.replace("{$" + cls.toString(tAry[ti][0]) + "}", encode.htmlencode(cls.toString(tAry[ti][1])));
        }
        tmprstr += tmptstr;
      }
    }
    tmpstr = cls.ctemplates(tmpstr, "{@}", tmprstr);
    tmpstr = tmpstr.replace("{$-genre}", tNGenre);
    tmpstr = tmpstr.replace("{$-lng}", cls.toString(admin.slng));
    tmpstr = tmpstr.replace("{$pagi.pagenum}", cls.toString(pagi.pagenum));
    tmpstr = tmpstr.replace("{$pagi.pagenums}", cls.toString(pagi.pagenums));
    tmpstr = tmpstr.replace("{$category.FaCatHtml}", category.getFaCatHtml(conf.jt.itake("manage-interface.data_fa_category", "tpl"), tNGenre, admin.slng, tClass));
    tmpstr = conf.jt.creplace(tmpstr);
    tmpstr = conf.ajaxPreContent + tmpstr;
    return tmpstr;
  }

  public String getOutput()
  {
    PageInit();
    PageNoCache();

    String tmpstr = "";

    admin = new admin(conf);
    upfiles = new upfiles(conf);
    category = new category(conf);

    if (admin.ckLogin())
    {
      String tType = cls.getString(conf.getRequestUsParameter("type"));

      if (tType.equals("action")) tmpstr = Module_Action();
      else if (tType.equals("category")) tmpstr = Module_Category();
      else if (tType.equals("add")) tmpstr = Module_Add();
      else if (tType.equals("edit")) tmpstr = Module_Edit();
      else if (tType.equals("list")) tmpstr = Module_List();
      else if (tType.equals("upload")) tmpstr = upfiles.uploadHTML("upload-html-1");
      else tmpstr = Module_List();
    }

    PageClose();

    return tmpstr;
  }
}
%>