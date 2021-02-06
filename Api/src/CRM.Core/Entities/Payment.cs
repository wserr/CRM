using CRM.SharedKernel;
using System;
using System.Collections.Generic;
using System.Text;

namespace CRM.Core.Entities
{
    public class Payment: BaseEntity
    {
        public DateTime TimeStamp { get; set; }
        public decimal Amount { get; set; }
        public int StudentId { get; set; }

        public Student Student { get; set; }

        public static Payment Create(DateTime timeStamp, decimal amount, int studentId)
        {
            return new Payment()
            {
                TimeStamp = timeStamp,
                Amount = amount,
                StudentId = studentId
            };
        }
    }
}
