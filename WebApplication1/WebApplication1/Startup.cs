using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TicketSupportTracker.UI.MVC.Startup))]
namespace TicketSupportTracker.UI.MVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
