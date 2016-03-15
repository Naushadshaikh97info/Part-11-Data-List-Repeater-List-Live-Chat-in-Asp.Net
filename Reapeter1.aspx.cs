using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Reapeter1 : System.Web.UI.Page
{
    DataClassesDataContext lnq_obj = new DataClassesDataContext();
    static string fhoto_nm;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
            return;
        fill_data();
    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        if (FileUpload1.FileName != null)
        {
            FileUpload1.SaveAs(Request.PhysicalApplicationPath + "/upload/" + FileUpload1.FileName);
            fhoto_nm = FileUpload1.FileName;
        }
        lnq_obj.insert_repeater_fotto(fhoto_nm);
        lnq_obj.SubmitChanges();
        fill_data();
    }
    private void fill_data()
    {
        var id = (from a in lnq_obj.repeater_fotter_msts
                  select new
                  {
                      code = a.intglcode,
                      fhoto_nm = "~/upload/" + a.fhoto,
                  }).ToList();
        GridView1_repeater.DataSource = id;
        GridView1_repeater.DataBind();
    }

    protected void GridView1_repeater_RowEditing(object sender, GridViewEditEventArgs e)
    {

        int code = Convert.ToInt32(GridView1_repeater.DataKeys[e.NewEditIndex].Value.ToString());
        ViewState["code"] = code;
        var id = (from a in lnq_obj.repeater_fotter_msts
                  where a.intglcode == code
                  select a).Single();
        
        fhoto_nm = id.fhoto;
    }
    protected void GridView1_repeater_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        lnq_obj.delete_repeater_fotter(Convert.ToInt32(GridView1_repeater.DataKeys[e.RowIndex].Value.ToString()));
        lnq_obj.SubmitChanges();
        fill_data();
    }
    protected void btn_update_Click(object sender, EventArgs e)
    {
        if (FileUpload1.FileName != "")
        {
            FileUpload1.SaveAs(Request.PhysicalApplicationPath + "/upload/" + FileUpload1.FileName);
            fhoto_nm = FileUpload1.FileName;
        }
        lnq_obj.update_repeater_fotter_mst(Convert.ToInt32(ViewState["code"].ToString()),fhoto_nm);
        lnq_obj.SubmitChanges();

        fill_data();
        Response.Redirect("Repeater1.aspx");
    }
    protected void GridView1_repeater_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1_repeater.PageIndex = e.NewPageIndex;
        fill_data();
    }
}