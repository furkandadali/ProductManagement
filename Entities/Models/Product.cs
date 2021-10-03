using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Entities.Models
{
    public class Product : Base
    {
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public string ProductImageLink { get; set; }
        public decimal ProductPrice { get; set; }
        public int ProductLikeCount { get; set; }
        public int ProductViewCount { get; set; }
        public double ProductPoint { get; set; }

    }

    public class ProductConfiguration : IEntityTypeConfiguration<Product>
    {
        public void Configure(EntityTypeBuilder<Product> builder)
        {
        }
    }
}
