using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.Extensions.DependencyInjection;
using System.Net;
using Microsoft.AspNetCore.Http;
using NonActionAttribute = Microsoft.AspNetCore.Mvc.NonActionAttribute;
using Microsoft.AspNetCore.Authorization;
using Entities;

namespace ProductManagement.Controllers
{
    [Authorize]
    public class BaseController : ControllerBase
    {
        public static ProductManagementContext _context;
        public static IActionContextAccessor _actionContext;
        public static IHttpContextAccessor _httpContextAccessor;
        public static IServiceScopeFactory _serviceScopeFactory;
        private ProductManagementContext context;
        private IActionContextAccessor actionContext;

        public BaseController(ProductManagementContext context, IActionContextAccessor actionContext, IServiceScopeFactory serviceScopeFactory, IHttpContextAccessor httpContextAccessor)
        {
            _context = context;
            _actionContext = actionContext;
            _serviceScopeFactory = serviceScopeFactory;
            _httpContextAccessor = httpContextAccessor;
        }

     

        [NonAction]
        public ObjectResult BadRequestWithCustomError(string errorMessage, string errorCode = "1000")
        {
            var response = new ObjectResult(Shared.Response.GetErrorResponse(HttpStatusCode.BadRequest, errorCode, errorMessage));

            return response;
        }
        [NonAction]
        public ObjectResult OK(object result)
        {
            var response = new ObjectResult(result);
            return response;
        }

        [NonAction]
        public ObjectResult OK()
        {
            return new ObjectResult(Shared.Response.GetResponse(HttpStatusCode.OK));
        }

    }
}
