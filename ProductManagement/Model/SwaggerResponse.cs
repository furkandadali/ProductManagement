using Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;

namespace ProductManagement.Model
{
    public class SwaggerResponse
    {
        public HttpStatusCode HttpStatusCode { get; set; } = HttpStatusCode.OK;
        public bool IsSuccess { get; set; } = true;
        public string ErrorCode { get; set; }
        public string ErrorMessage { get; set; }
        public string ExtraInfo { get; set; }
    }
    public class ProductDetailResponseModel : SwaggerResponse
    {
        public ProductDetailResponseDTO Result { get; set; } = new ProductDetailResponseDTO();
    }
    public class ProductListResponseModel : SwaggerResponse
    {
        public List<ProductsResponseDTO> Result { get; set; } = new List<ProductsResponseDTO>();
    }
}
