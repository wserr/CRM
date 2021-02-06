using Ardalis.ApiEndpoints;
using CRM.Core.Entities;
using CRM.SharedKernel.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Swashbuckle.AspNetCore.Annotations;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace CRM.Web.Endpoints.Students
{
    public class Create : BaseAsyncEndpoint<NewStudentRequest, ListStudentResponse>
    {
        private readonly IRepository repository;

        public Create(IRepository repository)
        {
            this.repository = repository;
        }

        [HttpPost("/Students")]
        [SwaggerOperation(
            Summary = "Creates a new Student",
            Description = "Creates a new Student",
            OperationId = "Student.Create",
            Tags = new[] { "StudentEndpoints" })]
        public override async Task<ActionResult<ListStudentResponse>> HandleAsync(NewStudentRequest request)
        {
            var newStudent = Student.Create(request.Name, request.FirstName, request.Mobile, request.Email);

            var createdItem = await repository.AddAsync(newStudent);

            return Ok(ListStudentResponse.Create(createdItem.Id, createdItem.Name, createdItem.FirstName, createdItem.Email));
        }
    }
}
