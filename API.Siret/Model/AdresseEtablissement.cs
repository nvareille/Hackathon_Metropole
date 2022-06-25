using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace API.Siret.Model
{
    public class AdresseEtablissement
    {
        public int? NumeroVoieEtablissement { get; set; }
        public string? TypeVoieEtablissement { get; set; } 
        public string? LibelleVoieEtablissement { get; set; }
        public string? CodePostalEtablissement { get; set; }
        public string? LibelleCommuneEtablissement { get; set; }

        public string GetAdresse()
        {
            return ($"{NumeroVoieEtablissement} {TypeVoieEtablissement} {LibelleVoieEtablissement} {CodePostalEtablissement} {LibelleCommuneEtablissement}");
        }
    }
}
