using Microsoft.AspNet.Mvc.Facebook;
using Newtonsoft.Json;

// 新增任何想要為每位使用者儲存的欄位，並在從 Facebook 傳回的 JSON 中指定欄位名稱
// http://go.microsoft.com/fwlink/?LinkId=301877

namespace FBBirthdayApp.Models
{
    public class MyAppUser
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }

        [JsonProperty("picture")] // 這會將屬性重新命名為 picture。
        [FacebookFieldModifier("type(large)")] // 這會將圖片大小設為 large。
        public FacebookConnection<FacebookPicture> ProfilePicture { get; set; }

        [FacebookFieldModifier("limit(8)")] // 這會將好友清單的大小設為 8，請移除它以取得所有好友。
        public FacebookGroupConnection<MyAppUserFriend> Friends { get; set; }

        [FacebookFieldModifier("limit(16)")] // 這會將相片清單的大小設為 16，請移除它以取得所有相片。
        public FacebookGroupConnection<FacebookPhoto> Photos { get; set; }
    }
}
