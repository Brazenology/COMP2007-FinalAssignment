using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using COMP2007_FinalAssignment.Models;

namespace COMP2007_FinalAssignment.Tables
{
    public partial class Default : System.Web.UI.Page
    {
		protected COMP2007_FinalAssignment.Models.DefaultConnection _db = new COMP2007_FinalAssignment.Models.DefaultConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // Model binding method to get List of Table entries
        // USAGE: <asp:ListView SelectMethod="GetData">
        public IQueryable<COMP2007_FinalAssignment.Models.Table> GetData()
        {
            return _db.Tables;
        }
    }
}

