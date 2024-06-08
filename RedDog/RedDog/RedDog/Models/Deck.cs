using RedDog.Models;
using System;
using System.Collections.Generic;

public class Deck
{
    public List<Card> RemainingCards { get; }
    public int RemainingCount { get { return RemainingCards.Count; } }

    public Deck(int deckCount)
    {
        RemainingCards = new List<Card>();
        InitializeDeck(deckCount);
    }

    private void InitializeDeck(int deckCount)
    {
        for (int i = 0; i < deckCount; i++)
        {
            for (int j = 1; j <= 4; j++)
            {
                string folder = j == 1 ? "Clubs" : j == 2 ? "Spades" : j == 3 ? "Hearts" : "Diamonds";
                for (int value = 2; value <= 10; value++)
                {
                    string name = Convert.ToString(value);
                    string imagePath = $"RedDog.Images.{folder}.{value}.png";
                    RemainingCards.Add(new Card(name, value, imagePath));
                }

                string[] specialCards = { "Ace", "Jack", "Queen", "King" };
                foreach (string name in specialCards)
                {
                    string imagePath = $"RedDog.Images.{folder}.{name}.png";
                    int value = name == "Ace" ? 14 : name == "Jack" ? 11 : name == "Queen" ? 12 : 13;
                    RemainingCards.Add(new Card(name, value, imagePath));
                }
            }
        }
    }

    public void ShuffleCards()
    {
        Random rng = new Random();
        int n = RemainingCards.Count;
        while (n > 1)
        {
            n--;
            int k = rng.Next(n + 1);
            Card value = RemainingCards[k];
            RemainingCards[k] = RemainingCards[n];
            RemainingCards[n] = value;
        }
    }
}