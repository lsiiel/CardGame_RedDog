namespace RedDog.Models
{
    public class Player
    {
        public int ChipBalance { get; set; }

        public Player(int initialBalance)
        {
            ChipBalance = initialBalance;
        }
    }
}