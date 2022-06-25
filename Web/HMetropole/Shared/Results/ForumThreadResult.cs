using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HMetropole.Shared.Models;

namespace HMetropole.Shared.Results
{
    public class ForumThreadResult
    {
        public IEnumerable<ForumThread> Threads { get; set; }
        public IEnumerable<User> Users { get; set; }

    }
}
