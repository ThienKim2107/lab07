using System;
using System.Collections.Generic;

namespace Ex02.Models
{
    public class Department
    {
        public int DepartmentID { get; set; }
        public string Name { get; set; } = string.Empty;
        public decimal Budget { get; set; }
        public DateTime StartDate { get; set; }

        // Navigation
        public ICollection<Course> Courses { get; set; } = new List<Course>();
    }
}