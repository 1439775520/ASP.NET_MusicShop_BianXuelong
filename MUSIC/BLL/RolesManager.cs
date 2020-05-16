using MUSIC.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MUSIC.BLL
{
    public class RolesManager
    {
        public static bool AddRole(Roles role)
        {
            using (var db = new OLMSDBEntities1())
            {
                db.Roles.Add(role);
                return db.SaveChanges() > 0;
            }
        }
        public static bool RemoveRole(int id)
        {
            using (var db = new OLMSDBEntities1())
            {
                var role = db.Roles.Where(a => a.RoleId == id).FirstOrDefault();
                if (role == null)
                {
                    return false;
                }
                db.Roles.Remove(role);
                return db.SaveChanges() > 0;
            }
        }
        public static List<Roles> GetAll(int nowpage)
        {
            using (var db = new OLMSDBEntities1())
            {
                string sql = string.Format("select top 7 * from Roles where RoleId not in (select top (({0}-1)*7) RoleId from Roles order by RoleId asc) order by RoleId asc", nowpage);
                return db.Database.SqlQuery<Roles>(sql).ToList();
            }
        }
        public static int GetSumCount()
        {
            using (var db = new OLMSDBEntities1())
            {
                return db.Roles.Count();
            }
        }
        public static List<Roles> GetAllRole()
        {
            using (var db = new OLMSDBEntities1())
            {
                return db.Roles.ToList();
            }
        }
        public static Roles GetById(int id)
        {
            using (var db = new OLMSDBEntities1())
            {
                return db.Roles.Where(a => a.RoleId == id).FirstOrDefault();
            }
        }
        public static bool UpdRole(Roles role, int id)
        {
            using (var db = new OLMSDBEntities1())
            {
                var nowrole = db.Roles.Where(a => a.RoleId == id).FirstOrDefault();
                if (nowrole == null)
                {
                    return false;
                }
                nowrole.Name = role.Name;
                return db.SaveChanges() > 0;
            }
        }
    }
}