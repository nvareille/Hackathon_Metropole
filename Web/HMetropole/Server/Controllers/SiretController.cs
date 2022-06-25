using API.Siret;
using API.Siret.Model;
using Microsoft.AspNetCore.Mvc;

namespace HMetropole.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SiretController : ControllerBase
    {
        private Wrapper SiretWrapper;

        public SiretController(Wrapper wrapper)
        {
            SiretWrapper = wrapper;
        }
        
        [HttpGet("{siret}")]
        public async Task<Etablissement> Get(string siret)
        {
            return (await SiretWrapper.GetEntreprise(siret));
        }
    }
}
