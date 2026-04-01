namespace Ex02.Models
{
    public class Enrollment
    {
        public int EnrollmentID { get; set; }

        public int CourseID { get; set; }
        public int StudentID { get; set; }

        public decimal? Grade { get; set; }

        // Navigation
        public Course? Course { get; set; }
        public Student? Student { get; set; }
    }
}