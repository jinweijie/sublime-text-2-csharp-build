using System;
using System.IO;

using log4net;
using log4net.Core;
using MyLib;
using MyLib2;

[assembly: log4net.Config.XmlConfigurator( ConfigFile = "Log4Net.config", Watch = true )]

namespace Hello
{
    /// <summary>
    ///   MyClass
    /// </summary>
    public class MyClass
    {
        private static readonly log4net.ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);
        
        /// <summary>
        ///   The main entry point for the application
        /// </summary>
        [STAThread]
        public static void Main(string[] args)
        {
            log.Info("Application [ConsoleApp] Start");
            
            Console.WriteLine(Common.GetMessage());
            Console.WriteLine(MyHelper.GetMessage());
            Console.WriteLine(MyHelper2.GetMessage());

            log.Info("Application [ConsoleApp] End");
        }
    }
}
