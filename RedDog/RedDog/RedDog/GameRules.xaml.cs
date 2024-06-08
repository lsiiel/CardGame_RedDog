using System;
using System.Collections.Generic;

using Xamarin.Forms;

namespace RedDog
{	
	public partial class GameRules : ContentPage
	{	
		public GameRules ()
		{
			InitializeComponent ();
		}

		private async void OnStartPageClicked(object sender, EventArgs e)
		{
            await Navigation.PopAsync();
        }

    }
}

