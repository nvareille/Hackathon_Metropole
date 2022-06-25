using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace API.Siret.Model
{
    public class UniteLegale
    {
        [JsonProperty("denominationUniteLegale")]
        public string? Name { get; set; }

        public string? NomUniteLegale { get; set; }
        public string? Prenom1UniteLegale { get; set; }
        public string? Prenom2UniteLegale { get; set; }
        public string? Prenom3UniteLegale { get; set; }
        public string? ActivitePrincipaleUniteLegale { get; set; }

        public string GetName()
        {
            return (Name ?? $"{NomUniteLegale} {string.Join(' ', Prenom1UniteLegale, Prenom2UniteLegale, Prenom3UniteLegale)}");
        }

        public string GetCode()
        {
            return (ActivitePrincipaleUniteLegale?.Replace("Z", "") ?? throw new Exception());
        }
    }
}
