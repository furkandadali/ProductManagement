using Entities;
using Entities.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Primitives;
using ProductManagement.Helper;
using ProductManagement.Model;
using Shared;
using Swashbuckle.AspNetCore.Annotations;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Net.Http.Headers;
namespace ProductManagement.Controllers
{
    [SwaggerTag("This allows you to view statistics of searches performed by your organization.")]
    [ApiController]
    [Route("api")]
    public class ProductController : BaseController
    {
        public ProductController(ProductManagementContext context, IActionContextAccessor actionContext, IServiceScopeFactory serviceScopeFactory, IHttpContextAccessor httpContextAccessor) : base(context, actionContext, serviceScopeFactory, httpContextAccessor)
        {
        }

        [SwaggerOperation(Summary = "This service allows you to view the products between skip and take parameters values.")]
        [HttpGet]
        [Route("Products")]
        [SwaggerResponse(200, type: typeof(ProductListResponseModel))]
        public IActionResult GetProducts(int skip = 0, int take = 20)
        {
            var auth = AuthenticationHeaderValue.Parse(_httpContextAccessor.HttpContext.Request.Headers["Authorization"]);
            string[] headerValue = ProjectHelper.ParseAuthorizationHeader(auth);
            string parameters = string.Empty;
            string username = headerValue[0];
            string password = headerValue[1];
            parameters += "Skip: " + skip + "| ";
            parameters += "Take: " + take + "| ";
            parameters += "ApiKey: " + username;
            try
            {
                using (var scope = _serviceScopeFactory.CreateScope())
                {
                    var context = scope.ServiceProvider.GetRequiredService<ProductManagementContext>();
                    var response = new ProductListResponseModel();
                    var user = context.ApiUsers.FirstOrDefault(m => m.IsDeleted == false && m.ApiKey == username && m.ApiPassword == password);

                    if (user != null)
                    {
                        LogHelper.Info(parameters, user?.Id);

                        response.Result = context.Products.Where(m => m.IsDeleted == false).Select(m => new ProductsResponseDTO()
                        {
                            Id = m.Id,
                            CreatedDate = m.CreatedDate,
                            ProductName = m.ProductName
                        }).OrderBy(m=> m.Id).Skip(skip).Take(take).ToList();

                        LogHelper.Success(parameters, user?.Id);
                        return OK(response);
                    }
                    else
                    {
                        return BadRequestWithCustomError("User Not Found!", "SR1001");
                    }
                }
            }
            catch (Exception ex)
            {
                LogHelper.Fatal(ex, parameters, null);
                return BadRequestWithCustomError("System Error!", "");
            }
        }

        [SwaggerOperation(Summary = "This service allows you to view the spesific product detail.")]
        [HttpPost]
        [Route("NewProduct")]
        [SwaggerResponse(200, type: typeof(ProductDetailResponseModel))]
        public IActionResult NewProduct(NewProductRequestDTO model)
        {
            var auth = AuthenticationHeaderValue.Parse(_httpContextAccessor.HttpContext.Request.Headers["Authorization"]);
            string[] headerValue = ProjectHelper.ParseAuthorizationHeader(auth);
            string parameters = string.Empty;
            string username = headerValue[0];
            string password = headerValue[1];
            parameters += "ProductName: " + model.ProductName + "| ";
            parameters += "ProductDescription: " + model.ProductDescription + "| ";
            parameters += "ProductImageLink: " + model.ProductImageLink + "| ";
            parameters += "ProductPrice: " + model.ProductPrice + "| ";
            parameters += "ApiKey: " + username;
            try
            {
                using (var scope = _serviceScopeFactory.CreateScope())
                {
                    var context = scope.ServiceProvider.GetRequiredService<ProductManagementContext>();
                    var response = new ProductDetailResponseModel();
                    var user = context.ApiUsers.FirstOrDefault(m => m.IsDeleted == false && m.ApiKey == username && m.ApiPassword == password);

                    if (user != null)
                    {
                        LogHelper.Info(parameters, user?.Id);
                        //if(string.IsNullOrEmpty(model.ProductName))
                        //    return BadRequestWithCustomError("Please Fill Product Name!", "SR1001");
                        var product = new Product()
                        {
                            ProductName = model.ProductName,
                            ProductDescription = model.ProductDescription,
                            ProductImageLink = model.ProductImageLink,
                            ProductPrice = model.ProductPrice,
                            CreatedUserId=user.Id
                            
                        };
                        context.Products.Add(product);
                        context.SaveChanges();
                        response.Result = new ProductDetailResponseDTO()
                        {
                            Id = product.Id,
                            CreatedDate = product.CreatedDate,
                            ProductName = product.ProductName,
                            ProductDescription = product.ProductDescription,
                            ProductImageLink = product.ProductImageLink,
                            ProductLikeCount = product.ProductLikeCount,
                            ProductPoint = product.ProductPoint,
                            ProductPrice = product.ProductPrice,
                            ProductViewCount = product.ProductViewCount
                        };
                        LogHelper.Success(parameters, user?.Id);
                        return OK(product);
                    }
                    else
                    {
                        return BadRequestWithCustomError("User Not Found!", "SR1001");
                    }
                }
            }
            catch (Exception ex)
            {
                LogHelper.Fatal(ex, parameters, null);
                return BadRequestWithCustomError("System Error!", "");
            }
        }

        [SwaggerOperation(Summary = "This service allows you to view product showcase detail informations")]
        [HttpPost]
        [Route("UpdateProduct")]
        [SwaggerResponse(200, type: typeof(ProductDetailResponseModel))]
        public IActionResult UpdateProduct(UpdateProductRequestDTO model)
        {
            var auth = AuthenticationHeaderValue.Parse(_httpContextAccessor.HttpContext.Request.Headers["Authorization"]);
            string[] headerValue = ProjectHelper.ParseAuthorizationHeader(auth);
            string parameters = string.Empty;
            string username = headerValue[0];
            string password = headerValue[1];
            parameters += "Id: " + model.Id + "| ";
            parameters += "ProductName: " + model.ProductName + "| ";
            parameters += "ProductDescription: " + model.ProductDescription + "| ";
            parameters += "ProductImageLink: " + model.ProductImageLink + "| ";
            parameters += "ProductPrice: " + model.ProductPrice + "| ";
            parameters += "ApiKey: " + username;
            try
            {
                using (var scope = _serviceScopeFactory.CreateScope())
                {
                    var context = scope.ServiceProvider.GetRequiredService<ProductManagementContext>();
                    var response = new ProductDetailResponseModel();
                    var user = context.ApiUsers.FirstOrDefault(m => m.IsDeleted == false && m.ApiKey == username && m.ApiPassword == password);

                    if (user != null)
                    {
                        LogHelper.Info(parameters, user?.Id);

                        var product = context.Products.FirstOrDefault(m=> m.IsDeleted == false && m.Id == model.Id);
                        if(product != null)
                        {
                            product.ProductName = model.ProductName;
                            product.ProductDescription = model.ProductDescription;
                            product.ProductImageLink = model.ProductImageLink;
                            product.ProductPrice = model.ProductPrice;
                            product.ModifiedDate = DateTime.Now;
                            product.ModifiedUserId = user.Id;

                            context.Entry(product).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                            context.SaveChanges();

                            response.Result = new ProductDetailResponseDTO()
                            {
                                Id = product.Id,
                                CreatedDate = product.CreatedDate,
                                ProductName = product.ProductName,
                                ProductDescription = product.ProductDescription,
                                ProductImageLink = product.ProductImageLink,
                                ProductLikeCount = product.ProductLikeCount,
                                ProductPoint = product.ProductPoint,
                                ProductPrice = product.ProductPrice,
                                ProductViewCount = product.ProductViewCount
                            };
                        }
                        else
                        {
                            return BadRequestWithCustomError("Product Not Found!", "PR1001");
                        }

                        LogHelper.Success(parameters, user?.Id);
                        return OK(product);
                    }
                    else
                    {
                        return BadRequestWithCustomError("User Not Found!", "SR1001");
                    }
                }
            }
            catch (Exception ex)
            {
                LogHelper.Fatal(ex, parameters, null);
                return BadRequestWithCustomError("System Error!", "");
            }
        }

        [SwaggerOperation(Summary = "This service allows you to view the product properties detail.")]
        [HttpGet]
        [Route("Product")]
        [SwaggerResponse(200, type: typeof(ProductDetailResponseModel))]
        public IActionResult GetProducts([Required]int ProductId)
        {
            var auth = AuthenticationHeaderValue.Parse(_httpContextAccessor.HttpContext.Request.Headers["Authorization"]);
            string[] headerValue = ProjectHelper.ParseAuthorizationHeader(auth);
            string parameters = string.Empty;
            string username = headerValue[0];
            string password = headerValue[1];
            parameters += "ProductId: " + ProductId + "| ";
            parameters += "ApiKey: " + username;

            try
            {
                using (var scope = _serviceScopeFactory.CreateScope())
                {
                    var context = scope.ServiceProvider.GetRequiredService<ProductManagementContext>();
                    var response = new ProductDetailResponseModel();
                    var user = context.ApiUsers.FirstOrDefault(m => m.IsDeleted == false && m.ApiKey == username && m.ApiPassword == password);

                    if (user != null)
                    {
                        LogHelper.Info(parameters, user?.Id);

                        response.Result = context.Products.Where(m => m.IsDeleted == false && m.Id == ProductId).Select(m => new ProductDetailResponseDTO()
                        {
                            Id = m.Id,
                            CreatedDate = m.CreatedDate,
                            ProductName = m.ProductName,
                            ProductDescription = m.ProductDescription,
                            ProductImageLink = m.ProductImageLink,
                            ProductLikeCount = m.ProductLikeCount,
                            ProductPoint =m.ProductPoint,
                            ProductPrice = m.ProductPrice,
                            ProductViewCount = m.ProductViewCount
                        }).FirstOrDefault();

                        LogHelper.Success(parameters, user?.Id);
                        return OK(response);
                    }
                    else
                    {
                        return BadRequestWithCustomError("User Not Found!", "SR1001");
                    }
                }
            }
            catch (Exception ex)
            {
                LogHelper.Fatal(ex, parameters, null);
                return BadRequestWithCustomError("System Error!", "");
            }
        }

    }
}
