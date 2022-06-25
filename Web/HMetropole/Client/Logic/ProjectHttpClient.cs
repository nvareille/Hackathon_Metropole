using System.Net.Http.Json;

namespace HMetropole.Client.Logic
{
    public class ProjectHttpClient
    {
        private readonly HttpClient _httpClient;

        public ProjectHttpClient(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<T> Get<T>(string url)
        {
            return (await _httpClient.GetFromJsonAsync<T>(url) ?? throw new Exception());
        }
    }
}
