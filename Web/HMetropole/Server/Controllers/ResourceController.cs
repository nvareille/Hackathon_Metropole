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
    public class ResourceController : ControllerBase
    {
        private Wrapper Wrapper;
        private hackathonContext Context;

        public ResourceController(Wrapper wrapper, hackathonContext context)
        {
            Wrapper = wrapper;
            Context = context;
        }

        [HttpGet]
        public IEnumerable<Resource> Index()
        {
            
            return (Context.Ressources.Select(i => new Resource
            {
                Id = i.Id,
                Name = i.Nom,
                URL = i.Url,
                SousTheme = i.Soustheme
            }));
        }
    }
}
