using MUSIC.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MUSIC.BLL
{
    public class UsersManager
    {
        public static List<Users> GetAllUser()
        {
            using (var db = new OLMSDBEntities1())
            {
                return db.Users.Include("Roles").ToList();
            }
        }
        public static Users UserLogin(string username,string userpwd) 
        {
            using(var db=new OLMSDBEntities1())
            {
                var user = db.Users.Where(u => u.LoginId == username & u.LoginPwd == userpwd).FirstOrDefault();
                return user;
            }
        }
        public static bool UserRegist(Users user)
        {
            using (var db = new OLMSDBEntities1())
            {
                db.Users.Add(user);
                return db.SaveChanges() > 0;
            }
        }
        public static bool AddUser(Users user)
        {
            using (var db = new OLMSDBEntities1())
            {
                db.Users.Add(user);
                return db.SaveChanges() > 0;
            }
        }
        public static bool RemoveUser(int id)
        {
            using (var db = new OLMSDBEntities1())
            {
                var user = db.Users.Where(a => a.UserId == id).FirstOrDefault();
                if (user == null)
                {
                    return false;
                }
                db.Users.Remove(user);
                return db.SaveChanges() > 0;
            }
        }
        public static List<Users> GetAll(int nowpage)
        {
            using (var db = new OLMSDBEntities1())
            {
                string sql = string.Format("select top 7 * from Users where UserId not in (select top (({0}-1)*7) UserId from Users order by UserId asc) order by UserId asc", nowpage);
                List<Users> users = db.Database.SqlQuery<Users>(sql).ToList();
                List<Users> users1 = new List<Users>();
                foreach (var item in users)
                {
                    users1.Add(db.Users.Include("Roles").Where(a => a.UserId == item.UserId).FirstOrDefault());
                }
                return users1;
            }
        }
        public static int GetSumCount()
        {
            using (var db = new OLMSDBEntities1())
            {
                return db.Users.Count();
            }
        }
        public static Users GetById(int id)
        {
            using (var db = new OLMSDBEntities1())
            {
                return db.Users.Include("Roles").Where(a => a.UserId == id).FirstOrDefault();
            }
        }
        public static bool UpdUser(int roleid, int userid)
        {
            using (var db = new OLMSDBEntities1())
            {
                var user1 = db.Users.Include("Roles").Where(a => a.UserId == userid).FirstOrDefault();
                if (user1 == null)
                {
                    return false;
                }
                user1.RoleId = roleid;
                return db.SaveChanges() > 0;
            }
        }
        public static bool UpdUserStatu(int statuid, int userid)
        {
            using (var db = new OLMSDBEntities1())
            {
                var user1 = db.Users.Include("Roles").Where(a => a.UserId == userid).FirstOrDefault();
                if (user1 == null)
                {
                    return false;
                }
                user1.UserStatus = statuid;
                return db.SaveChanges() > 0;
            }
        }
    }
}