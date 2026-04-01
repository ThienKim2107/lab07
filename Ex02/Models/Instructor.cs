using System;

namespace Ex02.Models
{
    public class Instructor
    {
        public int InstructorID { get; set; }
        public string FirstName { get; set; } = string.Empty;
        public string LastName { get; set; } = string.Empty;
        public DateTime HireDate { get; set; }

        public string FullName => $"{FirstName} {LastName}";
    }
}