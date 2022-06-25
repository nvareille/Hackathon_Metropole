using System;
using System.Collections.Generic;

namespace Database
{
    public partial class Theme
    {
        public Theme()
        {
            Sousthemes = new HashSet<Soustheme>();
        }

        public int Id { get; set; }
        public string Nom { get; set; } = null!;

        public virtual ICollection<Soustheme> Sousthemes { get; set; }
    }
}
