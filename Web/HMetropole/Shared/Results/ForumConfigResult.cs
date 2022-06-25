using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HMetropole.Shared.Models;

namespace HMetropole.Shared.Results
{
    public class ForumConfigResult
    {
        public IEnumerable<Theme> Themes { get; set; }
    }
}
