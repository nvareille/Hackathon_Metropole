using System;
using System.Collections.Generic;

namespace Database
{
    public partial class Entreprise
    {
        public Entreprise()
        {
            MatchEntreprise1Navigations = new HashSet<Match>();
            MatchEntreprise2Navigations = new HashSet<Match>();
            Projets = new HashSet<Projet>();
            Utilisateurs = new HashSet<Utilisateur>();
        }

        public int Id { get; set; }
        public string Type { get; set; } = null!;
        public string Siret { get; set; } = null!;
        public string Nom { get; set; } = null!;
        public string Adresse { get; set; } = null!;
        public string Cp { get; set; } = null!;
        public string Ville { get; set; } = null!;
        public string Taille { get; set; } = null!;
        public string Activité { get; set; } = null!;
        public string Bio { get; set; } = null!;
        public byte[] Logo { get; set; } = null!;

        public virtual ICollection<Match> MatchEntreprise1Navigations { get; set; }
        public virtual ICollection<Match> MatchEntreprise2Navigations { get; set; }
        public virtual ICollection<Projet> Projets { get; set; }
        public virtual ICollection<Utilisateur> Utilisateurs { get; set; }
    }
}
