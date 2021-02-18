using CRM.Core.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace CRM.Infrastructure.Interfaces
{
    public interface IStudentRepository
    {
        Task<Student> GetByIdWithPaymentsAsync(int id);
    }
}
