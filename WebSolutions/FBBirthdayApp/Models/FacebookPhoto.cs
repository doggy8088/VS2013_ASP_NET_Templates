using Newtonsoft.Json;

namespace FBBirthdayApp.Models
{
    public class FacebookPhoto
    {
        [JsonProperty("picture")] // 這會將屬性重新命名為 picture。
        public string ThumbnailUrl { get; set; }

        public string Link { get; set; }
    }
}
