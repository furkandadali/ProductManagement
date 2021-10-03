namespace Shared
{
    public class NewProductRequestDTO
    {
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public string ProductImageLink { get; set; }
        public decimal ProductPrice { get; set; }
    } 
    
    public class UpdateProductRequestDTO
    {
        public int Id { get; set; }
        public string ProductName { get; set; }
        public string ProductDescription { get; set; }
        public string ProductImageLink { get; set; }
        public decimal ProductPrice { get; set; }
    }
}
