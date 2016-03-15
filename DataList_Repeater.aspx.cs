using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DataList_Repeater : System.Web.UI.Page
{
    DataClassesDataContext lnq_obj = new DataClassesDataContext();
    protected void Page_Load(object sender, EventArgs e)
     {
        if (IsPostBack)
            return;
        fill_data();
        fill_repeater();
        fill_repeater1();
        fill_repeater3();
    }
    private void fill_data()
    {
        var id = (from a in lnq_obj.pear_msts
                  select new
                  {
                      code = a.intglcode,
                      p_name = a.name,
                      img = "./upload/" + a.fhoto,
                      p_price = a.price
                  }).ToList();
        DataList1.DataSource = id;
        DataList1.DataBind();
    }
     private void fill_repeater()
    {
        var id = (from a in lnq_obj.repeater_heder_msts
                  select new
                  {
                      code = a.intglcode,
                      titel = a.titel,
                      name = a.name,
                      detils = a.Details,
                      img = "./upload/" + a.fhoto,

                  }).ToList();

        Repeater1.DataSource = id;
        Repeater1.DataBind();
    }
     private void fill_repeater1()
     {
         var id = (from a in lnq_obj.repeater_fotter_msts
                   select new
                   {

                       img = "./upload/" + a.fhoto,

                   }).ToList();
         Repeater2.DataSource = id;
         Repeater2.DataBind();
     }
     private void fill_repeater3()
     {
         var id = (from a in lnq_obj.repeater_heder_msts
                   select new
                   {
                       code = a.intglcode,
                      
                       img = "./upload/" + a.fhoto,

                   }).ToList();

         Repeater3.DataSource = id;
         Repeater3.DataBind();
     }
}