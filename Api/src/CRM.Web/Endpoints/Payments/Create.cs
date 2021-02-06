using Ardalis.ApiEndpoints;
using CRM.Core.Entities;
using CRM.SharedKernel.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CRM.Web.Endpoints.Payments
{
    public class Create : BaseAsyncEndpoint<NewPaymentRequest, ListPaymentResponse>
    {
        private readonly IRepository repository;

        public Create(IRepository repository)
        {
            this.repository = repository;
        }

        [HttpPost("/Payments")]
        [SwaggerOperation(
            Summary = "Creates a new Payment",
            Description = "Creates a new Payment",
            OperationId = "Payment.Create",
            Tags = new[] { "PaymentEndpoints" })]

        public override async Task<ActionResult<ListPaymentResponse>> HandleAsync(NewPaymentRequest request)
        {
            var newPayment = Payment.Create(DateTime.Now, request.Amount, request.StudentId);

            var createdPayment = await this.repository.AddAsync<Payment>(newPayment);

            return Ok(ListPaymentResponse.Create(newPayment.Id, newPayment.TimeStamp, newPayment.Amount));

        }
    }
}
