using Microsoft.AspNetCore.Mvc;

namespace CRM.Web.Api
{
    [Route("api/[controller]")]
    [ApiController]
    public abstract class BaseApiController : Controller
    {
    }
}
