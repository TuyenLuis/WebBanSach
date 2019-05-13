using Facebook;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebBanSach.Models.Common;
using WebBanSach.Models.EF;
using WebBanSach.Models.Security;

namespace WebBanSach.Controllers
{
    public class DangNhapController : Controller
    {
        private QuanLyBanSachDbContext db = new QuanLyBanSachDbContext();
        private SecurityPassWord sp = new SecurityPassWord();
        // GET: DangNhap
        public ActionResult Index()
        {
            if (Session["user"] != null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return View();
            }
            
        }

        public ActionResult Login(UserLogin user)
        {
            if (ModelState.IsValid)
            {
                string pass_hash = sp.HashPass(user.Password);
                Khachhang khachHang = db.Khachhangs.SingleOrDefault(item => item.Tendn == user.Username && item.Matkhau == pass_hash);
                if (khachHang == null)
                {
                    ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không đúng. Xin kiểm tra lại!");
                } else
                {
                    Session.Add("USER_SESSION", khachHang);
                    return RedirectToAction("Index", "Home");
                }
            }
            return View("Index");
        }

        // beign fb
        private Uri RedirectUri
        {
            get
            {
                var uriBuilder = new UriBuilder(Request.Url);
                uriBuilder.Query = null;
                uriBuilder.Fragment = null;
                uriBuilder.Path = Url.Action("FacebookCallback");
                return uriBuilder.Uri;
            }
        }

        [AllowAnonymous]
        public ActionResult loginFB()
        {
            return View();
        }

        public ActionResult logout()
        {
            FormsAuthentication.SignOut();
            return View("Login");
        }

        [AllowAnonymous]
        public ActionResult Facebook()
        {
            var fb = new FacebookClient();
            var loginUrl = fb.GetLoginUrl(new
            {
                client_id = "530116780853982",
                client_secret = "380cfe5f0ab22004ce2ff07d3c6c5017",
                redirect_uri = RedirectUri.AbsoluteUri,
                response_type = "code",
                scope = "email" // Add other permissions as needed
            });

            return Redirect(loginUrl.AbsoluteUri);
        }

        public ActionResult FacebookCallback(string code)
        {
            var fb = new FacebookClient();
            dynamic result = fb.Post("oauth/access_token", new
            {
                client_id = "530116780853982",
                client_secret = "380cfe5f0ab22004ce2ff07d3c6c5017",
                redirect_uri = RedirectUri.AbsoluteUri,
                code = code
            });

            var accessToken = result.access_token;

            // Store the access token in the session for farther use
            Session["AccessToken"] = accessToken;

            // update the facebook client with the access token so 
            // we can make requests on behalf of the user
            fb.AccessToken = accessToken;

            // Get the user's information
            dynamic me = fb.Get("me?fields=id,name,email,birthday,gender");
            string email = me.email;
            string name = me.name;
            string birthday = me.birthday;
            string gender = me.gender; 



            Khachhang khachHang = db.Khachhangs.SingleOrDefault(item => item.Email == email);
            if (khachHang == null)
            {
                // set khach hang login fb
                khachHang = new Khachhang();
                khachHang.Email = email;
                khachHang.Hotenkh = name;
                khachHang.Quyen = 2;
                khachHang.Ngaysinh = Convert.ToDateTime( birthday);
                if (gender == "male")
                {
                    khachHang.Gioitinh = true;
                }
                else
                {
                    khachHang.Gioitinh = false;
                }
                

                db.Khachhangs.Add(khachHang);
                db.SaveChanges();

                Session.Add("USER_SESSION", khachHang);
            }
            else
            {
                Session.Add("USER_SESSION", khachHang);
            }

            // Set the auth cookie
            FormsAuthentication.SetAuthCookie(email, false);
            return RedirectToAction("Index", "Home");
        }

        // end fb

        public ActionResult DangXuat()
        {
            Session.Remove("USER_SESSION");
            return RedirectToAction("Index", "Home");
        }
    }
}