using Microsoft.AspNetCore.Mvc;

namespace HolaMundoAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HolaController : ControllerBase
    {
        // GET api/hola
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(new { message = "Hola Mundo desde el controlador de la API!" });
        }
    }
}
