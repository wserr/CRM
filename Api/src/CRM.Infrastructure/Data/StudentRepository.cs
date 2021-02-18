using CRM.Core.Entities;
using CRM.Infrastructure.Interfaces;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;

namespace CRM.Infrastructure.Data
{
    public class StudentRepository : EfRepository, IStudentRepository
    {
        public StudentRepository(AppDbContext context):base(context)
        {

        }

        public Task<Student> GetByIdWithPaymentsAsync(int id)
        {
            return _dbContext.Set<Student>().Include(x => x.Payments).SingleOrDefaultAsync(e => e.Id == id);
        }
    }
}
