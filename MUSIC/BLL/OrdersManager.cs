using MUSIC.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MUSIC.BLL
{
    public class OrdersManager
    {
        public static List<Orders> GetOrderByStatu(int statu)
        {
            using(var db=new OLMSDBEntities1())
            {
                return db.Orders.Where(o => o.OrderStatus == statu).ToList();
            }
        }
        public static int GetOrderCountByStatu(int statu)
        {
            using (var db = new OLMSDBEntities1())
            {
                return db.Orders.Where(o => o.OrderStatus == statu).Count();
            }
        }
        public static bool UpdOrderStatuByOrderId(int orderid,int statu)
        {
            using(var db=new OLMSDBEntities1())
            {
                var order = db.Orders.Where(o => o.OrderId == orderid).FirstOrDefault();
                if (order == null)
                {
                    return false;
                }
                order.OrderStatus = statu;
                return db.SaveChanges() > 0;
            }
        }
    }
}