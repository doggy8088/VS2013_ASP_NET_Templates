using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Mvc;
using Microsoft.AspNet.Mvc.Facebook;
using Microsoft.AspNet.Mvc.Facebook.Client;
using FBBirthdayApp.Models;

namespace FBBirthdayApp.Controllers
{
    public class HomeController : Controller
    {
        [FacebookAuthorize("email", "user_photos")]
        public async Task<ActionResult> Index(FacebookContext context)
        {
            if (ModelState.IsValid)
            {
                var user = await context.Client.GetCurrentUserAsync<MyAppUser>();
                return View(user);
            }

            return View("Error");
        }

        // 此動作將在下列情況時處理來自 FacebookAuthorizeFilter 的重新導向: 
        // 應用程式沒有 FacebookAuthorizeAttribute 中指定的所有必要權限。
        // 此動作的路徑定義在 Web.config 的 appSettings 下，機碼為 'Facebook:AuthorizationRedirectPath'。
        public ActionResult Permissions(FacebookRedirectContext context)
        {
            if (ModelState.IsValid)
            {
                return View(context);
            }

            return View("Error");
        }
    }
}
