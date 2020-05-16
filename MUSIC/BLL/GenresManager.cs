using MUSIC.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MUSIC.BLL
{
    public class GenresManager
    {
        public static List<Genres> GetAllGenre()
        {
            using (var db = new OLMSDBEntities1())
            {
                return db.Genres.ToList();
            }
        }
        public static Genres GetGenreById(int id)
        {
            using (var db = new OLMSDBEntities1())
            {
                return db.Genres.Where(g=>g.GenreId==id).FirstOrDefault();
            }
        }
    }
}