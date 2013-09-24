using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MvcWebAPI.Startup))]
namespace MvcWebAPI
{
    public partial class Startup 
    {
        public void Configuration(IAppBuilder app) 
        {
            ConfigureAuth(app);
        }
    }
}
