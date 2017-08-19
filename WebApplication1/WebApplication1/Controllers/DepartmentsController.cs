using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TST.EF;
using Microsoft.AspNet.Identity;

namespace TicketSupportTracker.Controllers
{
    public class DepartmentsController : Controller
    {
        private TSTProjectEntities db = new TSTProjectEntities();

        // GET: Departments
        [Authorize]
        public ActionResult Index()
        {
            if (User.IsInRole("Admin") || User.IsInRole("Technician"))
            {
                return View(db.TSTDepartments.ToList());
            }
            else
            {
                return View(db.TSTDepartments.ToList().Where(d => d.IsActive == true));
            }
        }

        // GET: Departments/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: Departments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "DeptId,Name,Description,IsActive")] TSTDepartment tSTDepartment)
        {
            if (ModelState.IsValid)
            {
                db.TSTDepartments.Add(tSTDepartment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tSTDepartment);
        }

        // GET: Departments/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TSTDepartment tSTDepartment = db.TSTDepartments.Find(id);
            if (tSTDepartment == null)
            {
                return RedirectToAction("NotFound");
            }
            return View(tSTDepartment);
        }

        // POST: Departments/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "DeptId,Name,Description,IsActive")] TSTDepartment tSTDepartment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tSTDepartment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tSTDepartment);
        }

        // GET: Departments/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            TSTDepartment tSTDepartment = db.TSTDepartments.Find(id);
            if (tSTDepartment == null)
            {
                return RedirectToAction("NotFound");
            }
            else
            {
                tSTDepartment.IsActive = !tSTDepartment.IsActive;
                db.Entry(tSTDepartment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
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
    }
}
