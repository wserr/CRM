using Ardalis.ApiEndpoints;
using CRM.Core.Entities;
using CRM.SharedKernel.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;

namespace CRM.Web.Endpoints.Payments
{
    public class Delete : BaseAsyncEndpoint<int, ListPaymentResponse>
    {
        private readonly IRepository repository;

        public Delete(IRepository repository)
        {
            this.repository = repository;
        }

        [Authorize]
        [HttpDelete("/Payments/{id:int}")]
        [SwaggerOperation(
            Summary = "Deletes a Payment",
            Description = "Deletes a Payment",
            OperationId = "Payment.Delete",
            Tags = new[] { "PaymentEndpoints" })]

        public override async Task<ActionResult<ListPaymentResponse>> HandleAsync(int id)
        {
            var existingPayment = await this.repository.GetByIdAsync<Payment>(id);

            await this.repository.DeleteAsync<Payment>(existingPayment);

            return Ok(ListPaymentResponse.Create(existingPayment.Id, existingPayment.TimeStamp, existingPayment.Amount));

        }
    }
}
