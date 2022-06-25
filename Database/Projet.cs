using System;
using System.Collections.Generic;

namespace Database
{
    public partial class Projet
    {
        public int Id { get; set; }
        public string Nom { get; set; } = null!;
        public string Description { get; set; } = null!;
        public int Entreprise { get; set; }
        public bool Valide { get; set; }

        public virtual Entreprise EntrepriseNavigation { get; set; } = null!;
    }
}
