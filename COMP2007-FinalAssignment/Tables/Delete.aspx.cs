using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Microsoft.AspNet.FriendlyUrls.ModelBinding;
using COMP2007_FinalAssignment.Models;

namespace COMP2007_FinalAssignment.Tables
{
    public partial class Delete : System.Web.UI.Page
    {
		protected COMP2007_FinalAssignment.Models.DefaultConnection _db = new COMP2007_FinalAssignment.Models.DefaultConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Delete methd to delete the selected Table item
        // USAGE: <asp:FormView DeleteMethod="DeleteItem">
        public void DeleteItem(int projectID)
        {
            using (_db)
            {
                var item = _db.Tables.Find(projectID);

                if (item != null)
                {
                    _db.Tables.Remove(item);
                    _db.SaveChanges();
                }
            }
            Response.Redirect("../Default");
        }

        // This is the Select methd to selects a single Table item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public COMP2007_FinalAssignment.Models.Table GetItem([FriendlyUrlSegmentsAttribute(0)]int? projectID)
        {
            if (projectID == null)
            {
                return null;
            }

            using (_db)
            {
	            return _db.Tables.Where(m => m.projectID == projectID).FirstOrDefault();
            }
        }

        protected void ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Cancel", StringComparison.OrdinalIgnoreCase))
            {
                Response.Redirect("../Default");
            }
        }
    }
}

