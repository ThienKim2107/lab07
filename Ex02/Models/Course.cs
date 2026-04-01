using System.Collections.Generic;

namespace Ex02.Models
{
    public class Course
    {
        public int CourseID { get; set; }
        public string Title { get; set; } = string.Empty;
        public int Credits { get; set; }

        public int? DepartmentID { get; set; }

        // Navigation
        public Department? Department { get; set; }
        public ICollection<Enrollment> Enrollments { get; set; } = new List<Enrollment>();
    }
}