using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace TicketSupportTracker.Models
{
    public class Email
    {
        [Display(Name = "Your Name:")]
        [Required(ErrorMessage = "** Your name is required.")]
        public string Name { get; set; }

        [Display(Name = "Your Email:")]
        [Required(ErrorMessage = "** An email is required for responding.")]
        [EmailAddress(ErrorMessage = "** Must be an email address")]
        public string BEmail { get; set; }

        [Display(Name = "Message?")]
        [Required(ErrorMessage = "** You must have a message to be able contact.")]
        [MinLength(50, ErrorMessage = "** Your message is too short, sorry for any inconvenience. Minimum: 50 characters.")]
        [UIHint("MultilineText")]
        public string Message { get; set; }

        [Display(Name = "Send a copy to your email?")]
        public bool Copy { get; set; }
    }
}