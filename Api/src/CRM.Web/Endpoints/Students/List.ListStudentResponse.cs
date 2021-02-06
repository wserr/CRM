using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CRM.Web.Endpoints.Students
{
    public class ListStudentResponse
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public string FirstName { get; set; }

        public string Email { get; set; }

        public static ListStudentResponse Create(int id, string name, string firstName, string email)
        {
            return new ListStudentResponse()
            {
                Id = id,
                Name = name,
                FirstName = firstName,
                Email = email
            };
        }
    }
}
