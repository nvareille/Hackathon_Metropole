using System;
using System.Collections.Generic;

namespace Database
{
    public partial class Match
    {
        public int Id { get; set; }
        public int Entreprise1 { get; set; }
        public int Entreprise2 { get; set; }
        public bool Accepte { get; set; }
        public bool Utileent1 { get; set; }
        public bool Utileent2 { get; set; }
        public string Pourquoient1 { get; set; } = null!;
        public string Pourquoient2 { get; set; } = null!;

        public virtual Entreprise Entreprise1Navigation { get; set; } = null!;
        public virtual Entreprise Entreprise2Navigation { get; set; } = null!;
    }
}
