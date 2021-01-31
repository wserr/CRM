using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CRM.Web.Endpoints.Payments
{
    public class ListPaymentResponse
    {
        public DateTime TimeStamp { get; set; }

        public Decimal Amount { get; set; }

    }
}
