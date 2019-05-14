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
    public class LienHeController : Controller
    {
        // GET: LienHe
        private QuanLyBanSachDbContext db = new QuanLyBanSachDbContext();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult LienHe()
        {
            string name = Request.Form["userName"];
            string email = Request.Form["userEmail"];
            string phone = Request.Form["userPhone"];
            string msg = Request.Form["userMsg"];
            #region Phần gửi mail
            string mailFrom = "thienthansiwon@gmail.com";
            string passMail = "hathikimbien31081998";//Tối điền
            var lstItemInCart = Session["CART_SESSION"] as List<CartItem>;
            int tongtien = 0;
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
                    List<int> tempList = new List<int>();
                    foreach (var item in lstItemInCart)
                    {
                        body += "- " + item.Product.Tensach + ". Đơn giá: " + item.Product.Dongia + ". Số lượng: " + item.Quantity + " <br>";
                        tongtien += (int)item.Product.Dongia * (int)item.Quantity;
                        tempList.Add(item.Product.Masach);
                    }
                    body += "Tổng tiền thanh toán là: " + tongtien;
                    int[] rmList = tempList.ToArray();
                    foreach (var item in rmList)
                    {
                        var productRemoved = lstItemInCart.Single(x => x.Product.Masach == item);
                        lstItemInCart.Remove(productRemoved);
                    }
                }
                body += "Tổng tiền thanh toán là: " + tongtien;
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
            return RedirectToAction("Index", "Home");
        }
    }
}