using MUSIC.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MUSIC.BLL
{
    public class OrderDateilsManager
    {
        public static List<OrderDetails> GetByOrderId(int id) 
        {
            using(var db=new OLMSDBEntities1())
            {
                return db.OrderDetails.Include("Orders").Include("Albums").Where(o => o.Orders.OrderId == id).ToList();
            }
        }
    }
}