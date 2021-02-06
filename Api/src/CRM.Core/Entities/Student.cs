using CRM.SharedKernel;
using System;
using System.Collections.Generic;
using System.Text;

namespace CRM.Core.Entities
{
    public class Student: BaseEntity
    {
        public string Name { get; set; }

        public string FirstName { get; set; }

        public string Mobile { get; set; }

        public string Email { get; set; }

        public ICollection<Payment> Payments { get; set; }

        public static Student Create(string name, string firstName, string mobile, string email)
        {
            return new Student()
            {
                Name = name,
                FirstName = firstName,
                Mobile = mobile,
                Email = email
            };
        }
    }
}
