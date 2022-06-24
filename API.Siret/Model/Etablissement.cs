using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace API.Siret.Model
{
    public class Etablissement
    {
        [JsonProperty("uniteLegale")]
        public UniteLegale UniteLegale { get; set; } = null!;

        public AdresseEtablissement AdresseEtablissement { get; set; } = null!;

        public string GetName()
        {
            return (UniteLegale.GetName());
        }
    }
}
