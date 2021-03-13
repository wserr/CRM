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
    public class Update : BaseAsyncEndpoint<UpdateStudentRequest, ListStudentResponse>
    {
        private readonly IRepository repository;

        public Update(IRepository repository)
        {
            this.repository = repository;
        }

        [Authorize]
        [HttpPut("/Students")]
        [SwaggerOperation(
            Summary = "Updates a Student",
            OperationId = "Student.Update",
            Tags = new[] { "StudentEndpoints" })]
        public override async Task<ActionResult<ListStudentResponse>> HandleAsync(UpdateStudentRequest request)
        {
            var existingStudent = await this.repository.GetByIdAsync<Student>(request.Id);

            existingStudent.Name = request.Name;
            existingStudent.FirstName = request.FirstName;
            existingStudent.Email = request.Email;
            existingStudent.Mobile = request.Mobile;

            await this.repository.UpdateAsync<Student>(existingStudent);

            return ListStudentResponse.Create(existingStudent.Id, existingStudent.Name, existingStudent.FirstName);

        }
    }
}
