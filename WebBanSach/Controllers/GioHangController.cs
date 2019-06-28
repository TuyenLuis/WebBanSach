using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models.Common;
using WebBanSach.Models.EF;

namespace WebBanSach.Controllers
{
    public class GioHangController : Controller
    {
        QuanLyBanSachDbContext db = new QuanLyBanSachDbContext();
        // GET: GioHang
        public ActionResult Index()
        {
            var lstItemInCart = Session["CART_SESSION"] as List<CartItem>;
            return View(lstItemInCart);
        }

        [HttpPost]
        public JsonResult XoaSanPham(int productID)
        {
            try
            {
                var lstItemInCart = Session["CART_SESSION"] as List<CartItem>;
                var productRemoved = lstItemInCart.Single(item => item.Product.Masach == productID);
                lstItemInCart.Remove(productRemoved);
                Session["CART_SESSION"] = lstItemInCart;
                return Json(new { status = true });
            }
            catch(Exception ex)
            {
                return Json(new { status = false });
            }
        }

        [HttpPost]
        public JsonResult XoaNhieuSanPham(int[] listProduct)
        {
            try
            {
                var listItemInCart = Session["CART_SESSION"] as List<CartItem>;
                foreach(int productID in listProduct)
                {
                    var productRemoved = listItemInCart.Single(item => item.Product.Masach == productID);
                    listItemInCart.Remove(productRemoved);
                }
                Session["CART_SESSION"] = listItemInCart;
                return Json(new { status = true });
            }
            catch (Exception ex)
            {
                return Json(new { status = false });
            }
        }

        [HttpPost]
        public JsonResult ThanhToan( string name, string phone, string email, string address)
        {
            try
            {
                var lstItemInCart = Session["CART_SESSION"] as List<CartItem>;
                var user = Session["USER_SESSION"] as Khachhang;
                decimal tongtien = 0;
                #region Phần gửi mail
                string mailFrom = "nhom8congngheweb@gmail.com";
                string passMail = "nhom8congngheweb1234";
                NetworkCredential basicCredential = new NetworkCredential(mailFrom, passMail);
                SmtpClient client = new SmtpClient("smtp.gmail.com", 25);
                MailMessage mail = new MailMessage();
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = basicCredential;
                // Mail gui
                if (email != null)
                {
                    mail.From = new MailAddress(mailFrom);
                    mail.CC.Add(new MailAddress(email.ToLower()));
                    mail.Subject = "Xác nhận thanh toán";
                    string body = "Qúy khách đã mua những sách sau <br>";
                    if (lstItemInCart != null)
                    {
                        //add to database
                        Giohangkh hoaDon = new Giohangkh();
                        hoaDon.Makh = user.Makh;
                        hoaDon.Ngaymua = DateTime.Now;
                        
                        // add to database and write mail content
                        List<int> tempList = new List<int>();
                        foreach (var item in lstItemInCart)
                        {
                            body += "- " + item.Product.Tensach + ". Đơn giá: " + item.Product.Dongia + ". Số lượng: " + item.Quantity + " <br>";
                            tongtien += item.Product.Giakm == null ? item.Product.Dongia.Value * item.Quantity : item.Product.Giakm.Value * item.Quantity;
                            tempList.Add(item.Product.Masach);

                            ChiTietGioHang chiTiet = new ChiTietGioHang();
                            chiTiet.GiohangkhID = hoaDon.GiohangkhID;
                            chiTiet.Masach = item.Product.Masach;
                            chiTiet.Soluong = item.Quantity;
                            chiTiet.Thanhtien = item.Product.Giakm == null ? item.Product.Dongia.Value * item.Quantity : item.Product.Giakm.Value * item.Quantity;
                            db.ChiTietGioHangs.Add(chiTiet);
                        }
                        body += "Tổng tiền thanh toán là: " + tongtien;
                        hoaDon.Tongtien = tongtien;
                        db.Giohangkhs.Add(hoaDon);
                        db.SaveChanges();

                        // remove session
                        int[] rmList = tempList.ToArray();
                        foreach (var item in rmList)
                        {
                            var productRemoved = lstItemInCart.Single(x => x.Product.Masach == item);
                            lstItemInCart.Remove(productRemoved);
                        }
                    }
                    Session["CART_SESSION"] = lstItemInCart;
                    mail.Body = body;
                    mail.IsBodyHtml = true;
                    mail.SubjectEncoding = System.Text.Encoding.UTF8;
                    mail.BodyEncoding = System.Text.Encoding.UTF8;
                    try
                    {
                        client.Send(mail);
                        //isSent = true;
                    }
                    catch (Exception e)
                    {
               
                    }
                }
                #endregion

                return Json(new { status = true });
            }
            catch (Exception ex)
            {
                return Json(new { status = false });
            }
        }
    }
}