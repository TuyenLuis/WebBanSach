using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models.EF;
using PagedList;
using WebBanSach.Models.Common;

namespace WebBanSach.Areas.AdminSite.Controllers
{
    public class AdminQuanLySachController : Controller
    {
        QuanLyBanSachDbContext db = new QuanLyBanSachDbContext();
        // GET: AdminSite/AdminQuanLySach
        [HasCredential(Quyen = 1)]
        public ActionResult TatCaSach(int? page)
        {
            if (page == null) page = 1;
            var TatCaSach = db.Saches.ToList();
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            //List<Sach> TatCaSach = db.Saches.ToList();
            //ViewBag.TatCaSach = TatCaSach;
            return View(TatCaSach.ToPagedList(pageNumber, pageSize));
        }
        [HasCredential(Quyen = 1)]
        public ActionResult ThemSach()
        {

            var TatCaChuDe = db.Chudes.ToList();
            var TatCaTacGia = db.Tacgias.ToList();
            var TatCaNXB = db.Nhaxuatbans.ToList();
            ViewBag.TatCaChuDe = TatCaChuDe;
            ViewBag.TatCaTacGia = TatCaTacGia;
            ViewBag.TatCaNXB = TatCaNXB;
            return View();
        }
        [HttpPost]
        [HasCredential(Quyen = 1)]
        public ActionResult ThemSach(Sach sach, HttpPostedFileBase Hinhminhhoa)
        {
            if (ModelState.IsValid)
            {
                sach.Donvitinh = "VNĐ";
                if (Hinhminhhoa != null && Hinhminhhoa.ContentLength > 0)
                {
                    var TenAnh = Path.GetFileName(Hinhminhhoa.FileName);
                    var DuongDan = Path.Combine(Server.MapPath("~/Assets/images/"), TenAnh);
                    sach.Hinhminhhoa = TenAnh;
                    Hinhminhhoa.SaveAs(DuongDan);
                }
                else
                {
                    sach.Hinhminhhoa = "400x400.PNG";
                }
                sach.Ngaycapnhat = DateTime.Now;
                db.Saches.Add(sach);
                db.SaveChanges();
                return RedirectToAction("TatCaSach");
            }
            else
            {
                ViewBag.TatCaChuDe = db.Chudes.ToList(); ;
                ViewBag.TatCaTacGia = db.Tacgias.ToList();
                ViewBag.TatCaNXB = db.Nhaxuatbans.ToList();
                return View(sach);
            }


        }
        [HasCredential(Quyen = 1)]
        public ActionResult SuaSach(int MaSach)
        {
            var TatCaChuDe = db.Chudes.ToList();
            var TatCaTacGia = db.Tacgias.ToList();
            var TatCaNXB = db.Nhaxuatbans.ToList();
            ViewBag.TatCaChuDe = TatCaChuDe;
            ViewBag.TatCaTacGia = TatCaTacGia;
            ViewBag.TatCaNXB = TatCaNXB;

            //var sach = db.Saches.Join(db.Nhaxuatbans, s => s.Manxb, nxb => nxb.Manxb, (s, nxb) => s)
            //                          .Join(db.Chudes, s => s.Macd, chude => chude.Macd, (s, chude) => s)
            //                          .Join(db.Tacgias, s => s.Matacgia, tacgia => tacgia.Matacgia, (s, tacgia) => s)
            //                          .Where(s => s.Masach == MaSach)
            //                          .First();
            Sach sach = db.Saches.Find(MaSach);
            sach.Dongia = sach.Dongia != null ? sach.Dongia : 0;
            sach.Giakm = sach.Giakm != null ? sach.Giakm : 0;
            sach.Mota = sach.Mota != null ? sach.Mota : "không có mô tả";
            sach.Motangangon = sach.Motangangon != null ? sach.Motangangon : "không có mô tả";
            return View(sach);
        }
        [HttpPost]
        [HasCredential(Quyen = 1)]
        public ActionResult SuaSach(Sach sach, HttpPostedFileBase Hinhminhhoa)
        {

            var a = sach;
            if (Hinhminhhoa != null && Hinhminhhoa.ContentLength > 0)
            {
                var TenAnh = Path.GetFileName(Hinhminhhoa.FileName);
                var DuongDan = Path.Combine(Server.MapPath("~/Assets/images/"), TenAnh);
                sach.Hinhminhhoa = TenAnh;
                Hinhminhhoa.SaveAs(DuongDan);
            }
            sach.Donvitinh = "VNĐ";
            sach.Ngaycapnhat = DateTime.Now;
            var sachcu = db.Saches.Find(sach.Masach);
            db.Entry(sachcu).CurrentValues.SetValues(sach);
            db.SaveChanges();
            return RedirectToAction("TatCaSach");

        }
        [HttpPost]
        [HasCredential(Quyen = 1)]
        public JsonResult XoaSach(int MaSach)
        {
            try
            {
                Sach sach = db.Saches.Find(MaSach);
                var ct = db.ChiTietGioHangs.Where(x => x.Sach.Masach == sach.Masach);
                db.ChiTietGioHangs.RemoveRange(ct);
                db.Saches.Remove(sach);
                db.SaveChanges();
                return Json(new { status = true });
            }
            catch (Exception ex)
            {
                return Json(new { status = false });
            }

        }
        [HasCredential(Quyen = 1)]
        public ActionResult TimKiem(string TenSach, int? page)
        {
            ViewBag.CurrentFilter = TenSach;
            if (page == null) page = 1;
            int pageSize = 10;
            int pageNumber = (page ?? 1);
            List<Sach> lstSach = db.Saches.Where(x => x.Tensach.Contains(TenSach)).ToList();
            return View(lstSach.ToPagedList(pageNumber, pageSize));
        }
        [HasCredential(Quyen = 1)]
        public ActionResult ThemTacGia(string tenTG)
        {
            Tacgia tg = new Tacgia();
            tg.Tentacgia = tenTG;
            db.Tacgias.Add(tg);
            db.SaveChanges();
            return RedirectToAction("ThemSach");
        }
        [HasCredential(Quyen = 1)]
        public ActionResult ThemChuDe(string TenChuDe)
        {
            Chude cd = new Chude();
            cd.Tenchude = TenChuDe;
            db.Chudes.Add(cd);
            db.SaveChanges();
            return RedirectToAction("ThemSach");
        }
        [HasCredential(Quyen = 1)]
        public ActionResult ThemNXB(string TenNXB)
        {
            Nhaxuatban nxb = new Nhaxuatban();
            nxb.Tennxb = TenNXB;
            db.Nhaxuatbans.Add(nxb);
            db.SaveChanges();
            return RedirectToAction("ThemSach");
        }
    }
}