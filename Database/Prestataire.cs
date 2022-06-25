using System;
using System.Collections.Generic;

namespace Database
{
    public partial class Prestataire
    {
        public Prestataire()
        {
            Projets = new HashSet<Projet>();
        }

        public int Id { get; set; }
        public string Nom { get; set; } = null!;
        public int Theme { get; set; }
        public string Bio { get; set; } = null!;

        public virtual Theme ThemeNavigation { get; set; } = null!;
        public virtual ICollection<Projet> Projets { get; set; }
    }
}
