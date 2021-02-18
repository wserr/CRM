using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CRM.Web.Endpoints.Students
{
	public class GetByIdResponse
	{
		public List<PaymentModel> Payments { get; set; }
		public string Name { get; set; }
		public string FirstName { get; set; }
		public string Email { get; set; }

        public GetByIdResponse(string name, string firstName, string email, List<PaymentModel> payments)
        {
			Name = name;
			FirstName = firstName;
			Email = email;
			Payments = payments;
        }
	}
}
