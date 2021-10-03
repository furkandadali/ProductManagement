using Entities.Models;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace Entities
{
    public class ProductManagementContext : DbContext
    {
        public ProductManagementContext(DbContextOptions<ProductManagementContext>options) : base(options)
        {
            
        }

        public ProductManagementContext()
        {
            this.ChangeTracker.AutoDetectChangesEnabled = false;
            this.ConfigureAwait(false);
        }

        #region Models
        public DbSet<ApiUser> ApiUsers { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Log> Logs { get; set; }
        #endregion

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new ApiUserConfiguration());
            modelBuilder.ApplyConfiguration(new ProductConfiguration());
            modelBuilder.ApplyConfiguration(new LogConfiguration());
        }
    }
}
