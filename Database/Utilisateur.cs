using System;
using System.Collections.Generic;

namespace Database
{
    public partial class Utilisateur
    {
        public Utilisateur()
        {
            Reponses = new HashSet<Reponse>();
            Threads = new HashSet<Thread>();
        }

        public int Id { get; set; }
        public string Pseudo { get; set; } = null!;
        public string Nom { get; set; } = null!;
        public string Prenom { get; set; } = null!;
        public int Fonction { get; set; }
        public bool ContactEmail { get; set; }
        public string AdresseEmail { get; set; } = null!;
        public bool ContactTel { get; set; }
        public string NumeroTel { get; set; } = null!;
        public bool Visites { get; set; }
        public bool Temoignage { get; set; }
        public int Entreprise { get; set; }

        public virtual Entreprise EntrepriseNavigation { get; set; } = null!;
        public virtual Fonction FonctionNavigation { get; set; } = null!;
        public virtual ICollection<Reponse> Reponses { get; set; }
        public virtual ICollection<Thread> Threads { get; set; }
    }
}
