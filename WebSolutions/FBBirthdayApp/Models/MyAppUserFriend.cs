using Microsoft.AspNet.Mvc.Facebook;

// 新增任何想要為每位使用者儲存的欄位，並在從 Facebook 傳回的 JSON 中指定欄位名稱
// http://go.microsoft.com/fwlink/?LinkId=301877

namespace FBBirthdayApp.Models
{
    public class MyAppUserFriend
    {
        public string Name { get; set; }
        public string Link { get; set; }

        [FacebookFieldModifier("height(100).width(100)")] // 這會將圖片高度和寬度設為 100px。
        public FacebookConnection<FacebookPicture> Picture { get; set; }
    }
}
