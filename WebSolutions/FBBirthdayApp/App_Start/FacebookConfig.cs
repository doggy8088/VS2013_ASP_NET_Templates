using System;
using System.Web.Mvc;
using Microsoft.AspNet.Mvc.Facebook;
using Microsoft.AspNet.Mvc.Facebook.Authorization;

namespace FBBirthdayApp
{
    public static class FacebookConfig
    {
        public static void Register(FacebookConfiguration configuration)
        {
            // 使用下列應用程式設定索引鍵，從 web.config 載入設定:
            // Facebook:AppId, Facebook:AppSecret, Facebook:AppNamespace
            configuration.LoadFromAppSettings();

            // 新增授權篩選以檢查 Facebook 簽署的要求和權限
            GlobalFilters.Filters.Add(new FacebookAuthorizeFilter(configuration));
        }
    }
}
