using System.Collections.Generic;
using System.Linq;

namespace RedDog.Models
{
    public class Dealer
    {
        public List<Card> Cards { get; set; }
        public List<Deck> Decks { get; set; }
        private Deck currentDeck;
        public int? Gap { get; set; }

        public Dealer(List<Deck> decks)
        {
            Decks = decks;
            Cards = new List<Card>();
            currentDeck = decks.FirstOrDefault();
        }

        public void DealCards(int count)
        {
            if (count > 0)
            {
                for (int i = 0; i < count; i++)
                {
                    if (currentDeck.RemainingCount == 0)
                    {
                        CheckAndReplaceDeck(count);
                    }

                    if (currentDeck.RemainingCount > 0)
                    {
                        Card dealtCard = currentDeck.RemainingCards[0];
                        Cards.Add(dealtCard);
                        currentDeck.RemainingCards.RemoveAt(0);
                    }
                    else
                    {
                        break;
                    }
                }
                if (count == 2)
                {
                    Cards = Cards.OrderBy(card => card.Value).ToList();
                    Gap = CalculateGap(Cards[0], Cards[1]);
                }
            }
            else
            {
                Gap = null;
            }
        }

        private void CheckAndReplaceDeck(int count)
        {
            Decks.Remove(currentDeck);

            if (Decks.Any())
            {
                currentDeck = Decks.First();
                currentDeck.ShuffleCards();
                DealCards(count);
            }
            else
            {
                DealCards(0);
            }
        }

        public int? CalculateGap(Card card1, Card card2)
        {
            Gap = card2.Value - card1.Value - 1;
            return Gap;
        }

        public int CalculatePayout(int bet)
        {
            if (Cards[0].Value == Cards[1].Value && (Cards[2].Value == Cards[0].Value || Cards[2].Value == Cards[1].Value))
            {
                return bet * 11;
            }
            else if (Cards[2].Value > Cards[0].Value && Cards[2].Value < Cards[1].Value)
            {
                if (Gap == 1)
                {
                    return bet * 5;
                }
                else if (Gap == 2)
                {
                    return bet * 4;
                }
                else if (Gap == 3)
                {
                    return bet * 2;
                }
                else if (Gap >= 4)
                {
                    return bet * 2;
                }
            }
            return 0;
        }
    }
}