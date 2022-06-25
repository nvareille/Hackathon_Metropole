using System;
using System.Collections.Generic;

namespace Database
{
    public partial class Reponse
    {
        public int Id { get; set; }
        public int Thread { get; set; }
        public string Utilisateur { get; set; } = null!;
        public string Reponse1 { get; set; } = null!;
        public bool Valide { get; set; }
        public bool MisEnAvant { get; set; }

        public virtual Thread ThreadNavigation { get; set; } = null!;
        public virtual Utilisateur UtilisateurNavigation { get; set; } = null!;
    }
}
