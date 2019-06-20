using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models.Common;
using WebBanSach.Models.EF;
using WebBanSach.Models.Security;

namespace WebBanSach.Areas.AdminSite.Controllers
{
    public class AdminDangNhapController : Controller
    {
        private QuanLyBanSachDbContext db = new QuanLyBanSachDbContext();
        private SecurityPassWord sp = new SecurityPassWord();
        // GET: AdminSite/AdminDangNhap
        public ActionResult Index(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }
        [HttpPost]
        public ActionResult Login(UserLogin user, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                string pass_hash = sp.HashPass(user.Password);
                Khachhang khachang = db.Khachhangs.SingleOrDefault(kh => kh.Tendn == user.Username && kh.Matkhau == pass_hash);
                if (khachang != null && khachang.Quyen == 1)
                {
                    Session.Add("ADMIN_SESSION", khachang);
                    return RedirectToAction("TatCaSach", "AdminQuanLySach");
                }
            }
            return RedirectToAction("Index");

        }
        public ActionResult Logout()
        {
            Session.Remove("ADMIN_SESSION");
            return RedirectToAction("Index");
        }
    }
}