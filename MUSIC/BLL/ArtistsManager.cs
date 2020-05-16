using MUSIC.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MUSIC.BLL
{
    public class ArtistsManager
    {
        public static bool AddArtist(Artists artist) 
        {
            using(var db=new OLMSDBEntities1())
            {
                db.Artists.Add(artist);
                return db.SaveChanges() > 0;
            }
        }
        public static bool RemoveArtist(int id)
        {
            using (var db = new OLMSDBEntities1())
            {
                var artist = db.Artists.Where(a => a.ArtistId == id).FirstOrDefault();
                if (artist == null)
                {
                    return false;
                }
                db.Artists.Remove(artist);
                return db.SaveChanges() > 0;
            }
        }
        public static List<Artists> GetAll(int nowpage)
        {
            using (var db = new OLMSDBEntities1())
            {
                string sql = string.Format("select top 7 * from Artists where ArtistId not in (select top (({0}-1)*7) ArtistId from Artists order by ArtistId asc) order by ArtistId asc",nowpage);
                return db.Database.SqlQuery<Artists>(sql).ToList();
            }
        }
        public static int GetSumCount()
        {
            using (var db = new OLMSDBEntities1())
            {
                return db.Artists.Count();
            }
        }
        public static List<Artists> GetAllType()
        {
            using (var db = new OLMSDBEntities1())
            {
                return db.Artists.ToList();
            }
        }
        public static Artists GetById(int id)
        {
            using (var db = new OLMSDBEntities1())
            {
                return db.Artists.Where(a => a.ArtistId == id).FirstOrDefault();
            }
        }
        public static bool UpdArtist(Artists artist,int id)
        {
            using (var db = new OLMSDBEntities1())
            {
                var art= db.Artists.Where(a => a.ArtistId == id).FirstOrDefault();
                if (art == null)
                {
                    return false;
                }
                art.Name = artist.Name;
                return db.SaveChanges() > 0;
            }
        }
    }
}