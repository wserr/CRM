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
    public class List : BaseAsyncEndpoint<int,List<ListPaymentResponse>>
    {
        private readonly IRepository repository;

        public List(IRepository repository)
        {
            this.repository = repository;
        }

        [HttpGet("/Payments")]
        [SwaggerOperation(
            Summary = "Gets a list of all Payments for a studentID",
            Description = "Gets a list of all Payments for a studentID",
            OperationId = "Payment.List",
            Tags = new[] { "PaymentEndpoints" })]
        public override async Task<ActionResult<List<ListPaymentResponse>>> HandleAsync(int studentId)
        {
            var items = (await this.repository.ListAsync<Payment>())
                .Where(x => x.StudentId == studentId)
                .Select(item => ListPaymentResponse.Create(item.Id, item.TimeStamp, item.Amount));

            return Ok(items);
        }
    }
}
