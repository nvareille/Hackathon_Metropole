using API.Siret;
using Database;
using HMetropole.Shared.Payloads;
using Microsoft.AspNetCore.Mvc;

namespace Hackathon_Metropole.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        private Wrapper Wrapper;
        private hackathonContext Context;

        public AuthenticationController(Wrapper wrapper, hackathonContext context)
        {
            Wrapper = wrapper;
            Context = context;
        }

        [HttpPost]
        public async Task Post([FromForm]InscriptionPayload payload)
        {
            var found = await Wrapper.GetEntreprise(payload.Siret);

            Entreprise e = new Entreprise
            {
                Activité = found.Activite.Intitule,
                Adresse = found.AdresseEtablissement.GetAdresse(),
                Nom = found.GetName(),
                Siret = payload.Siret,
                Cp = found.AdresseEtablissement.CodePostalEtablissement,
                Bio = "",
                Logo = "",
                Taille = "",
                Type = "",
                Ville = found.AdresseEtablissement.LibelleCommuneEtablissement
            };

            Context.Entreprises.Add(e);
            Context.SaveChanges();
        }
    }
}
