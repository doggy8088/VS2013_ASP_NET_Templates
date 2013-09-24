using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MVCWebForm.Startup))]
namespace MVCWebForm
{
    public partial class Startup 
    {
        public void Configuration(IAppBuilder app) 
        {
            ConfigureAuth(app);
        }
    }
}
