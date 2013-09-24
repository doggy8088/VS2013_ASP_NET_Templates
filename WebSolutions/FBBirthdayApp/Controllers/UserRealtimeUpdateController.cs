using System;
using System.Configuration;
using System.Threading.Tasks;
using Microsoft.AspNet.Mvc.Facebook.Models;
using Microsoft.AspNet.Mvc.Facebook.Realtime;

// 若要深入瞭解 Facebook Realtime Updates，請移至 http://go.microsoft.com/fwlink/?LinkId=301876

namespace FBBirthdayApp.Controllers
{
    public class UserRealtimeUpdateController : FacebookRealtimeUpdateController
    {
        private readonly static string UserVerifyToken = ConfigurationManager.AppSettings["Facebook:VerifyToken:User"];

        public override string VerifyToken
        {
            get
            {
                return UserVerifyToken;
            }
        }

        public override Task HandleUpdateAsync(ChangeNotification notification)
        {
            if (notification.Object == "user")
            {
                foreach (var entry in notification.Entry)
                {
                    // 這裡是您處理更新的邏輯
                }
            }

            throw new NotImplementedException();
        }
    }
}
