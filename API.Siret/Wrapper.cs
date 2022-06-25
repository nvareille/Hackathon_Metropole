using System.Net.Http.Json;
using API.Siret.Model;
using Newtonsoft.Json;

namespace API.Siret
{
    public class Wrapper
    {
        private string Token;
        private HttpClient Client;

        public Wrapper(string token)
        {
            Token = token;
            Client = new HttpClient();

            Client.DefaultRequestHeaders.Add("Authorization", $"Bearer {token}");
            Client.BaseAddress = new Uri("https://api.insee.fr/");
        }

        public async Task<Etablissement> GetEntreprise(string siret)
        {
            string a = await Client.GetStringAsync($"entreprises/sirene/V3/siret/{siret}");
            APIFrame b = JsonConvert.DeserializeObject<APIFrame>(a) ?? throw new Exception();

            var c = await Client.GetStringAsync($"metadonnees/V1/codes/nafr2/classe/{b.Etablissement.UniteLegale.GetCode()}");
            b.Etablissement.Activite = JsonConvert.DeserializeObject<Activite>(c) ?? throw new Exception();

            return (b.Etablissement);
        }
    }
}