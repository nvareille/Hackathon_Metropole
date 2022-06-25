using API.Siret;
using Database;
using HMetropole.Shared.Models;
using HMetropole.Shared.Payloads;
using HMetropole.Shared.Results;
using Microsoft.AspNetCore.Mvc;
using Theme = HMetropole.Shared.Models.Theme;

namespace HMetropole.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ForumController : ControllerBase
    {
        private Wrapper Wrapper;
        private hackathonContext Context;

        public ForumController(Wrapper wrapper, hackathonContext context)
        {
            Wrapper = wrapper;
            Context = context;
        }

        [HttpGet]
        public ForumConfigResult Index()
        {
            SubTheme[] sub = Context.Sousthemes.Select(o => new SubTheme
            {
                Id = o.Id,
                Name = o.Nom,
                Theme = o.Theme
            }).ToArray();

            Theme[] themes = Context.Themes.Select(i => new Theme
            {
                Id = i.Id,
                Name = i.Nom,
            }).ToArray();

            foreach (Theme theme in themes)
            {
                theme.SubThemes = sub.Where(i => i.Theme == theme.Id);
            }

            return (new ForumConfigResult
            {
                Themes = themes
            });
        }

        [HttpGet("{stheme}")]
        public ForumThreadResult GetThreads(int stheme)
        {
            HashSet<int> userIds = new HashSet<int>();
            ForumThread[] threads = Context.Threads.Where(i => i.Soustheme == stheme)
                .Select(i => new ForumThread
                {
                    Id = i.Id,
                    User = i.Utilisateur,
                    Question = i.Question
                }).ToArray();

            foreach (ForumThread thread in threads)
            {
                thread.Responses = Context.Reponses.Select(i => new ThreadResponse
                {
                    Id = thread.Id,
                    User = i.Utilisateur,
                    Content = i.Reponse1,
                    Validated = i.Valide,
                });

                userIds.Add(thread.User);

                foreach (ThreadResponse response in thread.Responses)
                {
                    userIds.Add(response.User);
                }
            }

            return (new ForumThreadResult
            {
                Threads = threads,
                Users = Context.Utilisateurs.Where(i => userIds.Contains(i.Id)).Select(i => new User
                {
                    Id = i.Id,
                    Name = i.Pseudo
                })
            });
        }
    }
}
