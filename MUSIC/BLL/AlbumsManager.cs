using MUSIC.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;

namespace MUSIC.BLL
{
    public class AlbumsManager
    {
        public static bool AddAlbum(Albums album)
        {
            using (var db = new OLMSDBEntities1())
            {
                db.Albums.Add(album);
                return db.SaveChanges() > 0;
            }
        }
        public static bool RemoveAlbum(int id)
        {
            using (var db = new OLMSDBEntities1())
            {
                var album = db.Albums.Where(a => a.AlbumId == id).FirstOrDefault();
                if (album == null)
                {
                    return false;
                }
                db.Albums.Remove(album);
                return db.SaveChanges() > 0;
            }
        }
        public static List<Albums> GetAll(int nowpage)
        {
            using (var db = new OLMSDBEntities1())
            {
                string sql = string.Format("select top 7 * from Albums where AlbumId not in (select top (({0}-1)*7) AlbumId from Albums order by AlbumId asc) order by AlbumId asc", nowpage);
                List<Albums> albums= db.Database.SqlQuery<Albums>(sql).ToList();
                List<Albums> albums1 = new List<Albums>();
                foreach (var item in albums)
                {
                    albums1.Add(db.Albums.Include("Genres").Include("Artists").Where(a=>a.AlbumId==item.AlbumId).FirstOrDefault());
                }
                return albums1;
            }
        }
        public static int GetSumCount()
        {
            using (var db = new OLMSDBEntities1())
            {
                return db.Albums.Count();
            }
        }
        public static Albums GetById(int id)
        {
            using (var db = new OLMSDBEntities1())
            {
                return db.Albums.Include("Genres").Include("Artists").Where(a => a.AlbumId == id).FirstOrDefault();
            }
        }
        public static bool UpdAlbum(Albums album, int id)
        {
            using (var db = new OLMSDBEntities1())
            {
                var alb = db.Albums.Include("Genres").Include("Artists").Where(a => a.AlbumId == id).FirstOrDefault();
                if (alb == null)
                {
                    return false;
                }
                alb.Price = album.Price;
                alb.ArtistId = album.ArtistId;
                alb.Title = album.Title;
                alb.GenreId = album.GenreId;
                alb.AlbumArtUrl = album.AlbumArtUrl;
                return db.SaveChanges() > 0;
            }
        }
    }
}