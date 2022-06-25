using API.Siret;
using Database;
using HMetropole.Shared.Models;
using HMetropole.Shared.Payloads;
using HMetropole.Shared.Results;
using Microsoft.AspNetCore.Mvc;
using Entreprise = HMetropole.Shared.Results.Entreprise;
using Prestataire = HMetropole.Shared.Models.Prestataire;
using Projet = HMetropole.Shared.Models.Projet;
using Theme = HMetropole.Shared.Models.Theme;

namespace HMetropole.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EntrepriseController : ControllerBase
    {
        private Wrapper Wrapper;
        private hackathonContext Context;

        public EntrepriseController(Wrapper wrapper, hackathonContext context)
        {
            Wrapper = wrapper;
            Context = context;
        }

        [HttpGet("{id}")]
        public Entreprise Index(int id)
        {
            Database.Entreprise e = Context.Entreprises.First(i => i.Id == id);

            return (new Entreprise
            {
                Id = e.Id,
                Name = e.Nom,
                Type = e.Type,
                Siret = e.Siret,
                Activité = e.Activité,
                Adresse = e.Adresse,
                Cp = e.Cp,
                Taille = e.Taille,
                Bio = e.Bio,
                Logo = e.Logo
            });
        }
    }
}
