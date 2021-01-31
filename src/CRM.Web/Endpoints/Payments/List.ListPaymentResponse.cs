using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CRM.Web.Endpoints.Payments
{
    public class ListPaymentResponse
    {
        public int Id { get; set; }
        public DateTime TimeStamp { get; set; }

        public Decimal Amount { get; set; }

        public static ListPaymentResponse Create(int id, DateTime timeStamp, decimal amount)
        {
            return new ListPaymentResponse()
            {
                Id = id,
                TimeStamp = timeStamp,
                Amount = amount
            };
        }

    }
}
