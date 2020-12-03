using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CRM.Web.Endpoints.Students
{
    public class NewStudentRequest
    {
        public string Name { get; set; }

        public string FirstName { get; set; }

        public string Mobile { get; set; }

        public string Email { get; set; }
    }
}
