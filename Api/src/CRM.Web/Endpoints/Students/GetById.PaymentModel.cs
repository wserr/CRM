using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CRM.Web.Endpoints.Students
{
    public class PaymentModel
    {
        public DateTime TimeStamp { get; private set; }
        public decimal Amount { get; private set; }

        public PaymentModel(DateTime timeStamp, decimal amount)
        {
            TimeStamp = timeStamp;
            Amount = amount;
        }
    }
}
