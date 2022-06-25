using System;
using System.Collections.Generic;

namespace Database
{
    public partial class Ressource
    {
        public int Id { get; set; }
        public string Nom { get; set; } = null!;
        public string Url { get; set; } = null!;
        public int Soustheme { get; set; }

        public virtual Soustheme SousthemeNavigation { get; set; } = null!;
    }
}
