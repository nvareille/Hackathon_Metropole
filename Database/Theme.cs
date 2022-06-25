using System;
using System.Collections.Generic;

namespace Database
{
    public partial class Theme
    {
        public Theme()
        {
            Prestataires = new HashSet<Prestataire>();
            Sousthemes = new HashSet<Soustheme>();
        }

        public int Id { get; set; }
        public string Nom { get; set; } = null!;

        public virtual ICollection<Prestataire> Prestataires { get; set; }
        public virtual ICollection<Soustheme> Sousthemes { get; set; }
    }
}
