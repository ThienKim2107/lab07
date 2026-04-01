using Ex01.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace Ex01.Pages.Courses
{
    public class EditModel : PageModel
    {
        private readonly SchoolContext _context;

        public EditModel(SchoolContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Course Course { get; set; } = new();

        public SelectList DepartmentList { get; set; } = default!;

        public async Task<IActionResult> OnGetAsync(int id)
        {
            var course = await _context.Courses.FindAsync(id);

            if (course == null)
                return NotFound();

            Course = course;

            DepartmentList = new SelectList(
                await _context.Departments.ToListAsync(),
                "DepartmentID",
                "Name"
            );

            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                DepartmentList = new SelectList(
                    await _context.Departments.ToListAsync(),
                    "DepartmentID",
                    "Name"
                );
                return Page();
            }

            _context.Attach(Course).State = EntityState.Modified;
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}