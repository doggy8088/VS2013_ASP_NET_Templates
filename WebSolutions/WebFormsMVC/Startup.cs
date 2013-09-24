using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebFormsMVC.Startup))]
namespace WebFormsMVC
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
