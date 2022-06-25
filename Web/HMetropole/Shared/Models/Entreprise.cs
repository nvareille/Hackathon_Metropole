namespace HMetropole.Shared.Results;

public class Entreprise
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string Type { get; set; } = null!;
    public string Siret { get; set; } = null!;
    public string Nom { get; set; } = null!;
    public string Adresse { get; set; } = null!;
    public string Cp { get; set; } = null!;
    public string Ville { get; set; } = null!;
    public string Taille { get; set; } = null!;
    public string Activité { get; set; } = null!;
    public string Bio { get; set; } = null!;
    public string Logo { get; set; } = null!;

    public string GetMarkup()
    {
        return (string.Join("", Bio.Split("\n").Select(i => $"<p>{i}</p>")));
    }
}