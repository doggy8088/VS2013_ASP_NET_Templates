using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Routing;

namespace EmptyWebAPI
{
    // 附註: 如需啟用 IIS7 傳統模式的指示， 
    // 請瀏覽 http://go.microsoft.com/fwlink/?LinkId=301868
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            WebApiConfig.Register(GlobalConfiguration.Configuration);           
        }
    }
}
