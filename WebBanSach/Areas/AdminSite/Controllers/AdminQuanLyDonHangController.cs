using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models.Common;
using WebBanSach.Models.EF;

namespace WebBanSach.Areas.AdminSite.Controllers
{
    public class AdminQuanLyDonHangController : Controller
    {
        QuanLyBanSachDbContext db = new QuanLyBanSachDbContext();
        // GET: AdminSite/AdminQuanLyDonHang
        [HasCredential(Quyen = 1)]
        public ActionResult Index(int? page)
        {
            if (page == null) page = 1;
            var DonHang = db.Giohangkhs.ToList();
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            return View(DonHang.ToPagedList(pageNumber, pageSize));
        }
        [HasCredential(Quyen = 1)]
        [HttpPost]
        public JsonResult ChiTietDonHang(int MaDonHang)
        {
            List<ChiTietGioHang> ChiTiet = db.ChiTietGioHangs.Where(x => x.GiohangkhID == MaDonHang).ToList();
            List<ChiTietDonHang> data = new List<ChiTietDonHang>();
            foreach(ChiTietGioHang ct in ChiTiet)
            {
                ChiTietDonHang DonHang = new ChiTietDonHang();
                DonHang.ChitietgiohangID = ct.ChitietgiohangID;
                DonHang.GiohangkhID = ct.GiohangkhID;
                DonHang.Masach = ct.Masach;
                DonHang.Soluong = ct.Soluong;
                DonHang.Thanhtien = ct.Thanhtien;
                DonHang.TenSach = ct.Sach.Tensach;
                DonHang.DonGia = ct.Sach.Dongia;
                data.Add(DonHang);
            }
            return Json(data);
        }
    }
    public class ChiTietDonHang
    {
        public int ChitietgiohangID { get; set; }

        public int? GiohangkhID { get; set; }

        public int? Masach { get; set; }

        public int? Soluong { get; set; }
        public decimal? DonGia { get; set; }

        public decimal? Thanhtien { get; set; }

        public string TenSach { get; set; }

    }
}
