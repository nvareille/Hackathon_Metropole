using System;
using System.Collections.Generic;

namespace Database
{
    public partial class Soustheme
    {
        public Soustheme()
        {
            Threads = new HashSet<Thread>();
        }

        public int Id { get; set; }
        public string Nom { get; set; } = null!;
        public int Theme { get; set; }

        public virtual Theme ThemeNavigation { get; set; } = null!;
        public virtual ICollection<Thread> Threads { get; set; }
    }
}
