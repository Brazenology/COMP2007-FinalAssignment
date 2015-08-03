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
    public partial class Edit : System.Web.UI.Page
    {
		protected COMP2007_FinalAssignment.Models.DefaultConnection _db = new COMP2007_FinalAssignment.Models.DefaultConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This is the Update methd to update the selected Table item
        // USAGE: <asp:FormView UpdateMethod="UpdateItem">
        public void UpdateItem(int  projectID)
        {
            using (_db)
            {
                var item = _db.Tables.Find(projectID);

                if (item == null)
                {
                    // The item wasn't found
                    ModelState.AddModelError("", String.Format("Item with id {0} was not found", projectID));
                    return;
                }

                TryUpdateModel(item);

                if (ModelState.IsValid)
                {
                    // Save changes here
                    _db.SaveChanges();
                    Response.Redirect("../Default");
                }
            }
        }

        // This is the Select method to selects a single Table item with the id
        // USAGE: <asp:FormView SelectMethod="GetItem">
        public COMP2007_FinalAssignment.Models.Table GetItem([FriendlyUrlSegmentsAttribute(0)]int? projectID)
        {
            if (projectID == null)
            {
                return null;
            }

            using (_db)
            {
                return _db.Tables.Find(projectID);
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
