using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HMetropole.Shared.Models
{
    public class ForumThread
    {
        public int Id { get; set; }
        public string Question { get; set; }
        public int User { get; set; }
        public IEnumerable<ThreadResponse> Responses { get; set; }

        public string GetMarkup()
        {
            return (string.Join("", Question.Split("\n").Select(i => $"<p>{i}</p>")));
        }
    }
}
