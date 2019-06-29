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
            //List<ThongKe> DuLieu = new List<ThongKe>();
            //for (int i = 1; i <= 12; i++)
            //{
            //    ThongKe DL = new ThongKe();
            //    DL.Thang = i;
            //    DL.TongTien = 0;
            //    DuLieu.Add(DL);
            //}
            List<ThongKe> DuLieu = db.Database.SqlQuery<ThongKe>("SELECT sum(Tongtien) as TongTien, MONTH(Ngaymua) as Thang from Giohangkh where YEAR(Ngaymua) = YEAR(GETDATE()) group by MONTH(Ngaymua) order by MONTH(Ngaymua)").ToList();
            decimal[] Tien = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
            //for (int i = 0; i < DuLieu.Count; i++)
            //{
            //    if(DuLieu[i].Thang == i)
            //    {
            //        Tien[i] = DuLieu[i].TongTien;
            //    }
            //}
            foreach(ThongKe t in DuLieu)
            {
                for (int i = 1; i <= 12; i++)
                {
                    if (t.Thang == i)
                    {
                        Tien[i] = t.TongTien;
                    }
                }
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