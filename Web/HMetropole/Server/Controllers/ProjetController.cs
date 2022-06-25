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
    public class ProjetController : ControllerBase
    {
        private Wrapper Wrapper;
        private hackathonContext Context;

        public ProjetController(Wrapper wrapper, hackathonContext context)
        {
            Wrapper = wrapper;
            Context = context;
        }

        [HttpGet]
        public ProjetResult Index()
        {
            HashSet<int> set = new HashSet<int>();
            HashSet<int> presta = new HashSet<int>();
            ProjetResult result = new ProjetResult();

            result.Projets = Context.Projets.Select(i => new Projet
            {
                Id = i.Id,
                Name = i.Nom,
                Entreprise = i.Entreprise,
                Content = i.Description,
                Prestataire = i.Prestataire,
                SousTheme = i.Soustheme
            }).ToArray();

            foreach (Projet projet in result.Projets)
            {
                set.Add(projet.Entreprise);
                presta.Add(projet.Prestataire);
            }

            result.Entreprises = Context.Entreprises.Where(i => set.Contains(i.Id))
                .Select(i => new Entreprise
                {
                    Id = i.Id,
                    Name = i.Nom
                }).ToArray();

            result.Prestataires = Context.Prestataires.Where(i => set.Contains(i.Id))
                .Select(i => new Prestataire()
                {
                    Id = i.Id,
                    Name = i.Nom
                }).ToArray();

            return (result);
        }
    }
}
