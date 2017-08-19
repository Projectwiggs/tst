using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.ComponentModel.DataAnnotations;
using System.Security.Principal;

namespace TST.EF
{
    #region Departments Metadata
    public class DepartmentsMetadata
    {

        [Required(ErrorMessage = "**Required")]
        [Display(Name = "Dept Name")]
        [StringLength(maximumLength: 25, ErrorMessage = "The name needs to be 25 characters or less.")]
        public string Name { get; set; }

        [Display(Name = "Description")]
        [UIHint("TextArea")]
        public string Description { get; set; }

        [Display(Name = "Visible")]
        public bool IsActive { get; set; }
    }
    [MetadataType(typeof(DepartmentsMetadata))]
    public partial class TSTDepartment
    {

    }
    #endregion

    #region Employees Metadata
    public class EmployeesMetadata
    {

        [Required(ErrorMessage = "**Required")]
        [Display(Name = "First Name")]
        [StringLength(maximumLength: 20, ErrorMessage = "Name is too long. Max 20.")]
        public string FName { get; set; }

        [Required(ErrorMessage = "**Required")]
        [Display(Name = "Last Name")]
        [StringLength(maximumLength: 20, ErrorMessage = "Name is too long. Max 20.")]
        public string LName { get; set; }

        public int DeptID { get; set; }
        public bool IsActive { get; set; }
        public int EmployeeStatusID { get; set; }

        [Display(Name = "Hired")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public System.DateTime HireDate { get; set; }

        [Display(Name = "Departure")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public Nullable<System.DateTime> SeparationDate { get; set; }

        [Display(Name = "Address")]
        [StringLength(maximumLength: 20, ErrorMessage = "Address is too long. 150 Max.")]
        [DisplayFormat(NullDisplayText = "Not Provided")]
        public string Address1 { get; set; }

        [Display(Name = "Address 2")]
        [StringLength(maximumLength: 20, ErrorMessage = "Address is too long. 150 Max.")]
        [DisplayFormat(NullDisplayText = "Not Provided")]
        public string Address2 { get; set; }

        [StringLength(maximumLength: 50, ErrorMessage = "City is too long. 50 Max.")]
        [DisplayFormat(NullDisplayText = "Not Provided")]
        public string City { get; set; }

        [StringLength(maximumLength: 15, ErrorMessage = "State is too long. 15 Max.")]
        [DisplayFormat(NullDisplayText = "Not Provided")]
        public string State { get; set; }

        [StringLength(maximumLength: 10, ErrorMessage = "Zip Code is too long. 10 Max.")]
        [DisplayFormat(NullDisplayText = "Not Provided")]
        public string Zip { get; set; }

        [DisplayFormat(NullDisplayText = "Not Provided")]
        [StringLength(maximumLength: 20, ErrorMessage = "Phone is too long. 20 Max.")]
        public string Phone { get; set; }

        [Required(ErrorMessage = "**Required")]
        [StringLength(maximumLength: 75, ErrorMessage = "Email is too long. 75 Max.")]
        public string Email { get; set; }

        [Required(ErrorMessage = "**Required")]
        [Display(Name = "Job Title")]
        [StringLength(maximumLength: 30, ErrorMessage = "Job Title is too long. 30 Max.")]
        public string JobTitle { get; set; }


        [StringLength(maximumLength: 36, MinimumLength = 36, ErrorMessage = "Must be a valid username account (Use autosearch function)")]
        public string UserID { get; set; }

        [Display(Name = "Photo")]
        [DisplayFormat(NullDisplayText = "Default.gif")]
        public string EmpPhoto { get; set; }

        [Display(Name = "Name")]
        public string FullName { get { return this.FName + " " + this.LName; } set { this.FullName = value; } }
    }

    [MetadataType(typeof(EmployeesMetadata))]
    public partial class TSTEmployee
    {
        public string FullName { get { return this.FName + " " + this.LName; } set { this.FullName = value; } }
    }
    #endregion

    #region Tickets Metadata
    public class TicketsMetadata
    {
        public int TicketID { get; set; }
        public int TicketStatusID { get; set; }

        [Required(ErrorMessage = "**Required")]
        [Display(Name = "Subject")]
        public string TicketSubject { get; set; }

        [Required(ErrorMessage = "**Required")]
        [Display(Name = "Message")]
        public string TicketDescription { get; set; }

        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = false)]
        public System.DateTime SubmittedDate { get; set; }

        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = false)]
        public Nullable<System.DateTime> ResolvedDate { get; set; }

        public int SubmittedByID { get; set; }
        public Nullable<int> TechID { get; set; }

        [Display(Name = "Attached File")]
        public string Attachment { get; set; }

        public int Priority { get; set; }

    }

    [MetadataType(typeof(TicketsMetadata))]
    public partial class TSTTicket
    {
        public string ReplaceWS(string s)
        {
            s = s.Replace(" ", "");
            return s;
        }
    }
    #endregion

    #region TechNotes Metadata
    public class TechNotesMetadata
    {
        public int NotationID { get; set; }

        [Required(ErrorMessage = "Required")]
        [StringLength(500, ErrorMessage = "Max note length: 500 characters.")]
        public string Notation { get; set; }

        public int TechID { get; set; }
        public int TicketID { get; set; }
        public System.DateTime NotationDate { get; set; }
    }

    [MetadataType(typeof(TechNotesMetadata))]
    public partial class TSTTechNote
    {

    }
    #endregion

    #region TicketPriorites Metadata
    public class TicketPrioritiesMetadata
    {
        [Display(Name = "Priority")]
        public string Name { get; set; }

        [DisplayFormat(NullDisplayText = "No Description")]
        public string Description { get; set; }
    }

    [MetadataType(typeof(TicketPrioritiesMetadata))]
    public partial class TSTTicketPriority
    {

    }
    #endregion

    #region TicketStatus Metadata
    public class TicketStatusMetadata
    {
        [Display(Name = "Status")]
        public string Name { get; set; }

        [DisplayFormat(NullDisplayText = "No Description")]
        public string Description { get; set; }
    }

    [MetadataType(typeof(TicketStatusMetadata))]
    public partial class TicketStatus
    {

    }
    #endregion
    
}
