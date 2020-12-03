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
    public class GetById : BaseAsyncEndpoint<int, ListStudentResponse>
    {
        private readonly IRepository repository;

        public GetById(IRepository repository)
        {
            this.repository = repository;
        }

        [HttpGet("/Students/{id:int}")]
        [SwaggerOperation(
            Summary = "Gets a single Student",
            Description = "Gets a single Student by Id",
            OperationId = "Student.GetById",
            Tags = new[] { "StudentEndpoints" })]
        public override async Task<ActionResult<ListStudentResponse>> HandleAsync(int id)
        {
            var student = await this.repository.GetByIdAsync<Student>(id);

            return Ok(new ListStudentResponse
            {
                Name = student.Name,
                Email = student.Email,
                FirstName = student.FirstName
            });
        }
    }
}
