using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Repeater : System.Web.UI.Page
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
        lnq_obj.insert_repeater_heder_mst(txt_titel.Text, txt_Name.Text, txt_details.Text, fhoto_nm);
        lnq_obj.SubmitChanges();
        fill_data();
    }
    private void fill_data()
    {
        var id = (from a in lnq_obj.repeater_heder_msts
                  select new
                  {
                      code = a.intglcode,
                      titel = a.titel,
                      name = a.name,
                      details = a.Details,
                      fhoto_nm = "~/upload/" + a.fhoto,
                  }).ToList();
        GridView1_repeater.DataSource = id;
        GridView1_repeater.DataBind();
    }
    protected void GridView1_repeater_RowEditing(object sender, GridViewEditEventArgs e)
    {

        int code = Convert.ToInt32(GridView1_repeater.DataKeys[e.NewEditIndex].Value.ToString());
        ViewState["code"] = code;
        var id = (from a in lnq_obj.repeater_heder_msts
                  where a.intglcode == code
                  select a).Single();
        txt_details.Text = id.Details;
        txt_Name.Text = id.name;
        txt_details.Text = id.Details;
        fhoto_nm = id.fhoto;
    }
    protected void GridView1_repeater_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        lnq_obj.delete_repeater_heder(Convert.ToInt32(GridView1_repeater.DataKeys[e.RowIndex].Value.ToString()));
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
        lnq_obj.update_repeater_hederr_mst(Convert.ToInt32(ViewState["code"].ToString()), txt_titel.Text, txt_Name.Text, txt_details.Text, fhoto_nm);
        lnq_obj.SubmitChanges();

        fill_data();
        Response.Redirect("Repeater.aspx");
    }
}