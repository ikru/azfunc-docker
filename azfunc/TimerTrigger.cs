using System;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Host;
using Microsoft.Extensions.Logging;

namespace AzureFunction
{
    public static class TimerTrigger
    {
        [FunctionName("TimerTrigger")]
        public static void Run([TimerTrigger("0 */5 * * * *")]TimerInfo myTimer, ILogger log)
        {
            Runner.Run(log);
            log.LogInformation($"C# Timer trigger function executed at: {DateTime.Now}");
        }
    }
}
