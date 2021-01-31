using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CRM.Web.Endpoints.Payments
{
    public class NewPaymentRequest
    {
        public decimal Amount { get; set; }
        public int StudentId { get; set; }
    }
}
