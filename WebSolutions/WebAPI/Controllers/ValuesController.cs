using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebAPI.Controllers
{
    /// <summary>
    /// 這是我的預設 Values API
    /// </summary>
    public class ValuesController : ApiController
    {
        /// <summary>
        /// 取得相關資料
        /// </summary>
        /// <returns></returns>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        /// <summary>
        /// 刪除資料
        /// </summary>
        /// <param name="id">傳入 Value 的 id</param>
        public void Delete(int id)
        {
        }
    }
}
