using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Security;
using System.Web.Mvc;
using TST.EF;
using Microsoft.AspNet.Identity;
using TicketSupportTracker.UI.MVC.Models;

namespace TicketSupportTracker.Controllers
{
    public class TicketsController : Controller
    {
        private TSTProjectEntities db = new TSTProjectEntities();


        public JsonResult AddTechNote(int ticketId, string note)
        {
            //get the ticket associated with the record ID (passed to method)
            TSTTicket ticket = db.TSTTickets.Single(x => x.TicketID == ticketId);

            //get the current logged on employee as the technician. This code only works because we have our tstemployees tale tied to our identity users table.
            //tSTEmployee.Email == aspnet.Email
            //tSTEmployee.UserId == Identity.Id
            TSTEmployee tech = db.TSTEmployees.Single(x => x.Email == User.Identity.Name);

            //make sure the tstemployee object is not null.
            if (tech != null)
            {

                if (ticket.TSTTechNotes.Count == 0)
                {
                    ticket.TechID = tech.EmployeeID;
                }

                //create the tstnote object
                //using initialization syntax assign values
                TSTTechNote newNote = new TSTTechNote()
                {
                    TicketID = ticketId,
                    TechID = tech.EmployeeID,
                    NotationDate = DateTime.Now,
                    Notation = note
                };


                //send the note to ef as well as set ticket to modified
                db.TSTTechNotes.Add(newNote);
                db.Entry(ticket).State = EntityState.Modified;

                //save the note to the database.
                db.SaveChanges();

                var data = new
                {
                    //on the fly variable = newNote.Property
                    TechNotes = newNote.Notation,
                    Tech = newNote.TSTEmployee.FullName,
                    Date = string.Format("{0:g}", newNote.NotationDate)
                };
                //send the note stuff back to the browseer to be parsed
                return Json(data, JsonRequestBehavior.AllowGet);
            }
            return null;
        }


        // GET: Tickets
        public ActionResult Index()
        {
            if (User.IsInRole("Technician") || User.IsInRole("Admin"))
            {
                var tSTTickets = db.TSTTickets.Include(t => t.TicketStatus).Include(t => t.TSTEmployee).Include(t => t.TSTEmployee1).Include(t => t.TSTTicketPriority);
                return View(tSTTickets.ToList().OrderBy(t => t.TicketStatusID).ThenBy(t => t.Priority).ThenBy(t => t.SubmittedDate));
            }
            else if (db.TSTTickets.ToList().Where(t => t.TSTEmployee.UserID == User.Identity.GetUserId() && t.TicketStatusID != 5).Count() > 0)
            {
                var tSTTickets = db.TSTTickets.Include(t => t.TicketStatus).Include(t => t.TSTEmployee).Include(t => t.TSTEmployee1).Include(t => t.TSTTicketPriority);
                return View(tSTTickets.ToList().Where(t => t.TSTEmployee.UserID == User.Identity.GetUserId()).Where(t => t.TicketStatusID < 5)
                    .OrderBy(t => t.TicketStatusID).ThenBy(t => t.Priority).ThenBy(t => t.SubmittedDate));
            }
            else
                return Redirect("~/Tickets/NoTickets");
        }

        // GET: Tickets/Details/5
        public ActionResult Details(int? id)
        {
            TSTTicket tSTTicket = db.TSTTickets.Find(id);
            if (tSTTicket == null)
            {
                return RedirectToAction("NotFound");
            }
            else if (db.TSTTickets.Find(id).TSTEmployee.UserID == User.Identity.GetUserId() || User.IsInRole("Technician") || User.IsInRole("Admin"))
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                return View(tSTTicket);
            }
            else
                return Redirect("~/Home/Index");
        }

        // GET: Tickets/Create
        public ActionResult Submit()
        {

            ViewBag.TicketStatusID = new SelectList(db.TicketStatuses, "TicketStatusID", "Name");
            ViewBag.SubmittedByID = new SelectList(db.TSTEmployees, "EmployeeID", "FName");
            ViewBag.TechID = new SelectList(db.TSTEmployees, "EmployeeID", "FName");
            ViewBag.Priority = new SelectList(db.TSTTicketPriorities, "PriorityID", "Name");
            return View();
        }

        // POST: Tickets/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Submit([Bind(Include = "TicketID,TicketSubject,TicketDescription,Attachment")] TSTTicket tSTTicket, HttpPostedFileBase attchmnt)
        {
            if (ModelState.IsValid)
            {
                if (attchmnt != null)
                {
                    //create a new uniqe file name and add the extension
                    string file = Guid.NewGuid().ToString() + attchmnt.FileName.Substring(attchmnt.FileName.LastIndexOf('.')).ToLower();

                    //save it to the webserver (website/content/images/productimages)
                    attchmnt.SaveAs(Server.MapPath("~/Content/attachments/" + file));

                    tSTTicket.Attachment = file;
                }
                //No matter what send the file name (either be the default name or the new image name)
                tSTTicket.TicketStatusID = 1;
                tSTTicket.SubmittedDate = DateTime.Now;
                tSTTicket.SubmittedByID = db.TSTEmployees.ToList().Where(e => e.UserID == User.Identity.GetUserId()).Single().EmployeeID;
                tSTTicket.Priority = 2;
                db.TSTTickets.Add(tSTTicket);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tSTTicket);
        }

        // GET: Tickets/Edit/5
        public ActionResult Edit(int? id)
        {
            if (User.IsInRole("Technician") || User.IsInRole("Admin"))
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                TSTTicket tSTTicket = db.TSTTickets.Find(id);
                if (tSTTicket == null)
                {
                    return RedirectToAction("NotFound");
                }
                ViewBag.TicketStatusID = new SelectList(db.TicketStatuses, "TicketStatusID", "Name", tSTTicket.TicketStatusID);
                ViewBag.SubmittedByID = new SelectList(db.TSTEmployees, "EmployeeID", "FName", tSTTicket.SubmittedByID);
                ViewBag.TechID = new SelectList(db.TSTEmployees, "EmployeeID", "FName", tSTTicket.TechID);
                ViewBag.Priority = new SelectList(db.TSTTicketPriorities, "PriorityID", "Name", tSTTicket.Priority);
                return View(tSTTicket);
            }
            else
                return Redirect("~/Home/Index");
        }

        // POST: Tickets/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TicketID,TicketStatusID,TicketSubject,TicketDescription,SubmittedDate,ResolvedDate,SubmittedByID,TechID,Attachment,Priority")] TSTTicket tSTTicket)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tSTTicket).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TicketStatusID = new SelectList(db.TicketStatuses, "TicketStatusID", "Name", tSTTicket.TicketStatusID);
            ViewBag.SubmittedByID = new SelectList(db.TSTEmployees, "EmployeeID", "FName", tSTTicket.SubmittedByID);
            ViewBag.TechID = new SelectList(db.TSTEmployees, "EmployeeID", "FName", tSTTicket.TechID);
            ViewBag.Priority = new SelectList(db.TSTTicketPriorities, "PriorityID", "Name", tSTTicket.Priority);
            return View(tSTTicket);
        }

        // GET: Tickets/Delete/5
        public ActionResult Close(int? id, int statusId)
        {
            if (User.IsInRole("Technician") || User.IsInRole("Admin") || db.TSTTickets.Find(id).TSTEmployee.UserID == User.Identity.GetUserId())
            {

                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                TSTTicket tSTTicket = db.TSTTickets.Find(id);
                ViewBag.TStatus = db.TicketStatuses.Find(statusId);
                if (tSTTicket == null)
                {
                    return RedirectToAction("NotFound");
                }
                return View(tSTTicket);
            }
            else
                return Redirect("~/Home/Index");
        }

        // POST: Tickets/Close/5
        public ActionResult CloseConfirmed(int id, int statusId)
        {
            TSTTicket tSTTicket = db.TSTTickets.Find(id);
            if ((User.IsInRole("Admin") || User.IsInRole("Technician")) && (statusId == 3 || statusId == 4))
            {
                tSTTicket.TicketStatusID = statusId;
                tSTTicket.ResolvedDate = DateTime.Now;
                db.Entry(tSTTicket).State = EntityState.Modified;
                db.SaveChanges();
            }
            else if (User.Identity.Name == tSTTicket.TSTEmployee.Email && statusId == 5)
            {
                tSTTicket.TicketStatusID = statusId;
                tSTTicket.ResolvedDate = DateTime.Now;
                db.Entry(tSTTicket).State = EntityState.Modified;
                db.SaveChanges();
            }
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

        public ActionResult NoTickets()
        {
            return View();
        }

        public ActionResult NotFound()
        {
            return View();
        }
    }
}
