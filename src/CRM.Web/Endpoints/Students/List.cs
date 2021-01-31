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
    public class List : BaseAsyncEndpoint<List<ListStudentResponse>>
    {
        private readonly IRepository repository;

        public List(IRepository repository)
        {
            this.repository = repository;
        }

        [HttpGet("/Students")]
        [SwaggerOperation(
            Summary = "Gets a list of all Students",
            Description = "Gets a list of all Students",
            OperationId = "Student.List",
            Tags = new[] { "StudentEndpoints" })]
        public override async Task<ActionResult<List<ListStudentResponse>>> HandleAsync()
        {
            var items = (await this.repository.ListAsync<Student>())
                .Select(item =>  ListStudentResponse.Create(item.Id, item.Name, item.FirstName, item.Email));

            return Ok(items);
        }
    }
}
