using System;
using System.Collections.Generic;

namespace Database
{
    public partial class Reponse
    {
        public int Id { get; set; }
        public int Thread { get; set; }
        public int Utilisateur { get; set; }
        public string Reponse1 { get; set; } = null!;
        public bool Valide { get; set; }
        public bool MisEnAvant { get; set; }

        public virtual Thread ThreadNavigation { get; set; } = null!;
        public virtual Utilisateur UtilisateurNavigation { get; set; } = null!;
    }
}
