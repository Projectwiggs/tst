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
using TicketSupportTracker.Models;
using System.Net.Mail;

namespace TicketSupportTracker.UI.MVC.Controllers
{

    public class HomeController : Controller
    {
        private TSTProjectEntities db = new TSTProjectEntities();

        public ActionResult Index()
        {
            return View();
        }
        
        public JsonResult GetEmpPicture(string email)
        {
            var userPhoto = db.TSTEmployees.Single(u => u.Email == email).EmpPhoto;
            if (userPhoto != null)
            {
                return Json(userPhoto, JsonRequestBehavior.AllowGet);
            }
            else
                return Json("Not Found", JsonRequestBehavior.AllowGet);
        }

        
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpPost]
        public ActionResult Contact(string name, string bEmail, string message, bool copy)
        {
            Email evm = new Email();

            evm.Name = name;
            evm.BEmail = bEmail;
            evm.Message = message;
            evm.Copy = copy;

            string body = string.Format(
                "{0} <br />{1} <br /><br />{2}",
                evm.Name, evm.BEmail, evm.Message);

            //Create the Mail Message object
            //the envelope
            MailMessage msg = new MailMessage(
                "email@projectwiggs.com", //from address (smarterasp email demo)
                "austin.t.wiggins@outlook.com", //to address
                "TST - " + evm.Name + " has sent you a message",
                body);

            msg.IsBodyHtml = true;
            //this lets the dev embed HTML in the body of the email

            if (copy == true)
                msg.Bcc.Add(evm.BEmail);

            msg.ReplyToList.Add(evm.BEmail);
            //lets you hit reply and go back to the user of the form.

            //Create, configure, and use the smtpclient to send the email
            SmtpClient emailSender = new SmtpClient("mail.projectwiggs.com");

            emailSender.Credentials = new System.Net.NetworkCredential("email@projectwiggs.com", //username
                "@w12181997" //password
                );

            //send the email
            emailSender.Send(msg);
            //return View();

            //Redirect the user to the confirmation page
            return RedirectToAction("ContactSuccess", evm);
        }

        public ActionResult ContactSuccess(Email email)
        {
            return View(email);
        }
    }
}
