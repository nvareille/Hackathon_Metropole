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
            Client.BaseAddress = new Uri("https://api.insee.fr/entreprises/sirene/V3/");
        }

        public async Task<Etablissement> GetEntreprise(string siret)
        {
            string a = await Client.GetStringAsync($"siret/{siret}");
            APIFrame b = JsonConvert.DeserializeObject<APIFrame>(a) ?? throw new Exception();

            return (b.Etablissement);
        }
    }
}