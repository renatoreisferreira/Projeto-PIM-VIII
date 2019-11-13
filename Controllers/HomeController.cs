using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.OleDb;


namespace ProjPIMVIII.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Manage()
        {
           ViewBag.Message = "Gerenciar Tarefas";
            return View();
        }
        public ActionResult About()
        {
            ViewBag.Message = "Sobre a equipe de trabalho.";

            return View();
        }
       
    }

    

}