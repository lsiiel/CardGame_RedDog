using System;
using RedDog.Models;
using Xamarin.Forms;

namespace RedDog
{	
	public partial class StartPage : ContentPage
	{
        public StartPage ()
		{
            InitializeComponent ();
		}

        private async void OnStartGameClicked(object sender, EventArgs e)
        {
            Game game = new Game();
            await Navigation.PushAsync(new GamePage(game));
        }

        private void OnExitGameClicked(object sender, EventArgs e)
        {
            System.Diagnostics.Process.GetCurrentProcess().CloseMainWindow();
        }

        private async void OnGameRulesClicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new GameRules());
        }
    }
}