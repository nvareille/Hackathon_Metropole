using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HMetropole.Shared.Models;

namespace HMetropole.Shared.Results
{
    public class ProjetResult
    {
        public IEnumerable<Projet> Projets { get; set; }
        public IEnumerable<Entreprise> Entreprises { get; set; }
    }
}
