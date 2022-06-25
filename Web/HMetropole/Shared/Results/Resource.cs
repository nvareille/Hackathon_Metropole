using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HMetropole.Shared.Models;

namespace HMetropole.Shared.Results
{
    public class Resource
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string URL { get; set; }
        public int SousTheme { get; set; }
    }
}
