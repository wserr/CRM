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

namespace CRM.Web.Endpoints.Students
{
    public class Delete : BaseAsyncEndpoint<int, ListStudentResponse>
    {
        private readonly IRepository repository;

        public Delete(IRepository repository)
        {
            this.repository = repository;
        }

        [Authorize]
        [HttpDelete("/Students/{id:int}")]
        [SwaggerOperation(
            Summary = "Deletes a Student",
            Description = "Deletes a Student",
            OperationId = "Student.Delete",
            Tags = new[] { "StudentEndpoints" })]
        public override async Task<ActionResult<ListStudentResponse>> HandleAsync(int id)
        {
            var existingStudent = await this.repository.GetByIdAsync<Student>(id);

            await this.repository.DeleteAsync<Student>(existingStudent);

            return Ok(ListStudentResponse.Create(existingStudent.Id, existingStudent.Name, existingStudent.FirstName));
        }
    }
}
