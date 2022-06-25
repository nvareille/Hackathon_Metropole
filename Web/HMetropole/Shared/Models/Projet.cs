namespace HMetropole.Shared.Models;

public class Projet
{
    public int Id { get; set; }
    public string Name { get; set; }
    public int Entreprise { get; set; }
    public string Content { get; set; }
    public int Theme { get; set; }
    public int SousTheme { get; set; }

    public string GetMarkup()
    {
        return (string.Join("", Content.Split("\n").Select(i => $"<p>{i}</p>")));
    }
}