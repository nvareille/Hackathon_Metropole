using System;
using System.Collections.Generic;

namespace Database
{
    public partial class Fonction
    {
        public Fonction()
        {
            Utilisateurs = new HashSet<Utilisateur>();
        }

        public int Id { get; set; }
        public string Nom { get; set; } = null!;

        public virtual ICollection<Utilisateur> Utilisateurs { get; set; }
    }
}
