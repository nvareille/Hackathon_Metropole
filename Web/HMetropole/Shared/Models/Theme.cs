using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HMetropole.Shared.Models
{
    public class Theme
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public IEnumerable<SubTheme> SubThemes { get; set; }
    }
}
