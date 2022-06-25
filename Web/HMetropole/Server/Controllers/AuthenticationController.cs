using API.Siret;
using Database;
using HMetropole.Shared.Payloads;
using HMetropole.Shared.Results;
using Microsoft.AspNetCore.Mvc;
using Entreprise = Database.Entreprise;

namespace HMetropole.Server.Controllers
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
        public async Task Post([FromBody]InscriptionPayload payload)
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

            Utilisateur u = new Utilisateur
            {
                Pseudo = payload.Username,
                AdresseEmail = "",
                Nom = "",
                Prenom = "",
                NumeroTel = "",
                Entreprise = e.Id,
                Fonction = Context.Fonctions.First().Id
            };

            Context.Utilisateurs.Add(u);
            Context.SaveChanges();
        }

        [HttpGet("infos/{user}")]
        public InfoResult Connexion(string user)
        {
            Utilisateur? u = Context.Utilisateurs.First(i => i.Pseudo == user);

            return (new InfoResult()
            {
                User = u.Pseudo,
                Entreprise = Context.Entreprises.First(i => i.Id == u.Entreprise).Nom
            });
        }
    }
}
