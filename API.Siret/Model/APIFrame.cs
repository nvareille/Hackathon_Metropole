using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace API.Siret.Model
{
    public class APIFrame
    {
        [JsonProperty("etablissement")]
        public Etablissement Etablissement = null!;
    }
}
