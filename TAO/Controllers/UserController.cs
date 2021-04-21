using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TAO.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public string Index()
        {
            return "default UserController";
        }

        // GET: /User/Welcome
        public string Welcome()
        {
            return "Welcomea ction";
        }
    }
}