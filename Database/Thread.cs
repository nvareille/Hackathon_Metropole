using System;
using System.Collections.Generic;

namespace Database
{
    public partial class Thread
    {
        public Thread()
        {
            Reponses = new HashSet<Reponse>();
        }

        public int Id { get; set; }
        public int Soustheme { get; set; }
        public int Utilisateur { get; set; }
        public string Question { get; set; } = null!;
        public bool Clos { get; set; }

        public virtual Soustheme SousthemeNavigation { get; set; } = null!;
        public virtual Utilisateur UtilisateurNavigation { get; set; } = null!;
        public virtual ICollection<Reponse> Reponses { get; set; }
    }
}
