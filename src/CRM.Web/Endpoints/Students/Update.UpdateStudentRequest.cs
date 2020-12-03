using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace CRM.Web.Endpoints.Students
{
    public class UpdateStudentRequest
    {
        [Required]
        public int Id { get; set; }

        public string FirstName { get; set; }

        public string Name { get; set; }

        public string Mobile { get; set; }

        public string Email { get; set; }
    }
}
