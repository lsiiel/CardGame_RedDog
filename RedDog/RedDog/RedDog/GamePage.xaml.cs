using System;
using RedDog.Models;
using Xamarin.Forms;

namespace RedDog
{
    public partial class GamePage : ContentPage
    {
        private Game gameInstance;
        public GamePage(Game game)
        {
            InitializeComponent();
            gameInstance = game;
        }

        private bool CheckBet(string bet)
        {
            if (int.TryParse(bet, out int intBet))
            {
                if (intBet >= 1 && intBet <= 100)
                {
                    if (intBet <= gameInstance.Player.ChipBalance)
                    {
                        return true;
                    }
                    else
                    {
                        DisplayAlert("Ошибка", "Недостаточно средств для совершения ставки.", "OK");
                        return false;
                    }
                }
                else
                {
                    DisplayAlert("Ошибка", "Пожалуйста, введите число от 1 до 100.", "OK");
                    return false;
                }
            }
            else
            {
                DisplayAlert("Ошибка", "Пожалуйста, введите корректное число для ставки.", "OK");
                return false;
            }
        }

        private void OnBetClicked(object sender, EventArgs e)
        {
            betEntry.IsVisible = false;
            betButton.IsVisible = false;
            frame.IsVisible = false;
            if (CheckBet(betEntry.Text))
            {
                int.TryParse(betEntry.Text, out int bet);
                betEntry.Text = string.Empty;
                gameInstance.Dealer.DealCards(2);
                if (gameInstance.Dealer.Gap == null)
                {
                    var noDecks = new Label
                    {
                        Text = $"Все колоды закончились. Игра завершена.",
                        HorizontalOptions = LayoutOptions.Center,
                        VerticalOptions = LayoutOptions.Center,
                        FontSize = 18
                    };
                    controlsGrid.Children.Add(noDecks);
                    return;
                }
                if (gameInstance.Dealer.Gap != 0 && gameInstance.Dealer.Gap != -1)
                {
                    gameInstance.CurrentBet = bet;
                    gameInstance.Player.ChipBalance -= bet;
                    currentBetLabel.Text = $"Текущая ставка: {bet}";
                    balanceLabel.Text = $"Баланс: {gameInstance.Player.ChipBalance}";
                }
                DisplayDealtCards(2);
            }
        }

        private void DisplayButtons()
        {
            if (gameInstance.Dealer.Gap != 0 && gameInstance.Dealer.Gap != -1)
            {
                var gapLabel = new Label
                {
                    Text = $"Промежуток - {gameInstance.Dealer.Gap}",
                    HorizontalOptions = LayoutOptions.Center,
                    VerticalOptions = LayoutOptions.Center,
                    FontAttributes = FontAttributes.Bold,
                    FontSize = 18
                };

                Grid.SetRow(gapLabel, 0);
                Grid.SetColumn(gapLabel, 0);
                controlsGrid.Children.Add(gapLabel);

                var doubleBetButton = new Button
                {
                    Text = "Удвоить ставку",
                    HorizontalOptions = LayoutOptions.Center,
                    VerticalOptions = LayoutOptions.Center,
                    BackgroundColor = Color.Green,
                    TextColor = Color.White,
                    FontAttributes = FontAttributes.Bold,
                    BorderRadius = 5,
                    HeightRequest = 35,
                    WidthRequest = 200
                };
                doubleBetButton.Clicked += OnDoubleBetClicked;

                var refuseButton = new Button
                {
                    Text = "Отказаться",
                    HorizontalOptions = LayoutOptions.Center,
                    VerticalOptions = LayoutOptions.Center,
                    BackgroundColor = Color.Red,
                    TextColor = Color.White,
                    FontAttributes = FontAttributes.Bold,
                    BorderRadius = 5,
                    HeightRequest = 35,
                    WidthRequest = 200

                };
                refuseButton.Clicked += OnRefuseDoubleClicked;

                Grid.SetRow(doubleBetButton, 1);
                Grid.SetColumn(doubleBetButton, 0);
                controlsGrid.Children.Add(doubleBetButton);

                Grid.SetRow(refuseButton, 2);
                Grid.SetColumn(refuseButton, 0);
                controlsGrid.Children.Add(refuseButton);
            }
        }

        private void DisplayDealtCards(int countCardToDisplay)
        {
            int startIndex;
            if (countCardToDisplay == 2)
            {
                dealtCardsGrid.Children.Clear();
                dealtCardsGrid.ColumnDefinitions.Clear();
                controlsGrid.Children.Clear();
                startIndex = 0;
                DisplayButtons();
            }
            else
            {
                startIndex = 2;
            }

            for (int i = startIndex; i < gameInstance.Dealer.Cards.Count; i++)
            {
                dealtCardsGrid.ColumnDefinitions.Add(new ColumnDefinition { Width = new GridLength(1, GridUnitType.Auto) });

                var image = new Image
                {
                    HeightRequest = 260,
                    WidthRequest = 184,
                    Source = ImageSource.FromResource(gameInstance.Dealer.Cards[i].ImagePath)
                };
                Grid.SetRow(image, 0);

                if (startIndex == 0)
                {
                    var imageThird = new Image
                    {
                        HeightRequest = 260,
                        WidthRequest = 184,
                        Source = ImageSource.FromResource("RedDog.Images.back.png")
                    };
                    Grid.SetRow(imageThird, 0);
                    Grid.SetColumn(imageThird, 1);
                    dealtCardsGrid.Children.Add(imageThird);

                    if (i == 0)
                    {
                        Grid.SetColumn(image, 0);
                    }
                    else
                    {
                        Grid.SetColumn(image, 2);
                    }
                }
                else
                {
                    Grid.SetColumn(image, 1);
                }
                dealtCardsGrid.Children.Add(image);
            }

            if (gameInstance.Dealer.Gap == -1)
            {
                CalculateResult();
            }
            else if (gameInstance.Dealer.Gap == 0)
            {
                CalculateResult();
            }
        }

        private void OnDoubleBetClicked(object sender, EventArgs e)
        {
            currentBetLabel.Text = $"Текущая ставка: 0";
            gameInstance.DoubleBet();
            balanceLabel.Text = $"Баланс: {gameInstance.Player.ChipBalance}";

            gameInstance.Dealer.DealCards(1);
            DisplayDealtCards(1);
            CalculateResult();
        }

        private void OnRefuseDoubleClicked(object sender, EventArgs e)
        {
            currentBetLabel.Text = $"Текущая ставка: 0";
            balanceLabel.Text = $"Баланс: {gameInstance.Player.ChipBalance}";
            gameInstance.Dealer.DealCards(1);
            DisplayDealtCards(1);
            CalculateResult();
        }

        private void CalculateResult()
        {
            controlsGrid.Children.Clear();
            var resultGame = new Label
            {
                HorizontalOptions = LayoutOptions.Center,
                VerticalOptions = LayoutOptions.Center,
                FontAttributes = FontAttributes.Bold,
                FontSize = 18
            };

            if (gameInstance.Dealer.Gap == 0)
            {
                resultGame.Text = "Промежутка нет, вам возвращена сумма ставки.";
            }
            else
            {
                if (gameInstance.Dealer.Gap == -1)
                {
                    gameInstance.Dealer.DealCards(1);
                    gameInstance.Dealer.Gap = -100;
                    DisplayDealtCards(1);
                }
                string resultRound;
                int pay = gameInstance.PayOut();
                if (pay != 0)
                {
                    resultRound = $"Вы выиграли {pay} фишек";
                    
                    balanceLabel.Text = $"Баланс: {gameInstance.Player.ChipBalance}";
                    resultGame.Text = resultRound;
                    resultGame.TextColor = Color.DarkGreen;
                }
                else
                {
                    resultRound = $"Вы проиграли {gameInstance.CurrentBet} фишек. Повезет в следующий раз!";
                    resultGame.Text = resultRound;
                    resultGame.TextColor = Color.DarkRed;
                }
                
            }
            betEntry.IsVisible = true;
            betButton.IsVisible = true;
            frame.IsVisible = true;
            controlsGrid.Children.Add(resultGame);
            controlsGrid.Children.Add(new Label {HorizontalOptions = LayoutOptions.Center,VerticalOptions = LayoutOptions.Center});
            controlsGrid.Children.Add(new Label { HorizontalOptions = LayoutOptions.Center, VerticalOptions = LayoutOptions.Center });
            controlsGrid.Children.Add(new Label { HorizontalOptions = LayoutOptions.Center, VerticalOptions = LayoutOptions.Center });
            gameInstance.Dealer.Cards.Clear();
            gameInstance.CurrentBet = 0;
            gameInstance.Dealer.Gap = null;
        }
    }
}