using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebBanSach.Models.Common;
using WebBanSach.Models.EF;

namespace WebBanSach.Controllers
{
    public class ChiTietSachController : Controller
    {
        QuanLyBanSachDbContext db = new QuanLyBanSachDbContext();
        private const string CartSession = "CART_SESSION";
        // GET: ChiTietSach
        public ActionResult Index(int ID)
        {
            var sach = db.Saches.SingleOrDefault(item => item.Masach == ID);
            if (sach == null)
            {
                Response.StatusCode = 404;
                Response.StatusDescription = "Không có sách này";
            }
            return View(sach);
        }

        [HttpPost]
        public JsonResult AddToCart(int productID, int quantity)
        {
            var listProductInCart = Session[CartSession];
            var listItem = new List<CartItem>();

            if (listProductInCart == null)
            {
                var product = new CartItem();
                product.Product = db.Saches.SingleOrDefault(item => item.Masach == productID);
                product.Quantity = quantity;
                listItem.Add(product);
            }
            else
            {
                listItem = (List<CartItem>)listProductInCart;
                bool isExisting = listItem.Exists(item => item.Product.Masach == productID);
                if (isExisting)
                {
                    var product = listItem.SingleOrDefault(item => item.Product.Masach == productID);
                    product.Quantity += quantity;
                }
                else
                {
                    var product = new CartItem();
                    product.Product = db.Saches.SingleOrDefault(item => item.Masach == productID);
                    product.Quantity = quantity;
                    listItem.Add(product);
                }
            }
            Session[CartSession] = listItem;
            return Json(new { status = true });
        }

        public ActionResult TotalPrice()
        {
            var lstItemInCart = Session["CART_SESSION"] as List<CartItem>;
            decimal tongtien = 0;
            if (lstItemInCart != null)
            {
                foreach (var item in lstItemInCart)
                {
                    tongtien += item.Product.Giakm != null ? (decimal)item.Product.Giakm * item.Quantity : (decimal)item.Product.Dongia * item.Quantity;
                }
            }
            return Json(tongtien, JsonRequestBehavior.AllowGet);
        }
    }
}