using System.Collections.Generic;

namespace RedDog.Models
{
    public class Game
    {
        public Player Player { get; set; }
        public Dealer Dealer { get; set; }
        public Deck Deck { get; set; }
        public List<Deck> Decks { get; set; }

        public int CurrentBet { get; set; }

        public Game()
        {
            Player = new Player(1000);
            Decks = new List<Deck>();
            for (int i = 0; i < 6; i++)
            {
                Decks.Add(new Deck(1));
            }
            CurrentBet = 0;
            Decks[0].ShuffleCards();
            Dealer = new Dealer(Decks);
        }

        public void DoubleBet()
        {
            Player.ChipBalance -= CurrentBet;
            CurrentBet *= 2;
        }

        public int PayOut()
        {
            int pay = Dealer.CalculatePayout(CurrentBet);
            if (pay != 0)
            {
                Player.ChipBalance += pay;
                return pay;
            } else
            {
                return 0;
            }
        }
    }
}