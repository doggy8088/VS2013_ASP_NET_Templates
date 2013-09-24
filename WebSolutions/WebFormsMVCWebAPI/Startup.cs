using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebFormsMVCWebAPI.Startup))]
namespace WebFormsMVCWebAPI
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
