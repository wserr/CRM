﻿using System.ComponentModel.DataAnnotations;

namespace CRM.Web.Endpoints.ToDoItems
{
    public class UpdateToDoItemRequest
    {
        [Required]
        public int Id { get; set; }
        [Required]
        public string Title { get; set; }
        public string Description { get; set; }
    }
}