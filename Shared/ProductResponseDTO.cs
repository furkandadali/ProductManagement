using System;

namespace Shared
{
    public class ProductsResponseDTO
    {
        public int Id { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ProductName { get; set; }

    }
    public class ProductDetailResponseDTO
    {
        public int Id { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public string ProductImageLink { get; set; }
        public decimal ProductPrice { get; set; }
        public int ProductLikeCount { get; set; }
        public int ProductViewCount { get; set; }
        public double ProductPoint { get; set; }
    }
}
