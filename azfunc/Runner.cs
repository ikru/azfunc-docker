using System;
using System.IO;
using System.Linq;
using System.Security;
using Microsoft.Extensions.Logging;
using Microsoft.SharePoint.Client;
using PnP.Framework;

namespace AzureFunction
{
    public static class Runner
    {
        public static void Run(ILogger log) {
            log.LogInformation("Starting...");
            var site = "Get from config";
            
            // For how to configure appId, appSecret see README.md section: # Configuring an application Client Id and Client Key
            var appId = "Get from config";
            var appSecret = "Get from config";
            
            using (var authenticationManager = new AuthenticationManager())
            using (var context = authenticationManager.GetACSAppOnlyContext(site, appId, appSecret))
            {
                Web web = context.Web;
                context.Load(web, w => w.Title);
                context.ExecuteQuery();
                log.LogInformation("Loaded site: " + web.Title);
            }

            // This would work under user account
            // var user = "user@qwe.onmicrosoft.com";
            // var password = new SecureString();
            // "password".ToList().ForEach(c => password.AppendChar(c));
            
            //using (var authenticationManager = new AuthenticationManager(user, password))
            //using (var context = authenticationManager.GetContext(site))
            // {
            //     Web web = context.Web;
            //     context.Load(web, w => w.Title);
            //     context.ExecuteQuery();
            //     log.LogInformation("Loaded site: " + web.Title);
            // }
        }
    }
}