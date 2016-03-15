using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Pear : System.Web.UI.Page
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
        lnq_obj.insert_pear(txt_name.Text, fhoto_nm, txt_price.Text);
        lnq_obj.SubmitChanges();
    }
    private void fill_data()
    {
        var id = (from a in lnq_obj.pear_msts
                  select new
                  {
                      code = a.intglcode,
                      name=a.name,
                      fhoto_nm = "~/upload/" + a.fhoto,
                      price=a.price
                  }
           ).ToList();
        GridView1_shop.DataSource = id;
        GridView1_shop.DataBind();
    }
    protected void GridView1_shop_RowEditing(object sender, GridViewEditEventArgs e)
    {
        int code = Convert.ToInt32(GridView1_shop.DataKeys[e.NewEditIndex].Value.ToString());
        ViewState["code"] = code;
        var id = (from a in lnq_obj.pear_msts
                  where a.intglcode == code 
                  select a).Single();
        txt_name.Text = id.name;
        fhoto_nm = id.fhoto;
        txt_price.Text = id.price;
    }
    protected void GridView1_shop_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        lnq_obj.delete_pear(Convert.ToInt32(GridView1_shop.DataKeys[e.RowIndex].Value.ToString()));
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
        lnq_obj.update_pear(Convert.ToInt32(ViewState["code"].ToString()), txt_name.Text, fhoto_nm, txt_price.Text);
        lnq_obj.SubmitChanges();
        
        fill_data();
        Response.Redirect("DataList.aspx");
    }
}