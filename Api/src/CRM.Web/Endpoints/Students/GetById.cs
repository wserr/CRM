﻿using Ardalis.ApiEndpoints;
using CRM.Infrastructure.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;

namespace CRM.Web.Endpoints.Students
{
    public class GetById : BaseAsyncEndpoint<int, GetByIdResponse>
    {
        private readonly IStudentRepository repository;

        public GetById(IStudentRepository repository)
        {
            this.repository = repository;
        }

        [Authorize]
        [HttpGet("/Students/{id:int}")]
        [SwaggerOperation(
            Summary = "Gets a single Student",
            Description = "Gets a single Student by Id",
            OperationId = "Student.GetById",
            Tags = new[] { "StudentEndpoints" })]
        public override async Task<ActionResult<GetByIdResponse>> HandleAsync(int id)
        {
            var student = await this.repository.GetByIdWithPaymentsAsync(id);
            var model = new GetByIdResponse(student.Name, student.FirstName, student.Email, student.Payments.Select(x => new PaymentModel(x.TimeStamp, x.Amount)).ToList());

            return Ok(model);
        }
    }
}
