using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(RepslyMaps.Startup))]
namespace RepslyMaps
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
