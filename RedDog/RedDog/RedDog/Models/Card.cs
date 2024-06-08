namespace RedDog.Models
{
    public class Card
    {
        public string Name { get; }
        public int Value { get; }
        public string ImagePath { get; }

        public Card(string name, int value, string imagePath)
        {
            Name = name;
            Value = value;
            ImagePath = imagePath;
        }
    }
}