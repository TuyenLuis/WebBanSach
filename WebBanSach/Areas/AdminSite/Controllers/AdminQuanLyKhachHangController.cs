using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models.Common;
using WebBanSach.Models.EF;
using PagedList;

namespace WebBanSach.Areas.AdminSite.Controllers
{
    public class AdminQuanLyKhachHangController : Controller
    {
        QuanLyBanSachDbContext db = new QuanLyBanSachDbContext();
        // GET: AdminSite/AdminQuanLyKhachHang
        [HasCredential(Quyen = 1)]
        public ActionResult TatCaKhachHang(int ? page)
        {
            if (page == null) page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            var TatCaKhachHang = db.Khachhangs
                                 .OrderByDescending(kh => kh.Hotenkh)
                                 .ToList();
            return View(TatCaKhachHang.ToPagedList(pageNumber, pageSize));
        }
        [HasCredential(Quyen = 1)]
        public ActionResult ThemKhachHang()
        {
            return View();
        }
        [HasCredential(Quyen = 1)]
        public ActionResult SuaKhachHang()
        {
            return View();
        }
    }
}