using System;
using System.Collections.Generic;

namespace Database
{
    public partial class Projet
    {
        public int Id { get; set; }
        public string Nom { get; set; } = null!;
        public string Description { get; set; } = null!;
        public int Soustheme { get; set; }
        public int Entreprise { get; set; }
        public int Prestataire { get; set; }
        public bool Valide { get; set; }

        public virtual Entreprise EntrepriseNavigation { get; set; } = null!;
        public virtual Prestataire PrestataireNavigation { get; set; } = null!;
        public virtual Soustheme SousthemeNavigation { get; set; } = null!;
    }
}
