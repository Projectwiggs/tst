using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TST.EF;
using TicketSupportTracker.UI.MVC.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.AspNet.Identity.EntityFramework;

namespace TicketSupportTracker.Controllers
{
    public class EmployeesController : Controller
    {
        private TSTProjectEntities db = new TSTProjectEntities();

        // GET: Employees
        [Authorize]
        public ActionResult Index()
        {
            var tSTEmployees = db.TSTEmployees.Include(t => t.AspNetUser).Include(t => t.TSTDepartment).Include(t => t.TSTEmployeeStatus);
            return View(tSTEmployees.ToList().OrderByDescending(e => e.DeptID));
        }

        // GET: Employees/Details/5
        [Authorize]
        public ActionResult Details(string RawID)
        {
            int id;
            if (int.TryParse(RawID, out id))
            {
                TSTEmployee tSTEmployee = db.TSTEmployees.Find(id);
                if (tSTEmployee == null)
                {
                    return Redirect("~/Employees/NotFound");
                }
                return View(tSTEmployee);
            }
            else
            {
                if (db.TSTEmployees.Where(e => e.UserID == RawID).Count() > 0)
                {
                    TSTEmployee tSTEmployee = db.TSTEmployees.Where(e => e.UserID == RawID).First();
                    return View(tSTEmployee);
                }
                else
                {
                    return Redirect("~/Employees/NotFound");
                }
            }
        }

        // GET: Employees/Create
        public ActionResult Create()
        {
            if (User.IsInRole("Admin"))
            {
                //Part of creating a user object when creating the employee is to retrieve a list of roles from Identity.
                //OWIN - Open Web Interface for .NET
                var RoleMgr = HttpContext.GetOwinContext().Get<ApplicationRoleManager>();

                //create a viewbag object to pass to the view to be consumed.
                ViewBag.RoleID = new SelectList(RoleMgr.Roles.ToList().OrderBy(r => r.Name), "Name", "Name");

                ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "Email");
                ViewBag.DeptID = new SelectList(db.TSTDepartments, "DeptId", "Name");
                ViewBag.EmployeeStatusID = new SelectList(db.TSTEmployeeStatuses, "StatusID", "StatusName");
                return View();
            }
            else
            {
                return Redirect("~/Home/Index");
            }
        }

        // POST: Employees/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "EmployeeID,FName,LName,DeptID,IsActive,EmployeeStatusID,HireDate,SeparationDate,Address1,Address2,City,State,Zip,Phone,Email,JobTitle")] TSTEmployee tSTEmployee,
            string[] selectedRoles)//must match the name value of the input - casing does not matter.
        {
            if (ModelState.IsValid)
            {
                //Similar code can be found in the UserAdmin Create()
                //HTTPPost Controller/Action

                //Create user manager object
                var userManager = System.Web.HttpContext.Current.GetOwinContext().GetUserManager<ApplicationUserManager>();

                //create an application user and assign the username email properties
                var newUser = new ApplicationUser()
                {
                    UserName = tSTEmployee.Email,
                    Email = tSTEmployee.Email
                };

                if (User.IsInRole("Admin") || User.IsInRole("Technician"))
                {
                    ViewBag.ASPCollection = db.AspNetUsers.ToList();
                }

                //-------------------
                //Create the user object with the default password
                string password = System.Web.Security.Membership.GeneratePassword(8, 2);
                userManager.Create(newUser, "P@ssw0rd");

                //Add the user to a role - as long as the role value is not null
                userManager.AddToRoles(newUser.Id, selectedRoles);

                //Assign the tSTEmployee.UserID property and add the data.
                tSTEmployee.UserID = newUser.Id;
                db.TSTEmployees.Add(tSTEmployee);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            var RoleMgr = HttpContext.GetOwinContext().Get<ApplicationRoleManager>();
            ViewBag.RoleID = new SelectList(RoleMgr.Roles.ToList().OrderBy(r => r.Name), "Name", "Name");
            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "Email", tSTEmployee.UserID);
            ViewBag.DeptID = new SelectList(db.TSTDepartments, "DeptId", "Name", tSTEmployee.DeptID);
            ViewBag.EmployeeStatusID = new SelectList(db.TSTEmployeeStatuses, "StatusID", "StatusName", tSTEmployee.EmployeeStatusID);
            return View(tSTEmployee);
        }

        // GET: Employees/Edit/5
        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            else
            {
                TSTEmployee tSTEmployee = db.TSTEmployees.Include(t => t.TSTDepartment).ToList().Where(t => t.EmployeeID == db.TSTEmployees.Find(id).EmployeeID).Single();
                if (tSTEmployee == null)
                {
                    return Redirect("~/Employees/NotFound");
                }
                else
                {

                    if (tSTEmployee.UserID == User.Identity.GetUserId() || User.IsInRole("Admin"))
                    {
                        ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "Email", tSTEmployee.UserID);
                        ViewBag.DeptID = new SelectList(db.TSTDepartments, "DeptId", "Name", tSTEmployee.DeptID);
                        ViewBag.EmployeeStatusID = new SelectList(db.TSTEmployeeStatuses, "StatusID", "StatusName", tSTEmployee.EmployeeStatusID);
                        return View(tSTEmployee);
                    }
                    else
                    {
                        return Redirect("~/Home/Index");
                    }
                }
            }
        }

        // POST: Employees/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "EmployeeID,FName,LName,DeptID,IsActive,EmployeeStatusID,HireDate,SeparationDate,Address1,Address2,City,State,Zip,Phone,Email,JobTitle,UserID,EmpPhoto")] TSTEmployee tSTEmployee, HttpPostedFileBase empImage)
        {

            if (ModelState.IsValid)
            {
                string imageName = tSTEmployee.EmpPhoto;

                //retrieve the file upload from the method, check to see if it has a file in it.
                if (empImage != null)
                {
                    //get the filename
                    imageName = empImage.FileName;
                    //extract the extension and store it.
                    string ext = imageName.Substring(imageName.LastIndexOf('.')).ToLower();

                    //check the file extension against valid file types
                    string[] goodExts = new string[] { ".gif", ".jpg", ".png", ".bmp", ".jpeg" };

                    //as long as it is valid
                    if (goodExts.Contains(ext))
                    {

                        //create a new uniqe file name and add the extension
                        imageName = Guid.NewGuid() + ext;

                        //save it to the webserver (website/content/images/productimages)
                        empImage.SaveAs(Server.MapPath("~/Content/images/employees/" + imageName));
                    }
                    else
                    {
                        imageName = "Default.gif";
                        //we could send them back to the create view and populate the create and use a viewbag message as an error
                        //ViewBag.Err = "Please supply a valid file type.";
                        //then only display this if the viewbag item is not null in the view
                        //return ViewBag(wGProduct);
                    }

                }
                //No matter what send the file name (either be the default name or the new image name)
                tSTEmployee.EmpPhoto = imageName;


                if (User.IsInRole("Admin"))
                {
                    db.Entry(tSTEmployee).State = EntityState.Modified;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else
                {
                    TSTTicket newTicket = new TSTTicket();
                    newTicket.TicketSubject = "Profile Change Request";
                    string phone = (string.IsNullOrEmpty(tSTEmployee.Phone)) ? "Not Provided" : tSTEmployee.Phone;
                    newTicket.TicketDescription = string.Format(
                        "First Name: {0} <br /> Last Name: {1} <br /> Phone: {2} <br /> Email: {3}",
                        tSTEmployee.FName, tSTEmployee.LName, phone, tSTEmployee.Email
                        );
                    newTicket.TicketStatusID = 2;
                    newTicket.SubmittedByID = tSTEmployee.EmployeeID;
                    newTicket.SubmittedDate = DateTime.Now;
                    newTicket.Priority = 3;
                    db.TSTTickets.Add(newTicket);
                    db.SaveChanges();
                    return RedirectToAction("ChangeRequest");
                }
            }

            ViewBag.UserID = new SelectList(db.AspNetUsers, "Id", "Email", tSTEmployee.UserID);
            ViewBag.DeptID = new SelectList(db.TSTDepartments, "DeptId", "Name", tSTEmployee.DeptID);
            ViewBag.EmployeeStatusID = new SelectList(db.TSTEmployeeStatuses, "StatusID", "StatusName", tSTEmployee.EmployeeStatusID);
            return View(tSTEmployee);
        }

        [HttpPost]
        public JsonResult GetEmails(string Prefix)
        {
            var user = db.AspNetUsers.Where(u => u.UserName.StartsWith(Prefix)).Select(u => new List<string> { u.Id, u.UserName });

            return Json(user, JsonRequestBehavior.AllowGet);
        }

        // GET: Employees/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTEmployee tSTEmployee = db.TSTEmployees.Find(id);
            if (tSTEmployee == null)
            {
                return Redirect("~/Employees/NotFound");
            }
            return View(tSTEmployee);
        }

        // POST: Employees/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TSTEmployee tSTEmployee = db.TSTEmployees.Find(id);
            tSTEmployee.IsActive = !tSTEmployee.IsActive;

            if (string.IsNullOrEmpty(tSTEmployee.SeparationDate.ToString()))
            {
                tSTEmployee.SeparationDate = DateTime.Today;
            }

            db.Entry(tSTEmployee).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public ActionResult NotFound()
        {
            return View();
        }
        public ActionResult ChangeRequest()
        {
            return View();
        }
    }
}
