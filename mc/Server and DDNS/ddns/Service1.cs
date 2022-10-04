using System;
using System.Diagnostics;
using System.Net.Http;
using System.ServiceProcess;
using System.Timers;

namespace ddns
{
    public partial class Service1 : ServiceBase
    {

        private int _mainTaskInterval;
        private string[] Args = new string[0];

        private Timer ddnsTimer;

        public Service1(int mainTaskInterval = 5 * 60 * 1000) : base()
        {
            InitializeComponent();

            // set time interval
            _mainTaskInterval = mainTaskInterval;
        }

        // Methods
        protected override void OnStart(string[] args)
        {
            // set interval by service parameters
            if (args != null && args.Length > 0)
            {
                Args = args;
            }
            
            // Setup timer
            ddnsTimer = new Timer();
            ddnsTimer.Interval = _mainTaskInterval;
            ddnsTimer.Elapsed += new ElapsedEventHandler(OnTimer);
            ddnsTimer.Start();
            try
            {
                // avoid error to stop serivce
                MainTask();
            }
            catch (Exception) { }
        }

        protected override void OnStop()
        {
            ddnsTimer.Stop();
            Process.Start("sc.exe", "delete DDNS");
        }

        protected void OnTimer(object sender, ElapsedEventArgs args)
        {
            try
            {
                // avoid error to stop serivce
                MainTask();
            }
            catch (Exception) { }
        }

        protected virtual void MainTask()
        {
            foreach(string arg in Args)
            {
                HttpClient client = new HttpClient();
                client.GetAsync(arg);
            }
        }
    }
}