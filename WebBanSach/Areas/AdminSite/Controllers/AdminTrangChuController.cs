using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models.Common;
using WebBanSach.Models.EF;

namespace WebBanSach.Areas.AdminSite.Controllers
{
    public class AdminTrangChuController : Controller
    {
        QuanLyBanSachDbContext db = new QuanLyBanSachDbContext();
        // GET: AdminSite/AdminTrangChu
        [HasCredential(Quyen = 1)]
        public ActionResult Index()
        {

            return View();
        }

        [HasCredential(Quyen = 1)]
        [HttpPost]
        public JsonResult ThongKe()
        {
            List<ThongKe> tk = db.Database.SqlQuery<ThongKe>("SELECT sum(Tongtien) as TongTien from Giohangkh where YEAR(Ngaymua) = YEAR(GETDATE()) group by MONTH(Ngaymua) order by MONTH(Ngaymua)").ToList();
            decimal[] Tien = new decimal[12];
            for (int i = 0; i < tk.Count; i++)
            {
                Tien[i] = tk[i].TongTien;
            }
            return Json(Tien);
        }
    }
    public class ThongKe
    {
        public int Thang { get; set; }
        public decimal TongTien { get; set; }
    }
}