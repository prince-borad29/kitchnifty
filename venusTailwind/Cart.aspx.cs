using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace venusTailwind
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void IncreaseQuantity1(object sender, EventArgs e)
        {
            int qty = Convert.ToInt32(lblQty1.Text);
            qty++;
            lblQty1.Text = qty.ToString();
            UpdateTotal();
        }

        protected void DecreaseQuantity1(object sender, EventArgs e)
        {
            int qty = Convert.ToInt32(lblQty1.Text);
            if (qty > 1)
            {
                qty--;
            }
            lblQty1.Text = qty.ToString();
            UpdateTotal();
        }

        protected void IncreaseQuantity2(object sender, EventArgs e)
        {
            int qty = Convert.ToInt32(lblQty2.Text);
            qty++;
            lblQty2.Text = qty.ToString();
            UpdateTotal();
        }

        protected void DecreaseQuantity2(object sender, EventArgs e)
        {
            int qty = Convert.ToInt32(lblQty2.Text);
            if (qty > 1)
            {
                qty--;
            }
            lblQty2.Text = qty.ToString();
            UpdateTotal();
        }

        private void UpdateTotal()
        {
            decimal price1 = Convert.ToDecimal(lblPrice1.Text) * Convert.ToInt32(lblQty1.Text);
            decimal price2 = Convert.ToDecimal(lblPrice2.Text) * Convert.ToInt32(lblQty2.Text);

            decimal total = price1 + price2;
            lblTotal.Text = total.ToString("0.00");
        }



    }
}