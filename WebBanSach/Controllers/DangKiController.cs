using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models.EF;
using WebBanSach.Models.Security;

namespace WebBanSach.Controllers
{
    public class DangKiController : Controller
    {
        private QuanLyBanSachDbContext db = new QuanLyBanSachDbContext();
        private SecurityPassWord sp = new SecurityPassWord();

        // GET: DangKi
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult ThemTaiKhoan(Khachhang user)
        {
            try
            {
                Khachhang khachHang = db.Khachhangs.SingleOrDefault(item => item.Email == user.Email);
                if (khachHang == null)
                {
                    //process pass
                    string pass_hash = sp.HashPass(user.Matkhau);
                    user.Matkhau = pass_hash;

                    user.Quyen = 2;
                    db.Khachhangs.Add(user);
                    db.SaveChanges();

                    if (Session["USER_SESSION"] == null)
                    {
                        Session.Add("USER_SESSION", user);
                    }
                    else
                    {
                        Session["USER_SESSION"] = user;
                    }
                }
                return Json(new { status = true });
            }
            catch (Exception ex)
            {
                return Json(new { status = false });
            }
        }
    }
}